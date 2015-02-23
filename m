From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCHv2 05/15] ARM: mvebu: add stdout-path to all armada-*.dts
Date: Mon, 23 Feb 2015 17:13:34 +0000
Message-ID: <20150223171334.GP9714@leverpostej>
References: <1424451874-25375-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1424451874-25375-6-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1424451874-25375-6-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 20, 2015 at 05:04:24PM +0000, Thomas Petazzoni wrote:
> This commit adds the stdout-path property in /chosen for all Armada
> boards that were not yet carrying this property.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/arm/boot/dts/armada-370-db.dts              | 1 +
>  arch/arm/boot/dts/armada-370-mirabox.dts         | 1 +
>  arch/arm/boot/dts/armada-370-netgear-rn102.dts   | 1 +
>  arch/arm/boot/dts/armada-370-netgear-rn104.dts   | 1 +
>  arch/arm/boot/dts/armada-370-rd.dts              | 1 +
>  arch/arm/boot/dts/armada-375-db.dts              | 1 +
>  arch/arm/boot/dts/armada-388-db.dts              | 1 +
>  arch/arm/boot/dts/armada-388-rd.dts              | 1 +
>  arch/arm/boot/dts/armada-xp-axpwifiap.dts        | 1 +
>  arch/arm/boot/dts/armada-xp-db.dts               | 1 +
>  arch/arm/boot/dts/armada-xp-gp.dts               | 1 +
>  arch/arm/boot/dts/armada-xp-matrix.dts           | 1 +
>  arch/arm/boot/dts/armada-xp-netgear-rn2120.dts   | 1 +
>  arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts | 1 +
>  14 files changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/armada-370-db.dts b/arch/arm/boot/dts/armada-370-db.dts
> index e993c46..286bedd 100644
> --- a/arch/arm/boot/dts/armada-370-db.dts
> +++ b/arch/arm/boot/dts/armada-370-db.dts
> @@ -56,6 +56,7 @@
>  
>  	chosen {
>  		bootargs = "console=ttyS0,115200 earlyprintk";
> +		stdout-path = &uart0;

stdout-path can now take a config too (including the rate), which will
avoid any reliance on the serial core choosing the right rate by
default.

If you have an alias serial0, this could be:

	stdout-path = "serial0:115200n8";

Otherwise you can use the full path instead of serial0.

That's documented in Documentation/devicetree/bindings/chosen.txt

Mark.
