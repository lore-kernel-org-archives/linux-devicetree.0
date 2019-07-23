Return-Path: <SRS0=xFQm=VU=nvidia.com=skomatineni@kernel.org>
Subject: Re: [PATCH V6 16/21] soc/tegra: pmc: Add pmc wake support for
 tegra210
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-17-git-send-email-skomatineni@nvidia.com>
 <0b3d08ea-4633-8a54-ba66-c3f3146a1ece@gmail.com>
 <ca32c2d8-d752-3ecd-3a3f-232366730c7b@gmail.com>
 <b575ca93-9f34-b07a-1234-ef1ea2a6ddee@gmail.com>
From: Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <71a88a9c-a542-557a-0eaa-3c90112dee0e@nvidia.com>
Date: Mon, 22 Jul 2019 18:52:03 -0700
MIME-Version: 1.0
In-Reply-To: <b575ca93-9f34-b07a-1234-ef1ea2a6ddee@gmail.com>
Content-Type: multipart/alternative;
	boundary="------------6E3681EE0DA113047FBB8BB5"
Content-Language: en-US
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--------------6E3681EE0DA113047FBB8BB5
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 7/22/19 6:41 PM, Dmitry Osipenko wrote:
> 23.07.2019 4:08, Dmitry Osipenko пишет:
>> 23.07.2019 3:58, Dmitry Osipenko пишет:
>>> 21.07.2019 22:40, Sowjanya Komatineni пишет:
>>>> This patch implements PMC wakeup sequence for Tegra210 and defines
>>>> common used RTC alarm wake event.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>   drivers/soc/tegra/pmc.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 111 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>> index 91c84d0e66ae..c556f38874e1 100644
>>>> --- a/drivers/soc/tegra/pmc.c
>>>> +++ b/drivers/soc/tegra/pmc.c
>>>> @@ -57,6 +57,12 @@
>>>>   #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>>>>   #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
>>>>   #define  PMC_CNTRL_MAIN_RST		BIT(4)
>>>> +#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
>> Please follow the TRM's bits naming.
>>
>> PMC_CNTRL_LATCHWAKE_EN
>>
>>>> +#define PMC_WAKE_MASK			0x0c
>>>> +#define PMC_WAKE_LEVEL			0x10
>>>> +#define PMC_WAKE_STATUS			0x14
>>>> +#define PMC_SW_WAKE_STATUS		0x18
>>>>   
>>>>   #define DPD_SAMPLE			0x020
>>>>   #define  DPD_SAMPLE_ENABLE		BIT(0)
>>>> @@ -87,6 +93,11 @@
>>>>   
>>>>   #define PMC_SCRATCH41			0x140
>>>>   
>>>> +#define PMC_WAKE2_MASK			0x160
>>>> +#define PMC_WAKE2_LEVEL			0x164
>>>> +#define PMC_WAKE2_STATUS		0x168
>>>> +#define PMC_SW_WAKE2_STATUS		0x16c
>>>> +
>>>>   #define PMC_SENSOR_CTRL			0x1b0
>>>>   #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>>>>   #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
>>>> @@ -1922,6 +1933,55 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
>>>>   	.alloc = tegra_pmc_irq_alloc,
>>>>   };
>>>>   
>>>> +static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>>> +{
>>>> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>>> +	unsigned int offset, bit;
>>>> +	u32 value;
>>>> +
>>>> +	if (data->hwirq == ULONG_MAX)
>>>> +		return 0;
>>>> +
>>>> +	offset = data->hwirq / 32;
>>>> +	bit = data->hwirq % 32;
>>>> +
>>>> +	/*
>>>> +	 * Latch wakeups to SW_WAKE_STATUS register to capture events
>>>> +	 * that would not make it into wakeup event register during LP0 exit.
>>>> +	 */
>>>> +	value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>>> +	value |= PMC_CNTRL_LATCH_WAKEUPS;
>>>> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>> +	udelay(120);
>>> Why it takes so much time to latch the values? Shouldn't some status-bit
>>> be polled for the completion of latching?
>>>
>>> Is this register-write really getting buffered in the PMC?
>>>
>>>> +	value &= ~PMC_CNTRL_LATCH_WAKEUPS;
>>>> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>> +	udelay(120);
>>> 120 usecs to remove latching, really?
>>>
>>>> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
>>>> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
>>>> +
>>>> +	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
>>>> +	tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
>>>> +
>>>> +	/* enable PMC wake */
>>>> +	if (data->hwirq >= 32)
>>>> +		offset = PMC_WAKE2_MASK;
>>>> +	else
>>>> +		offset = PMC_WAKE_MASK;
>>>> +
>>>> +	value = tegra_pmc_readl(pmc, offset);
>>>> +
>>>> +	if (on)
>>>> +		value |= 1 << bit;
>>>> +	else
>>>> +		value &= ~(1 << bit);
>>>> +
>>>> +	tegra_pmc_writel(pmc, value, offset);
>>> Why the latching is done *before* writing into the WAKE registers? What
>>> it is latching then?
>> I'm looking at the TRM doc and it says that latching should be done
>> *after* writing to the WAKE_MASK / LEVEL registers.
>>
>> Secondly it says that it's enough to do:
>>
>> value = tegra_pmc_readl(pmc, PMC_CNTRL);
>> value |= PMC_CNTRL_LATCH_WAKEUPS;
>> tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>
>> in order to latch. There is no need for the delay and to remove the
>> "LATCHWAKE_EN" bit, it should be a oneshot action.
> Although, no. TRM says "stops latching on transition from 1
> to 0 (sequence - set to 1,set to 0)", so it's not a oneshot action.
>
> Have you tested this code at all? I'm wondering how it happens to work
> without a proper latching.
Yes, ofcourse its tested and this sequence to do transition is 
recommendation from Tegra designer.
Will check if TRM doesn't have update properly or will re-confirm 
internally on delay time...

On any of the wake event PMC wakeup happens and WAKE_STATUS register 
will have bits set for all events that triggered wake.
After wakeup PMC doesn't update SW_WAKE_STATUS register as per PMC design.
SW latch register added in design helps to provide a way to capture 
those events that happen right during wakeup time and didnt make it to 
SW_WAKE_STATUS register.
So before next suspend entry, latching all prior wake events into SW 
WAKE_STATUS and then clearing them.
LATCHWAKE_EN - When set, enables latching and stops latching on 
transition from 1 to 0
There is recommendation of min 120uSec for this transition to stop 
latching. Will double-check why 120uSec

>>>> +	return 0;
>>>> +}
>>>> +
>>>>   static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>>>   {
>>>>   	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>>> @@ -1954,6 +2014,49 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>>>   	return 0;
>>>>   }
>>>>   
>>>> +static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>>>> +{
>>>> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>>> +	unsigned int offset, bit;
>>>> +	u32 value;
>>>> +
>>>> +	if (data->hwirq == ULONG_MAX)
>>>> +		return 0;
>>>> +
>>>> +	offset = data->hwirq / 32;
>>>> +	bit = data->hwirq % 32;
>>>> +
>>>> +	if (data->hwirq >= 32)
>>>> +		offset = PMC_WAKE2_LEVEL;
>>>> +	else
>>>> +		offset = PMC_WAKE_LEVEL;
>>>> +
>>>> +	value = tegra_pmc_readl(pmc, offset);
>>>> +
>>>> +	switch (type) {
>>>> +	case IRQ_TYPE_EDGE_RISING:
>>>> +	case IRQ_TYPE_LEVEL_HIGH:
>>>> +		value |= 1 << bit;
>>>> +		break;
>>>> +
>>>> +	case IRQ_TYPE_EDGE_FALLING:
>>>> +	case IRQ_TYPE_LEVEL_LOW:
>>>> +		value &= ~(1 << bit);
>>>> +		break;
>>>> +
>>>> +	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
>>>> +		value ^= 1 << bit;
>>>> +		break;
>>>> +
>>>> +	default:
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	tegra_pmc_writel(pmc, value, offset);
>>> Shouldn't the WAKE_LEVEL be latched as well?
WAKE_LEVELs dont need any latch as they are the levels SW sets for wake 
trigger and they are not status
>>>> +	return 0;
>>>> +}
>>>> +
>>>>   static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>>>>   {
>>>>   	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>>> @@ -2540,6 +2643,10 @@ static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
>>>>   	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
>>>>   };
>>>>   
>>>> +static const struct tegra_wake_event tegra210_wake_events[] = {
>>>> +	TEGRA_WAKE_IRQ("rtc", 16, 2),
>>>> +};
>>>> +
>>>>   static const struct tegra_pmc_soc tegra210_pmc_soc = {
>>>>   	.num_powergates = ARRAY_SIZE(tegra210_powergates),
>>>>   	.powergates = tegra210_powergates,
>>>> @@ -2557,10 +2664,14 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
>>>>   	.regs = &tegra20_pmc_regs,
>>>>   	.init = tegra20_pmc_init,
>>>>   	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
>>>> +	.irq_set_wake = tegra210_pmc_irq_set_wake,
>>>> +	.irq_set_type = tegra210_pmc_irq_set_type,
>>>>   	.reset_sources = tegra210_reset_sources,
>>>>   	.num_reset_sources = ARRAY_SIZE(tegra210_reset_sources),
>>>>   	.reset_levels = NULL,
>>>>   	.num_reset_levels = 0,
>>>> +	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
>>>> +	.wake_events = tegra210_wake_events,
>>>>   };
>>>>   
>>>>   #define TEGRA186_IO_PAD_TABLE(_pad)					     \
>>>>

--------------6E3681EE0DA113047FBB8BB5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/22/19 6:41 PM, Dmitry Osipenko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b575ca93-9f34-b07a-1234-ef1ea2a6ddee@gmail.com">
      <pre class="moz-quote-pre" wrap="">23.07.2019 4:08, Dmitry Osipenko пишет:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">23.07.2019 3:58, Dmitry Osipenko пишет:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">21.07.2019 22:40, Sowjanya Komatineni пишет:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">This patch implements PMC wakeup sequence for Tegra210 and defines
common used RTC alarm wake event.

Signed-off-by: Sowjanya Komatineni <a class="moz-txt-link-rfc2396E" href="mailto:skomatineni@nvidia.com">&lt;skomatineni@nvidia.com&gt;</a>
---
 drivers/soc/tegra/pmc.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 91c84d0e66ae..c556f38874e1 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -57,6 +57,12 @@
 #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
 #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
 #define  PMC_CNTRL_MAIN_RST		BIT(4)
+#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Please follow the TRM's bits naming.

PMC_CNTRL_LATCHWAKE_EN

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+#define PMC_WAKE_MASK			0x0c
+#define PMC_WAKE_LEVEL			0x10
+#define PMC_WAKE_STATUS			0x14
+#define PMC_SW_WAKE_STATUS		0x18
 
 #define DPD_SAMPLE			0x020
 #define  DPD_SAMPLE_ENABLE		BIT(0)
@@ -87,6 +93,11 @@
 
 #define PMC_SCRATCH41			0x140
 
+#define PMC_WAKE2_MASK			0x160
+#define PMC_WAKE2_LEVEL			0x164
+#define PMC_WAKE2_STATUS		0x168
+#define PMC_SW_WAKE2_STATUS		0x16c
+
 #define PMC_SENSOR_CTRL			0x1b0
 #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
 #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
@@ -1922,6 +1933,55 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
 	.alloc = tegra_pmc_irq_alloc,
 };
 
+static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
+{
+	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
+	unsigned int offset, bit;
+	u32 value;
+
+	if (data-&gt;hwirq == ULONG_MAX)
+		return 0;
+
+	offset = data-&gt;hwirq / 32;
+	bit = data-&gt;hwirq % 32;
+
+	/*
+	 * Latch wakeups to SW_WAKE_STATUS register to capture events
+	 * that would not make it into wakeup event register during LP0 exit.
+	 */
+	value = tegra_pmc_readl(pmc, PMC_CNTRL);
+	value |= PMC_CNTRL_LATCH_WAKEUPS;
+	tegra_pmc_writel(pmc, value, PMC_CNTRL);
+	udelay(120);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Why it takes so much time to latch the values? Shouldn't some status-bit
be polled for the completion of latching?

Is this register-write really getting buffered in the PMC?

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+	value &amp;= ~PMC_CNTRL_LATCH_WAKEUPS;
+	tegra_pmc_writel(pmc, value, PMC_CNTRL);
+	udelay(120);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
120 usecs to remove latching, really?

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
+	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
+
+	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
+	tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
+
+	/* enable PMC wake */
+	if (data-&gt;hwirq &gt;= 32)
+		offset = PMC_WAKE2_MASK;
+	else
+		offset = PMC_WAKE_MASK;
+
+	value = tegra_pmc_readl(pmc, offset);
+
+	if (on)
+		value |= 1 &lt;&lt; bit;
+	else
+		value &amp;= ~(1 &lt;&lt; bit);
+
+	tegra_pmc_writel(pmc, value, offset);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Why the latching is done *before* writing into the WAKE registers? What
it is latching then?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I'm looking at the TRM doc and it says that latching should be done
*after* writing to the WAKE_MASK / LEVEL registers.

Secondly it says that it's enough to do:

value = tegra_pmc_readl(pmc, PMC_CNTRL);
value |= PMC_CNTRL_LATCH_WAKEUPS;
tegra_pmc_writel(pmc, value, PMC_CNTRL);

in order to latch. There is no need for the delay and to remove the
"LATCHWAKE_EN" bit, it should be a oneshot action.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Although, no. TRM says "stops latching on transition from 1
to 0 (sequence - set to 1,set to 0)", so it's not a oneshot action.

Have you tested this code at all? I'm wondering how it happens to work
without a proper latching.
</pre>
    </blockquote>
    <font size="2" face="Calibri"><span style="font-size:11pt;">
        <div>Yes, ofcourse its tested and this sequence to do transition
          is recommendation from Tegra designer.<br>
        </div>
        <div>Will check if TRM doesn't have update properly or will
          re-confirm internally on delay time...</div>
        <div><br>
        </div>
        <div>On any of the wake event PMC wakeup happens and WAKE_STATUS
          register will have bits set for all events that triggered
          wake.</div>
        <div>After wakeup PMC doesn't update SW_WAKE_STATUS register as
          per PMC design.</div>
        <div>SW latch register added in design helps to provide a way to
          capture those events that happen right during wakeup time and
          didnt make it to SW_WAKE_STATUS register. </div>
        <div>So before next suspend entry, latching all prior wake
          events into SW WAKE_STATUS and then clearing them.</div>
        <div> </div>
        <div>LATCHWAKE_EN - When set, enables latching and stops
          latching on transition from 1 to 0</div>
        <div>There is recommendation of min 120uSec for this transition
          to stop latching. Will double-check why 120uSec <br>
        </div>
        <div><br>
        </div>
      </span></font>
    <blockquote type="cite"
      cite="mid:b575ca93-9f34-b07a-1234-ef1ea2a6ddee@gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+	return 0;
+}
+
 static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
@@ -1954,6 +2014,49 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
+static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
+	unsigned int offset, bit;
+	u32 value;
+
+	if (data-&gt;hwirq == ULONG_MAX)
+		return 0;
+
+	offset = data-&gt;hwirq / 32;
+	bit = data-&gt;hwirq % 32;
+
+	if (data-&gt;hwirq &gt;= 32)
+		offset = PMC_WAKE2_LEVEL;
+	else
+		offset = PMC_WAKE_LEVEL;
+
+	value = tegra_pmc_readl(pmc, offset);
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_LEVEL_HIGH:
+		value |= 1 &lt;&lt; bit;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+	case IRQ_TYPE_LEVEL_LOW:
+		value &amp;= ~(1 &lt;&lt; bit);
+		break;
+
+	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
+		value ^= 1 &lt;&lt; bit;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	tegra_pmc_writel(pmc, value, offset);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Shouldn't the WAKE_LEVEL be latched as well?
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    WAKE_LEVELs dont need any latch as they are the levels SW sets for
    wake trigger and they are not status<br>
    <blockquote type="cite"
      cite="mid:b575ca93-9f34-b07a-1234-ef1ea2a6ddee@gmail.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+	return 0;
+}
+
 static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
@@ -2540,6 +2643,10 @@ static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
 	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
 };
 
+static const struct tegra_wake_event tegra210_wake_events[] = {
+	TEGRA_WAKE_IRQ("rtc", 16, 2),
+};
+
 static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.num_powergates = ARRAY_SIZE(tegra210_powergates),
 	.powergates = tegra210_powergates,
@@ -2557,10 +2664,14 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.regs = &amp;tegra20_pmc_regs,
 	.init = tegra20_pmc_init,
 	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
+	.irq_set_wake = tegra210_pmc_irq_set_wake,
+	.irq_set_type = tegra210_pmc_irq_set_type,
 	.reset_sources = tegra210_reset_sources,
 	.num_reset_sources = ARRAY_SIZE(tegra210_reset_sources),
 	.reset_levels = NULL,
 	.num_reset_levels = 0,
+	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
+	.wake_events = tegra210_wake_events,
 };
 
 #define TEGRA186_IO_PAD_TABLE(_pad)					     \

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6E3681EE0DA113047FBB8BB5--
