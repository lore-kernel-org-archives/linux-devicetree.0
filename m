From: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH v2 1/2] arm/dts: AM33XX: Add D_CAN device tree data
Date: Thu, 26 Jul 2012 10:46:33 +0200
Message-ID: <9D2B44C8-820E-4E96-A480-7A650583BC92@dominion.thruhere.net>
References: <1343219012-19472-1-git-send-email-anilkumar@ti.com> <1343219012-19472-2-git-send-email-anilkumar@ti.com>
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1343219012-19472-2-git-send-email-anilkumar@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: AnilKumar Ch <anilkumar@ti.com>
Cc: linux-omap@vger.kernel.org, tony@atomide.com, wg@grandegger.com, mkl@pengutronix.de, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca
List-Id: devicetree@vger.kernel.org


Op 25 jul. 2012, om 14:23 heeft AnilKumar Ch <anilkumar@ti.com> het volgende geschreven:

> Add Bosch D_CAN controller device tree data to AM33XX dtsi file
> by adding d_can device node with all the necessary parameters.
> 
> Signed-off-by: AnilKumar Ch <anilkumar@ti.com>
> ---
> arch/arm/boot/dts/am33xx.dtsi |    5 +++++
> 1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
> index 9b974dc..2db2ffb 100644
> --- a/arch/arm/boot/dts/am33xx.dtsi
> +++ b/arch/arm/boot/dts/am33xx.dtsi
> @@ -163,5 +163,10 @@
> 			#size-cells = <0>;
> 			ti,hwmods = "i2c3";
> 		};
> +
> +		dcan1: d_can@481D0000 {
> +			compatible = "bosch,d_can";
> +			ti,hwmods = "d_can1";
> +		};
> 	};

I scanned the linux-networking mailinglist and l-o-ml, but I can't find the patchset that actually adds the d_can drivers, could you provide a link to that? I have 2 different CAN capes I'd like to test on beaglebone.

regards,

Koen