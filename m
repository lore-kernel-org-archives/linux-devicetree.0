From: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v4 1/5] clocksource/drivers/timer-mediatek: Add system
 timer bindings
Date: Wed, 4 Jul 2018 09:49:27 +0800
Message-ID: <1530668967.17448.55.camel@mtkswgap22>
References: <1530231446-13760-1-git-send-email-stanley.chu@mediatek.com>
         <1530231446-13760-2-git-send-email-stanley.chu@mediatek.com>
         <20180703233256.GA27424@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703233256.GA27424@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Tue, 2018-07-03 at 17:32 -0600, Rob Herring wrote:

Hi Rob,

> > +- reg: Should contain location and length for GPT register.
> > +- clocks: GPT is drived by system clock.
> 
> s/drived/driven/

Will be fixed in v5.

> 
> >  
> >  Examples:
> >  
> > @@ -21,5 +29,23 @@ Examples:
> >  		compatible = "mediatek,mt6577-timer";
> >  		reg = <0x10008000 0x80>;
> >  		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
> > -		clocks = <&system_clk>, <&rtc_clk>;
> > +		clocks = <&system_clk>;
> > +	};
> > +
> > +
> > +** System Timer (SYST)
> > +
> > +Required properties:
> > +- compatible: Should contain
> > +	* "mediatek,mt6765-timer" for MT6765 compatible timers
> > +- reg: Should contain the location and length for system timer registers.
> > +- clocks: System timer is drived by system clock.
> 
> These look the same. Can't you just add the compatible string and note 
> in the description it is the system timer. Or make the compatible 
> "mediatek,mt6765-systimer"
> 

OK! We will simplify it and just use the same compatible string.

> > +
> > +Examples:
> > +
> > +	systimer@10017000 {
> 
> timer@

As above, will be fixed in v5.

> 
> > +		compatible = "mediatek,mt6765-timer";
> > +		reg = <0 0x10017000 0 0x1000>;
> > +		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks = <&system_clk>;
> >  	};
> > -- 
> > 1.7.9.5
> > 

Thanks.
Stanley Chu
