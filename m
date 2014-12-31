From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: mvebu: Add Armada 385 General Purpose
 Development Board support
Date: Wed, 31 Dec 2014 11:32:50 +0100
Message-ID: <20141231113250.6ae98b19@free-electrons.com>
References: <1419678035-10658-1-git-send-email-gregory.clement@free-electrons.com>
	<1419678035-10658-4-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419678035-10658-4-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Gregory CLEMENT,

On Sat, 27 Dec 2014 12:00:35 +0100, Gregory CLEMENT wrote:

> +				spi-flash@0 {
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +					compatible = "st,m25p128";
> +					reg = <0>; /* Chip select 0 */
> +					spi-max-frequency = <50000000>;

According to the m25p128 datasheet,  the max frequency is 54 Mhz.

> +			i2c@11000 {
> +				status = "okay";
> +				clock-frequency = <100000>;
> +
> +				pca9555_0: pca9555@20 {
> +					compatible = "nxp,pca9555";
> +					pinctrl-names = "default";
> +					pinctrl-0 = <&pca0_pins>;
> +					interrupt-parent = <&gpio0>;
> +					interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
> +					gpio-controller;
> +					#gpio-cells = <2>;
> +					interrupt-controller;
> +					#interrupt-cells = <2>;
> +					reg = <0x20>;
> +				};
> +
> +				pca9555_1: pca9555@21 {
> +					compatible = "nxp,pca9555";
> +					pinctrl-names = "default";
> +					interrupt-parent = <&gpio0>;
> +					interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
> +
> +					gpio-controller;
> +					#gpio-cells = <2>;
> +					interrupt-controller;
> +					#interrupt-cells = <2>;
> +
> +					reg = <0x21>;
> +				};

It would be good to align both description in terms of empty new lines.

Also, in the second controller, you have pinctrl-names, but no
pinctrl-0, so it doesn't make much sense.

> +			ethernet@70000 {
> +				status = "okay";
> +				phy = <&phy1>;
> +				phy-mode = "rgmii-id";
> +			};
> +
> +

One too many empty new line.

> +			mdio@72004 {
> +				phy0: ethernet-phy@0 {
> +					reg = <0>;
> +				};
> +
> +				phy1: ethernet-phy@1 {
> +					reg = <1>;
> +				};
> +			};

Maybe this is confusing, but it seems like the port 0 (i.e the one at
0x70000) is connected to the PHY at address 1, while the port 1 (i.e
the one at 0x30000) is connected to the PHY at address 0. According to
U-Boot:

| egiga0 |   RGMII   |     0x01     |
| egiga1 |   RGMII   |     0x00     |

So maybe we should have:

	ethernet@30000 {
		phy = <&phy1>;
	};

	ethernet@70000 {
		phy = <&phy0>;
	};

	mdio@72004 {
		phy0: ethernet-phy@1 {
			reg = <1>;
		};

		phy1: ethernet-phy@0 {
			reg = <0>;
		};
	};

To reflect this, no?

> +			sata@a8000 {
> +				nr-ports = <2>;
> +				status = "okay";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				sata0: sata-port@0 {
> +					reg = <0>;
> +					target-supply = <&reg_5v_sata0>;
> +				};
> +
> +				sata1: sata-port@1 {
> +					reg = <1>;
> +					target-supply = <&reg_5v_sata1>;
> +				};

Doesn't this part depends on the patches you have submitted to the AHCI
driver? If so, it would be good to state this in the cover letter, so
that the dependencies are known. Or for the moment, to not handle the
SATA part, until the DT binding for describing per-SATA port regulators
is sorted out (I saw that the feedback from Mark Brown on your patches
indicate that some rework will be needed).

Also, having a reg property into a child node that isn't part of a bus
looks wrong.

> +			};
> +
> +			sata@e0000 {
> +				nr-ports = <2>;
> +				status = "okay";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				sata2: sata-port@0 {
> +					reg = <0>;
> +					target-supply = <&reg_5v_sata2>;
> +				};
> +
> +				sata3: sata-port@1 {
> +					reg = <1>;
> +					target-supply = <&reg_5v_sata3>;
> +				};
> +			};

Ditto.

> +			sdhci@d8000 {
> +				clock-frequency = <200000000>;

Why? There is already a 'clocks' property in armada-38x.dtsi. However,
the clock is actually 250 Mhz, not 200 Mhz. Any reason why you forced
200 Mhz here?

> +				cd-gpios = <&pca9555_0 5 GPIO_ACTIVE_LOW>;
> +				no-1-8-v;
> +				wp-inverted;

Why do you have a wp-inverted property, with no wp-gpios property? If I
understand the DT binding correctly, wp-inverted only makes sense when
wp-gpios is used.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
