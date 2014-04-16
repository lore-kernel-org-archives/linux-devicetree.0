From: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>
Subject: RE: [RFC][PATCH 3/3] clocksource: Add Freescale FlexTimer Module
 (FTM) timer support
Date: Wed, 16 Apr 2014 03:45:56 +0000
Message-ID: <0f09e4ff3a4e42e6818bc2ab8a622b26@DM2PR03MB509.namprd03.prod.outlook.com>
References: <1397614787-8300-1-git-send-email-Li.Xiubo@freescale.com>
 <1397614787-8300-4-git-send-email-Li.Xiubo@freescale.com>
 <d4863b3b92ef4aebbc05ca5e6cb9aede@BN1PR03MB188.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d4863b3b92ef4aebbc05ca5e6cb9aede@BN1PR03MB188.namprd03.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Dongsheng.Wang@freescale.com" <Dongsheng.Wang@freescale.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, Jingchang Lu <jingchang.lu@freescale.com>, "Jason.Jin@freescale.com" <Jason.Jin@freescale.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

[...]
> > +static void ftm_set_mode(enum clock_event_mode mode,
> > +				struct clock_event_device *evt)
> > +{
> > +	switch (mode) {
> > +	case CLOCK_EVT_MODE_PERIODIC:
> > +		ftm_set_next_event(peroidic_cyc, evt);
> > +		break;
> > +	default:
> > +		break;
> 
> Remove this break;
> 

I'll revise this.


> > +	}
> > +}


[...]
> > +static void __init ftm_timer_init(struct device_node *np)
> > +{
> > +	struct clk *ftm_clk;
> > +	void __iomem *timer_base;
> > +	unsigned long freq;
> > +	int irq;
> > +
> > +	timer_base = of_iomap(np, 0);
> > +	BUG_ON(!timer_base);
> > +
> > +	clksrc_base = timer_base + FTM_OFFSET(1);
> > +	clkevt_base = timer_base + FTM_OFFSET(0);
> > +
> > +	irq = irq_of_parse_and_map(np, 0);
> > +	BUG_ON(irq <= 0);
> > +
> > +	ftm_clk = of_clk_get_by_name(np, "ftm0_counter_en");
> > +	BUG_ON(IS_ERR(ftm_clk));
> > +	BUG_ON(clk_prepare_enable(ftm_clk));
> > +
> > +	ftm_clk = of_clk_get_by_name(np, "ftm1_counter_en");
> > +	BUG_ON(IS_ERR(ftm_clk));
> > +	BUG_ON(clk_prepare_enable(ftm_clk));
> > +
> > +	ftm_clk = of_clk_get_by_name(np, "ftm0");
> > +	BUG_ON(IS_ERR(ftm_clk));
> > +	BUG_ON(clk_prepare_enable(ftm_clk));
> > +
> > +	ftm_clk = of_clk_get_by_name(np, "ftm1");
> 
> Why dts is not have ftm1 node?
> 

Because the 'ftm0: ftm@40038000' node is used to ftm0
and ftm1 device nodes at the same time.

May using 'ftm: ftm@40038000' will be much better ?

Thanks,

BRs
Xiubo
