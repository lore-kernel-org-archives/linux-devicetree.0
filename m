From: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3 1/5] clocksource/drivers/timer-mediatek: Add system
 timer bindings
Date: Fri, 29 Jun 2018 08:15:24 +0800
Message-ID: <1530231323.17448.50.camel@mtkswgap22>
References: <1530182744-10731-1-git-send-email-stanley.chu@mediatek.com>
         <1530182744-10731-2-git-send-email-stanley.chu@mediatek.com>
         <93345c88-f880-5e2e-ae36-cf1b57df9bba@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <93345c88-f880-5e2e-ae36-cf1b57df9bba@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, 2018-06-28 at 16:08 +0200, Daniel Lezcano wrote:
> > +** System Timer (SYST)
> > +
> > +Required properties:
> > +- compatible: Should contain
> > +	* "mediatek,mt6765-systimer" for MT6765 compatible timers
> > +- reg: Should contain the location and length for system timer registers.
> > +- clocks: System timer is drived by system clock.
> > +
> > +Examples:
> > +
> > +	systimer@10017000 {
> > +		compatible = "mediatek,mt6765-systimer";
> 
> why not "mediatek,mt6765-timer" ? for consistency.
> 
Hi Daniel,

The original thought is to remind user to notice that different timer
will be used.

However it looks more clean if we use consistent name.

Will fix it in v4.

> > +		reg = <0 0x10017000 0 0x1000>;
> > +		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks = <&system_clk>;
> >  	};
> > 
> 
> 

Thanks.
Stanley Chu
