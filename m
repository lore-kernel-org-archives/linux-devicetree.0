From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: add DT binding for the Xtal clock on Armada 3700
Date: Mon, 11 Jul 2016 18:12:22 +0200
Message-ID: <87a8hotaqh.fsf@free-electrons.com>
References: <1467931071-31004-1-git-send-email-gregory.clement@free-electrons.com>
	<1467931071-31004-2-git-send-email-gregory.clement@free-electrons.com>
	<20160708093156.4f235b85@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160708093156.4f235b85@free-electrons.com> (Thomas Petazzoni's
	message of "Fri, 8 Jul 2016 09:31:56 +0200")
Sender: linux-clk-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Romain Perier <romain.perier@free-electrons.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Thomas,
 
 On ven., juil. 08 2016, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Fri,  8 Jul 2016 00:37:46 +0200, Gregory CLEMENT wrote:
>
>> +gpio1: gpio@13800 {
>> +	compatible = "marvell,mvebu-gpio-3700",	"syscon", "simple-mfd";
>
> I find this compatible string not very consistent with what we do for
> other drivers, it should have been:
>
> 	marvell,armada-3700-gpio

Thanks for pointing this. We missed it during the last review. I agree
that using marvell,armada-3700-gpio is more appropriate, especially
because the gpio controller on Armada 37xx seems to be different that
the ones used on the other mvebu SoCs.

Gregory

>
> or something like that.
>
>
>> +	xtalclk: xtal-clk {
>> +		compatible = "marvell,armada-3700-xtal-clock";
>
> See here for example.
>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
