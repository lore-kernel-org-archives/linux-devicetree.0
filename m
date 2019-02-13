From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 0/6] Add CPU clock support for Armada 7K/8K
Date: Wed, 13 Feb 2019 09:57:04 +0100
Message-ID: <871s4c5an3.fsf@FE-laptop>
References: <20181216094147.6468-1-gregory.clement@bootlin.com> <87a7k8o5d5.fsf@FE-laptop> <154713766177.15366.14948014236046606980@swboyd.mtv.corp.google.com> <875zuwo4fi.fsf@FE-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <875zuwo4fi.fsf@FE-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Antoine Tenart <antoine.tenart@bootlin.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,
 
 On jeu., janv. 10 2019, Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Hi Stephen,
>  
>  On jeu., janv. 10 2019, Stephen Boyd <sboyd@kernel.org> wrote:
>
>> Quoting Gregory CLEMENT (2019-01-10 08:16:22)
>>> Hi Stephen,
>>>  
>>>  On dim., déc. 16 2018, Gregory CLEMENT <gregory.clement@bootlin.com> wrote:
>>> 
>>> > Hello,
>>> >
>>> > This is the third version of a series allowing to manage the cpu
>>> > clock for Armada 7K/8K. For these SoCs, the CPUs share the same clock
>>> > by cluster, so actually the clock management is done at cluster level.
>>> >
>>> > As for the other Armada 7K/8K clocks it is possible to have multiple
>>> > AP so here again we need to have unique name: the purpose of the second
>>> > patch is to share a common code which will be used in 3 drivers.
>>> >
>>> > The last 2 patch enable the driver at dt and platform level and will
>>> > be applied through the mvebu subsystem.
>>> 
>>> What is the status of this series?
>>> 
>>> The only comments I had was from Rob about the binding and I answered
>>> them 3 weeks ago. Do you have any other comments? Do you expect a rebase
>>> of this series on v5.0-rc1?
>>> 
>>
>> I'm waiting for Rob. I think the binding is not proper so presumably you
>> will figure out what Rob wants and then change the code accordingly and
>> resend?
>
> Actually the binding describes properly the hardware we have and that
> what I answered to Rob.

I pinged you about this series more than one month ago, and answered Rob
concerned 2 months ago! He didn't said anything about my comments so I
really think that the binding is OK and described the hardware we have.

So could you consider to apply this series?

Thanks,

Gregory


>
> Gregory
>
> -- 
> Gregory Clement, Bootlin
> Embedded Linux and Kernel engineering
> http://bootlin.com
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
