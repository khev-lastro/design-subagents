# Intelligent Suggestion Notifications — Casa da Lais

**Compiled:** February 2026
**Grounded in:** Lais modules (Atende / Reengaja / Visita / Casa da Lais), 5 research reports, Brazilian PropTech context
**Format per notification:** ID · Trigger · Message · Business Rules · UX Pattern · Channel · Suppression

---

## Taxonomy

### Notification types (design system)

| Symbol | Pattern | When |
|--------|---------|------|
| 📋 | **Insight Banner** | Between header and content, relates to current view |
| 🔵 | **Row Nudge** | Badge on a specific lead/property row |
| 🃏 | **Suggestion Card** | Floating bottom-right, rich content with data strip |
| 💬 | **Slide-in Toast** | Temporary, post-action, bottom-center |

### Accent color logic

- **Purple** → AI / Lais-generated analysis
- **Amber** → Urgent, time-sensitive, risk of loss
- **Green** → Opportunity detected
- **Blue** → Informational, data quality, discovery

---

## Group A — Pipeline Velocity (Lais Visita)

---

### N-01 · Lead Sem Contato — Janela de 2 Horas
**Color:** Amber · **Pattern:** Row Nudge

**Trigger conditions:**
- Lead criado há 2h+ com 0 interações registradas
- Broker está logado ou ativo no app nesse momento
- Lead não foi marcado como "aguardando retorno" ou "inativo"

**Message:**
> "Nenhum contato com **[Nome]** ainda. Leads abordados em até 2h convertem 3× mais — agende agora enquanto o interesse é fresco."

**CTA:** `[Agendar via Lais Visita]` `[Enviar mensagem]`

**Business rules:**
- Threshold: 2h após criação para o primeiro alerta; escala para banner se chegar a 4h sem contato
- NÃO disparar se: lead veio via Lais Atende e já está em fluxo ativo de conversa
- NÃO disparar se: broker tem 5+ leads criados no mesmo dia (priorizar os mais antigos, não empilhar)
- Reassert: dispara novamente às 24h se ainda sem contato, com mensagem mais urgente

---

### N-02 · Visita Concluída — Sem Próximo Passo
**Color:** Green · **Pattern:** Slide-in Toast

**Trigger conditions:**
- Visita marcada como "realizada" via Lais Visita
- Nenhuma proposta criada E nenhum follow-up agendado em até 4 horas após o status de conclusão
- Lead status ≠ "perdido" ou "desistiu"

**Message:**
> "Visita com **[Nome]** concluída. Enquanto a impressão está fresca, que tal enviar uma proposta ou travar o próximo contato?"

**CTA:** `[Criar proposta]` `[Agendar follow-up]`

**Business rules:**
- Delay: 4h após marcação de visita concluída (não imediatamente — dar tempo ao broker para processar)
- NÃO disparar se: broker adicionou nota na última 1h (sinal de que está ativo com esse lead)
- Escala: se ignorado, vira Row Nudge (amber) no dia seguinte às 9h

---

### N-03 · Duas Visitas, Nenhuma Proposta
**Color:** Amber · **Pattern:** Row Nudge + Banner

**Trigger conditions:**
- Lead tem 2+ visitas concluídas E 0 propostas enviadas
- Última visita há menos de 7 dias
- Lead status ≠ "em análise de financiamento", "aguardando documentação", ou outro bloqueador legítimo

**Message:**
> "**[Nome]** visitou 2 imóveis e ainda não recebeu proposta. Leads nessa fase convertem 40% mais quando recebem oferta formal em até 48h."

**CTA:** `[Enviar proposta agora]`

**Business rules:**
- Verificação de status de bloqueio: campos "motivo de espera" ou tags como "aguardando FGTS", "precisa de co-signatário" suprimem o alerta
- Não mostra para leads com proposta rascunho já aberta (considera como "em andamento")

---

### N-04 · Proposta Enviada — Sem Resposta em 48h
**Color:** Amber · **Pattern:** Row Nudge + Push

**Trigger conditions:**
- Proposta enviada via sistema há 48h+ sem resposta registrada (aceite, recusa, ou pedido de alteração)
- Lead status ≠ "negociando" (que indicaria contato fora do sistema)

**Message:**
> "**[Nome]** não respondeu à proposta enviada há 2 dias. Um follow-up com uma perspectiva nova — como novo imóvel similar mais barato — pode destravar a decisão."

**CTA:** `[Ligar agora]` `[Enviar mensagem]` `[Adiar 24h]`

**Business rules:**
- Escala: 48h = Row Nudge, 72h = Push notification, 96h = Banner "lead em risco"
- "Adiar 24h" reseta o clock sem suprimir permanentemente
- Supressão: se broker logou um contato (ligação, mensagem) no período — mesmo que sem resposta do lead — o alerta é suprimido por 24h adicionais

---

### N-05 · Lead em Alta Intenção — Visita Não Agendada
**Color:** Green · **Pattern:** Suggestion Card

**Trigger conditions (qualquer um dos abaixo):**
- Lead visualizou 3+ imóveis do portfólio da imobiliária em 24h
- Histórico de WhatsApp/Lais Atende contém keywords de alta intenção: "quero visitar", "posso ver", "quando está disponível", "tenho interesse"
- Lead marcou 2+ imóveis como favorito no portal conectado
- Lead que estava dormente há 21+ dias abriu link de imóvel

**Message:**
> "🔥 **[Nome]** está mostrando sinais de alta intenção hoje. Agende uma visita enquanto o interesse está no pico."

**Data strip:** `Imóveis vistos: 3 · Último acesso: há 2h · Budget estimado: R$450K–600K`

**CTA:** `[Agendar via Lais Visita]` `[Ver histórico de interesse]`

**Business rules:**
- Confidence scoring: dispara apenas quando 2+ sinais coincidem (1 sinal = Row Nudge leve, 3+ sinais = Card + Push)
- NÃO disparar se visita já está agendada para os próximos 7 dias
- Janela de expiração: card desaparece em 6h se não interagido (interesse de lead é volátil)

---

## Group B — Reengajamento Dormante (Lais Reengaja)

---

### N-06 · Alerta de Dormência — 14 Dias
**Color:** Amber · **Pattern:** Row Nudge

**Trigger conditions:**
- Lead sem nenhuma interação (ligação, mensagem, visita, e-mail, proposta) há exatamente 14 dias
- Lead status ≠ "perdido", "desqualificado", "arquivado", "vendido"
- Último contato não foi tentativa ignorada pelo broker (lead respondeu e depois sumiu = dispara; broker tentou e lead não respondeu = espera até 21 dias)

**Message:**
> "14 dias sem contato com **[Nome]**. Um check-in simples pode reativar o interesse antes que ele encontre outro corretor."

**CTA:** `[Iniciar Lais Reengaja]` `[Enviar mensagem manual]` `[Adiar 7 dias]`

**Business rules:**
- Diferencia cenários: se o broker tentou e o lead não respondeu, o alerta só vem no dia 21 (lead tem a bola); se nenhum dos dois agiu, vem no dia 14
- "Adiar 7 dias" = válido 3 vezes máximo; na 4ª vez, o sistema sugere arquivar

---

### N-07 · Lote de Leads Dormentes — Campanha Reengaja
**Color:** Amber · **Pattern:** Dashboard Card

**Trigger conditions:**
- Broker tem 5+ leads com 21+ dias de inatividade simultaneamente
- Dispara uma vez por semana, no dia de menor atividade do broker (aprendido por padrão de uso)

**Message:**
> "Você tem **[N] leads** sem notícias há mais de 3 semanas. Uma campanha de reengajamento via Lais Reengaja pode recuperar 15–20% deles."

**Data strip:** `Potencial estimado: R$[X em valor de pipeline] · Leads com maior chance: [Top 3 nomes]`

**CTA:** `[Ativar Lais Reengaja para todos]` `[Revisar individualmente]` `[Ignorar esta semana]`

**Business rules:**
- Prioriza leads pelo score de "último nível de engajamento": quem visitou imóveis tem prioridade sobre quem só fez contato inicial
- NÃO misturar leads de diferentes estágios numa mesma campanha; o sistema deve segmentá-los automaticamente por temperatura
- Limite: 1 card por semana. Se broker ignorou 3 semanas seguidas, reduz para bienal e sinaliza "pipeline em risco" para o gerente

---

### N-08 · Dormência Crítica — 30 Dias
**Color:** Amber · **Pattern:** Row Nudge (mais forte que N-06)

**Trigger conditions:**
- Lead sem interação há 30 dias
- Lead tem histórico de pelo menos 1 visita ou proposta (não é lead frio desde sempre)

**Message:**
> "**[Nome]** está há 30 dias sem responder. Abordagem direta recomendada: 'Você ainda está procurando? O mercado mudou e tenho algo novo para você.'"

**CTA:** `[Enviar mensagem de reengajamento]` `[Arquivar lead]` `[Mover para campanha de longa duração]`

**Business rules:**
- Tom diferente de N-06: mensagem mais direta, urgência real
- "Campanha de longa duração" = entra em fluxo de contato mensal automatizado (low-touch nurture)
- Se lead visita imóvel após esse alerta mas não responde = voltar ao dia 0 do dormancy clock

---

### N-09 · Sugestão de Arquivamento — 90 Dias
**Color:** Blue · **Pattern:** Suggestion Card

**Trigger conditions:**
- Lead dormante há 90+ dias E nunca completou uma visita (só contato inicial)

**Message:**
> "**[Nome]** está há 90 dias sem interação e nunca visitou um imóvel. Leads nessa fase raramente convertem. Quer arquivar ou tentar uma última mensagem com atualização de mercado?"

**CTA:** `[Arquivar]` `[Enviar atualização de mercado]`

**Business rules:**
- NÃO disparar para leads que tiveram visita concluída (esses têm histórico real de interesse — tratados por N-08)
- Arquivar ≠ deletar: lead fica em base de dormentes, acessível para campanhas sazonais (N-22, N-23)
- Dispara apenas 1x por lead; não repete

---

### N-10 · Momentum Pós-Venda — Reengajamento
**Color:** Green · **Pattern:** Slide-in Toast

**Trigger conditions:**
- Broker registrou venda/fechamento há 30 minutos
- Broker tem 5+ leads dormentes (21+ dias) no pipeline

**Message:**
> "Parabéns pelo fechamento! Com esse pique, é o melhor momento para retomar os **[N] leads** que estão esperando. Energia de fechamento é contagiante — use-a agora."

**CTA:** `[Revisar leads dormentes]` `[Ativar Lais Reengaja]`

**Business rules:**
- Timing: 30 minutos após registro de venda (não imediato — deixar o broker celebrar)
- NÃO disparar se broker tem outros leads em estágio de fechamento ativo (foco não deve se dividir)
- Psicologia: aproveita o estado emocional positivo pós-fechamento para motivar ação

---

## Group C — Gestão de Imóveis

---

### N-11 · Novo Imóvel Coincide com Perfil de Leads
**Color:** Green · **Pattern:** Insight Banner

**Trigger conditions:**
- Novo imóvel cadastrado E sua combinação bairro + tipo + quartos + preço coincide com preferências de 2+ leads ativos

**Match algorithm:**
- Localização: mesmo bairro OU raio de 3km
- Preço: dentro de ±15% do budget declarado do lead
- Tipo: exato (apartamento, casa, cobertura)
- Quartos: ±1 do solicitado

**Message:**
> "Novo imóvel cadastrado: **[Endereço]**. Ele corresponde ao perfil de **[N] leads** — quer enviar propostas agora?"

**Data strip:** `Lead 1: [Nome] · R$[budget] · Lead 2: [Nome] · R$[budget] · +[N] outros`

**CTA:** `[Enviar para todos]` `[Revisar e enviar]` `[Ignorar]`

**Business rules:**
- NÃO disparar para leads que já têm proposta ativa para outro imóvel similar
- "Enviar para todos" via Lais Atende de forma personalizada por lead, não broadcast genérico
- Janela: dispara dentro de 1h do cadastro do imóvel para aproveitar a novidade

---

### N-12 · Imóvel Estagnado — Preço Desatualizado
**Color:** Blue · **Pattern:** Row Nudge

**Trigger conditions:**
- Imóvel com status "ativo" há 60+ dias
- Preço não alterado nos últimos 60 dias
- 0 visitas nos últimos 30 dias

**Message:**
> "**[Imóvel X]** está publicado há 60 dias sem visitas. O mercado pode ter se movido — vale revisar o preço para aumentar o interesse?"

**CTA:** `[Atualizar preço]` `[Ver comparativos]` `[Marcar como inativo]`

**Business rules:**
- Dispara no máximo 1× por 30 dias por imóvel
- NÃO disparar para imóveis com visita agendada nos próximos 7 dias
- Supressão: se dono do imóvel pediu "não alterar preço" (tag especial) = suprimir

---

### N-13 · Demanda Alta no Mesmo Imóvel
**Color:** Amber · **Pattern:** Insight Banner

**Trigger conditions:**
- 3+ leads diferentes solicitaram visita ou demonstraram interesse no mesmo imóvel nos últimos 7 dias

**Message:**
> "⚡ **[Imóvel X]** tem 3 clientes interessados simultaneamente. Primeiro a formalizar proposta tem vantagem — envie ofertas antes que alguém perca o interesse."

**CTA:** `[Ver leads interessados]` `[Enviar propostas em lote]`

**Business rules:**
- NÃO fabricar urgência: só dispara se os 3 leads são de brokers diferentes (mercado real de concorrência) OU se a imobiliária tem leads de diferentes corretores no mesmo imóvel
- Apenas 1× por imóvel por semana para não criar ansiedade artificial

---

### N-14 · Imóvel Incompleto — Progresso Inline (Passive)
**Color:** Blue · **Pattern:** Inline Progress (passive, não intrusivo)

**Trigger conditions:**
- Imóvel cadastrado com completeness score <60% (fotos, descrição, preço, ou planta faltando)

**Behavior:**
- Não é uma notificação ativa — é uma barra de progresso persistente no card do imóvel mostrando "Perfil: 45% completo"
- Clicar expande checklist dos itens faltando
- Efeito Zeigarnik: a incompletude visível gera tensão cognitiva que puxa o broker a completar

**Business rules:**
- Passivo por design: nunca dispara como alerta. Só existe como elemento sempre visível no card
- Checklist: Fotos (mín. 3) · Preço · Descrição · Número de quartos/banheiros · Disponibilidade

---

## Group D — Transferência de Propriedade & Remarketing de Longo Prazo

---

### N-15 · Comprador Anterior — Janela de Upgrade (18–24 meses)
**Color:** Green · **Pattern:** Suggestion Card

**Trigger conditions:**
- Cliente registrado como "comprador concluído" comprou imóvel via agência há 18–24 meses
- Nenhuma interação ou lead novo registrado para esse cliente nos últimos 12 meses
- Cliente tem consentimento LGPD registrado para contato futuro (`consentimento_contato_futuro = true`)

**Message:**
> "**[Nome]** comprou com você há **[X meses]**. Compradores costumam iniciar a busca pelo segundo imóvel — upgrade, imóvel de renda, ou imóvel para filhos — entre 18 e 36 meses. É um momento natural para um contato de relacionamento."

**Context strip:** `Imóvel comprado: [Endereço] · Valor: R$[X] · Data: [mês/ano]`

**CTA:** `[Ligar agora]` `[Enviar mensagem de relacionamento]` `[Adiar 3 meses]`

**Business rules:**
- NÃO ligar com pitch de venda direta: primeiro contato deve ser de relacionamento puro (perguntar como está, como foi a adaptação ao imóvel)
- Dispara mensalmente no "aniversário" do fechamento entre 18–36 meses
- Requer campo "data de fechamento" preenchido no CRM + campo "cliente comprador" ativo
- LGPD obrigatório: só dispara se `consentimento_contato_futuro = true`

---

### N-16 · Janela FGTS — Leads Bloqueados por Financiamento
**Color:** Amber · **Pattern:** Dashboard Card

**Trigger conditions:**
- Data = junho a agosto (janela de aniversário FGTS)
- Broker tem leads com tags: "aguardando FGTS", "necessita financiamento", "crédito pendente", "voltará em breve" OU histórico de notas/WhatsApp menciona "financiamento" + estagnação

**Message:**
> "Julho é o mês do FGTS — muitos clientes que estavam bloqueados por crédito podem estar prontos agora. **[N] leads** seus têm histórico de dificuldade de financiamento. É o momento ideal para uma retomada."

**CTA:** `[Ver leads qualificados]` `[Iniciar Lais Reengaja com foco em financiamento]`

**Business rules:**
- Dispara 1× por ano, na primeira segunda-feira de junho
- Filtra automaticamente leads que já avançaram para proposta ou fechamento
- Mensagem sugerida ao lead: "Oi [Nome], você sabia que muita gente usa o FGTS de aniversário para facilitar o financiamento? Mudou algo na sua situação financeira? Queria te mostrar algumas opções novas."

---

### N-17 · Locatário → Potencial Comprador
**Color:** Green · **Pattern:** Row Nudge

**Trigger conditions:**
- Lead ou cliente cadastrado como "locatário" (alugou via agência ou foi registrado como inquilino)
- Tempo no aluguel ≥ 18 meses (calculado pelo campo `data_inicio_locacao`)
- Não foi prospectado como comprador nos últimos 6 meses

**Message:**
> "**[Nome]** está alugando há **[X meses]**. Inquilinos nesse tempo frequentemente começam a considerar comprar — uma conversa sobre custo comparativo pode abrir uma nova oportunidade."

**CTA:** `[Iniciar abordagem de compra]` `[Registrar como lead comprador]`

**Business rules:**
- Baseado no mercado brasileiro: aluguel médio consome 30–40% da renda; após 18 meses, o math de "comprar vs. alugar" tende a favorecer a compra
- NÃO disparar se locatário está em contrato recente (menos de 6 meses do fim do contrato = timing ruim)
- NÃO disparar se cliente tem histórico de renda incompatível com financiamento

---

### N-18 · Valorização de Patrimônio — Base de Clientes
**Color:** Green · **Pattern:** Insight Banner

**Trigger conditions:**
- Dados de mercado indexados (integração com FIPE ZAP, OLX Imóveis, ou portais parceiros) mostram valorização >8% em bairro específico nos últimos 6 meses
- Agência tem clientes ou leads com imóveis nesse bairro registrados no CRM

**Message:**
> "Imóveis no **[Bairro X]** valorizaram **12%** nos últimos 6 meses. Você tem **[N] clientes** com imóveis nessa região — pode ser uma ótima entrada para uma conversa sobre patrimônio deles."

**CTA:** `[Ver clientes na região]` `[Preparar relatório de valorização]`

**Business rules:**
- Requer integração ativa com fonte de dados de preço
- Requer campo `bairro_imovel_atual` preenchido para os clientes
- LGPD: só inclui clientes com consentimento de contato futuro
- NÃO disparar mais de 1× por trimestre por bairro para não tornar-se spam de "mercado aquecido"

---

### N-19 · Vendedor → Lead de Compra (Pós-Venda do Imóvel do Cliente)
**Color:** Green · **Pattern:** Suggestion Card

**Trigger conditions:**
- Cliente vendeu imóvel via agência (registrado como "vendedor/proprietário")
- 3–6 meses após a venda concluída
- Nenhum lead novo registrado para esse cliente como comprador

**Message:**
> "**[Nome]** vendeu o imóvel há **[X meses]**. Vendedores costumam estar reinvestindo — comprando novo imóvel, mudando de cidade, ou buscando imóvel de renda. Você tem mantido contato?"

**CTA:** `[Registrar como lead comprador]` `[Verificar interesse]` `[Marcar como não aplicável]`

**Business rules:**
- Timing: não disparar imediatamente após a venda (processo de mudança é caótico); aguardar 90 dias mínimo
- Dispara 1× no período 3–6 meses; se ignorado, tentativa final no mês 9 pós-venda
- Exceção: se cliente vendeu para comprar outro imóvel via mesma agência (já está no pipeline como comprador) = não disparar

---

## Group E — Lais Atende / Sinais de IA

---

### N-20 · Drop-Off em Conversa da Lais Atende
**Color:** Amber · **Pattern:** Insight Banner

**Trigger conditions:**
- Lead encerrou ou ficou sem responder uma conversa com a Lais Atende
- Conversa durou <3 minutos sem resultado (visita agendada, proposta, ou resposta positiva)
- Última mensagem foi do lead (não da Lais), indicando que o lead está esperando algo mais

**Message:**
> "Um lead saiu da conversa com a Lais sem agendar visita. Pode ter sido uma dúvida específica não respondida — quer ver o histórico e retomar manualmente?"

**CTA:** `[Ver conversa]` `[Retomar atendimento manual]` `[Ignorar]`

**Business rules:**
- Dispara dentro de 15 minutos do drop-off detectado
- Inclui snippet das últimas 2 mensagens do lead no card para contexto imediato
- NÃO disparar se o lead saiu de forma natural (ex.: "obrigado, vou pensar" = encerramento voluntário, não drop-off)

---

### N-21 · Lead de Alta Prioridade Detectado pela Lais
**Color:** Amber · **Pattern:** Suggestion Card + Push

**Trigger conditions (qualquer um dos abaixo em conversa com Lais Atende):**
- Menção de valor acima de R$800K
- Frases: "compra à vista", "comprando agora", "preciso urgente", "contrato pronto"
- Localização premium detectada + budget alto
- Lead menciona que está vendo imóveis com outros corretores (urgência competitiva)

**Message:**
> "🔥 Lead de alta prioridade detectado. **[Nome]** mencionou **[compra à vista / urgência / alto valor]** na conversa com a Lais. Atendimento humano imediato recomendado."

**CTA:** `[Assumir atendimento agora]` `[Ver conversa completa]`

**Business rules:**
- Dispara em até 2 minutos da detecção — timing crítico
- Push notification mesmo que broker esteja offline
- NÃO encerrar a conversa da Lais Atende: ela continua enquanto o broker não assume; transição suave
- Sinal de urgência competitiva ("estou vendo com outros") = prioridade máxima, dispara independente de outras supressões

---

### N-22 · Queda de Velocidade de Resposta — Alerta para Gestor
**Color:** Amber · **Pattern:** Dashboard Card (visão gerencial)

**Trigger conditions:**
- Corretor X tem tempo médio de resposta a leads nos últimos 7 dias >30% acima da baseline pessoal (últimos 30 dias)
- Gerente/dono está logado no modo gestor

**Message:**
> "**[Carlos]** está respondendo leads **35% mais devagar** esta semana (média atual: 4h · baseline: 2h08min). Pode ser um bom momento para uma conversa de suporte."

**CTA:** `[Ver pipeline do Carlos]` `[Enviar mensagem interna]`

**Business rules:**
- Framing: suporte, não vigilância — "conversa de suporte", não alert de performance
- NÃO mostrar ranking comparativo entre corretores sem opt-in explícito da equipe
- Dispara 1× por semana máximo por corretor; não acumula alertas

---

## Group F — Campanhas Sazonais

---

### N-23 · Pós-Carnaval — Mercado Aquece
**Color:** Green · **Pattern:** Dashboard Card

**Trigger conditions:**
- Data = 1–15 de março
- Broker tem 10+ leads dormentes de Q4 do ano anterior

**Message:**
> "O mercado imobiliário historicamente acelera pós-Carnaval — março é um dos meses mais ativos do ano. Você tem **[N] leads** de fim de ano que podem estar prontos para retomar. Este é o momento."

**CTA:** `[Ver leads elegíveis]` `[Criar campanha Lais Reengaja]`

**Business rules:**
- Dispara 1× no dia 2 de março; não repete no mesmo ano
- Se Carnaval cair depois do dia 5 de março, dispara na semana seguinte ao feriado

---

### N-24 · Janela de Decisão de Fim de Ano — Novembro
**Color:** Amber · **Pattern:** Dashboard Card

**Trigger conditions:**
- Data = 1–30 de novembro
- Broker tem leads com status "em análise" ou "aguardando" estagnados há 30+ dias

**Message:**
> "Novembro é o mês da decisão: compradores que querem fechar antes do ano-novo estão mais receptivos a uma proposta final. Você tem **[N] leads** indecisos — uma abordagem de fechamento pode funcionar agora."

**CTA:** `[Ver leads elegíveis]` `[Iniciar campanha de fechamento]`

**Business rules:**
- Dispara 1× no dia 1 de novembro; não repete

---

## Group G — Qualidade de Dados & Compliance

---

### N-25 · Dados Incompletos — Risco LGPD
**Color:** Blue · **Pattern:** Row Nudge

**Trigger conditions:**
- Lead tem nome + telefone MAS está faltando: e-mail OU registro de consentimento LGPD (`consentimento_contato = null`)
- Broker tenta incluir esse lead em campanha de e-mail ou Lais Reengaja

**Message:**
> "**[N] leads** não têm consentimento LGPD registrado. Sem esse dado, você não pode incluí-los em campanhas. Complete agora para não perder oportunidades."

**CTA:** `[Completar dados]` `[Exportar lista para contato manual]`

**Business rules:**
- NÃO bloquear o broker de trabalhar com o lead — apenas alertar
- Dispara apenas quando o broker tenta acionar uma campanha, não aleatoriamente
- Batch: mostra todos os leads afetados de uma vez (não um por um)

---

## Business Rules Transversais — Fatigue Management

| Regra | Valor |
|-------|-------|
| Máximo de triggers por sessão | 3 |
| Máximo por hora (usuário ativo) | 1 |
| Máximo por dia (todos os canais) | 5 |
| Cooldown entre triggers | 2 minutos mínimo |
| Após 2 dismissals seguidos | Pausa não-críticos por 2h |
| Taxa de abertura abaixo de 20% em 7 dias | Reduzir frequência em 30% |
| Durante digitação ativa em formulário | Nunca disparar |

### Hierarquia de prioridade

Quando múltiplos triggers são elegíveis ao mesmo tempo, disparar o de maior prioridade e suprimir o resto:

1. Lead de alta prioridade / urgência competitiva (N-21)
2. Follow-ups vencidos / leads sem contato > 24h (N-01, N-04)
3. Visita concluída sem próximo passo (N-02, N-03)
4. Reengajamento dormante crítico (N-08)
5. Oportunidade de imóvel novo / matching (N-11)
6. Dados de propriedade estagnada (N-12, N-13)
7. Campanhas de longo prazo / sazonais (N-23, N-24)

---

## Gaps que requerem pesquisa adicional

Dois ângulos que ficaram com lacunas de dados brasileiros específicos:

1. **Quando compradores brasileiros iniciam busca por segundo imóvel** — há evidência do padrão americano (18–36 meses), mas dados do mercado brasileiro (ABECIP, Secovi-SP) poderiam calibrar N-15 com mais precisão local.

2. **Taxa de conversão locatário → comprador no Brasil pós-2023** — o cenário de aluguel subiu significativamente em 2023–2025; os thresholds de N-17 (18 meses) podem precisar de ajuste.

---

*Relatório compilado em fevereiro de 2026*
*Baseado em: suporte.lais.ai, lais.ai, ai-smart-suggestions-research-report.md, lais-smart-trigger-synthesis-report.md, optimal-engagement-windows-report.md, smart-trigger-suggestions-report.md, brazilian-proptech-onboarding-report.md*
