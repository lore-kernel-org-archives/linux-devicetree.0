From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: arm: add DT binding for Marvell
 CP110 system controller
Date: Mon, 11 Apr 2016 17:59:38 +0200
Message-ID: <20160411175938.4b46df6e@free-electrons.com>
References: <1459070777-18049-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1459070777-18049-5-git-send-email-thomas.petazzoni@free-electrons.com>
	<20160328194756.GA28967@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160328194756.GA28967@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

On Mon, 28 Mar 2016 14:47:56 -0500, Rob Herring wrote:

> > +Required properties:
> > +
> > + - compatible: must be:
> > +     "marvell,cp110-system-controller0", "syscon";
> 
> This block is really the same across SoCs? 

As per my knowledge, it is the same across 7020, 7040, 8020 and 8040,
where the CP part is named CP110. My understanding is that in future
SoCs, when the CP part will change, the CP part will have a different
name, i.e CP115 or 120 or something (these are invented names, I have
no idea how Marvell will name the future CPs).

So I believe cp110-system-controller0 properly uniquely identifies this
IP block.

> > + - reg: register area of the CP110 system controller 0
> > + - #clock-cells: must be set to 2
> > + - core-clock-output-names must be set to:
> > +    "cpm-apll", "cpm-ppv2-core", "cpm-eip", "cpm-core", "cpm-nand-core"
> > + - gatable-clock-indices must be set to:
> > +	<0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>, <8>,
> > +	<9>, <11>, <12>, <13>, <14>, <15>, <16>, <18>,
> > +	<22>, <23>, <24>, <25>, <26>
> 
> You aren't skipping very many spots. I'd just fill the unused names in 
> with "none" or something.

and then remove the gatable-clock-indices property altogether?

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
