From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/8] ARM: mvebu: Add Device Tree description of xHCI hosts
 on Armada 38x
Date: Fri, 18 Apr 2014 13:23:20 +0200
Message-ID: <53510B28.1070709@gmail.com>
References: <1397816563-9000-1-git-send-email-gregory.clement@free-electrons.com> <1397816563-9000-6-git-send-email-gregory.clement@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397816563-9000-6-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/18/2014 12:22 PM, Gregory CLEMENT wrote:
> The Marvell Armada 38x SoCs contain two xHCI host. This commit adds
> the Device Tree description of those interfaces at the SoC level, and
> also enables the two USB3 ports on the Armada 385 DB platform and one
> USB3 port on the Armada 385 RD platforms.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-385-db.dts |  8 ++++++++
>  arch/arm/boot/dts/armada-385-rd.dts |  4 ++++
>  arch/arm/boot/dts/armada-38x.dtsi   | 17 +++++++++++++++++
>  3 files changed, 29 insertions(+)
[...]
> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
> index a064f59da02d..4f117e66aa1a 100644
> --- a/arch/arm/boot/dts/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/armada-38x.dtsi
> @@ -355,6 +355,23 @@
>  				clocks = <&coredivclk 0>;
>  				status = "disabled";
>  			};
> +
> +			usb3@f0000 {
> +				compatible = "marvell,xhci-armada-380";
> +				reg = <0xf0000 0x3fff>,<0xf4000 0x3fff>;
> +				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gateclk 9>;

Using generic PHY framework will allow you to reference the PHY nodes
with "usb-phy" here.

BTW, you added a "marvell,armada-380-usb-utmi" in the patch for PHY init
but I can see no corresponding node added.

Sebastian

> +				status = "disabled";
> +			};
> +
> +			usb3@f8000 {
> +				compatible = "marvell,xhci-armada-380";
> +				reg = <0xf8000 0x3fff>,<0xfc000 0x3fff>;
> +				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gateclk 10>;
> +				status = "disabled";
> +			};
> +
>  		};
>  	};
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
