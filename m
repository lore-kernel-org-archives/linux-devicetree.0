From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: arm: add DT binding for Marvell
 CP110 system controller
Date: Sat, 23 Apr 2016 16:22:23 +0200
Message-ID: <20160423162223.16e3ca28@free-electrons.com>
References: <1459070777-18049-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1459070777-18049-5-git-send-email-thomas.petazzoni@free-electrons.com>
	<20160328194756.GA28967@rob-hp-laptop>
	<20160413180122.4f997a9a@free-electrons.com>
	<CAMuHMdVYtXEZF0+G3W+Q8cDcBFB55s1ru6N6J3tgFy9BcGZiXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVYtXEZF0+G3W+Q8cDcBFB55s1ru6N6J3tgFy9BcGZiXw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Hanna Hawa <hannah@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, 14 Apr 2016 21:19:54 +0200, Geert Uytterhoeven wrote:

> From my experience with clock drivers for Renesas SoCs, life is much easier
> when handling all of this (clock names, parents, ...) in C. The same is true
> BTW for PM Domains.
> 
> The clock controllers of r8a7791 and r8a7795 are very similar, and could
> be handled similarly.
> Compare the DT hierarchy for CPG and MSTP/MSSR in
> arch/arm/boot/dts/r8a7791.dtsi and arch/arm64/boot/dts/renesas/r8a7795.dtsi.

Thanks for your feedback. However in practice, there will ultimately be
two instances of this clock controller, as some variants of the SoC
will contain two CP parts. Due to this, it is going to be quite
convenient to have the clock names configurable from the DT, as I will
be able to give the same clock on the master CP and the slave CP a
different name.

That's actually why my binding documentation uses names like
"cpm-<foo>" for all the clocks, where "cpm" stands for "CP Master". In
the future, another instance will have clocks named "cps-<foo>" for "CP
Slave".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
