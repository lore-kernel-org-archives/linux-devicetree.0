From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: keystone: dts: add PCI serdes driver bindings
Date: Tue, 24 Nov 2015 17:43:19 -0600
Message-ID: <20151124234319.GG17377@localhost>
References: <1444919230-30932-1-git-send-email-w-kwok2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444919230-30932-1-git-send-email-w-kwok2-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: WingMan Kwok <w-kwok2-l0cyMroinI0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi WingMan, 

On Thu, Oct 15, 2015 at 10:27:10AM -0400, WingMan Kwok wrote:
> This patch adds the required PCI serdes bindings whcih can then be
> enabled by setting the corresponding statuses to "ok" in order to
> configure and start the PCI serdes.
> 
> This patch depends on the updates to the Keystone PCIe host driver
> and common serdes driver patch series that is submitted separately.
> 
> Signed-off-by: WingMan Kwok <w-kwok2-l0cyMroinI0@public.gmane.org>

Is there a reason to separate the binding update from the PCIe host
driver update?  It would make sense to me to have them in the same
patch to make it easier to keep them consistent.

Bjorn

> ---
>  arch/arm/boot/dts/k2e.dtsi      |   21 +++++++++++++++++++++
>  arch/arm/boot/dts/keystone.dtsi |   21 +++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/k2e.dtsi b/arch/arm/boot/dts/k2e.dtsi
> index 675fb8e..3b36575 100644
> --- a/arch/arm/boot/dts/k2e.dtsi
> +++ b/arch/arm/boot/dts/k2e.dtsi
> @@ -86,6 +86,16 @@
>  			gpio,syscon-dev = <&devctrl 0x240>;
>  		};
>  
> +		pcie1_phy: pciephy@2326000 {
> +			#phy-cells = <0>;
> +			compatible = "ti,keystone-serdes-pcie";
> +			reg = <0x02326000 0x4000>;
> +			reg-names = "serdes";
> +			link-rate-kbps = <5000000>;
> +			num-lanes = <2>;
> +			status = "disabled";
> +		};
> +
>  		pcie1: pcie@21020000 {
>  			compatible = "ti,keystone-pcie","snps,dw-pcie";
>  			clocks = <&clkpcie1>;
> @@ -130,6 +140,17 @@
>  					<GIC_SPI 375 IRQ_TYPE_EDGE_RISING>,
>  					<GIC_SPI 376 IRQ_TYPE_EDGE_RISING>;
>  			};
> +
> +			/* PCIE phy */
> +			serdeses {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				serdes@0 {
> +					reg = <0>;
> +					phys = <&pcie1_phy>;
> +				};
> +			};
> +
>  		};
>  
>  		mdio: mdio@24200f00 {
> diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
> index 72816d6..6566cc4 100644
> --- a/arch/arm/boot/dts/keystone.dtsi
> +++ b/arch/arm/boot/dts/keystone.dtsi
> @@ -275,6 +275,16 @@
>  			ti,syscon-dev = <&devctrl 0x2a0>;
>  		};
>  
> +		pcie0_phy: pciephy@2320000 {
> +			#phy-cells = <0>;
> +			compatible = "ti,keystone-serdes-pcie";
> +			reg = <0x02320000 0x4000>;
> +			reg-names = "serdes";
> +			link-rate-kbps = <5000000>;
> +			num-lanes = <2>;
> +			status = "disabled";
> +		};
> +
>  		pcie0: pcie@21800000 {
>  			compatible = "ti,keystone-pcie", "snps,dw-pcie";
>  			clocks = <&clkpcie>;
> @@ -319,6 +329,17 @@
>  					<GIC_SPI 28 IRQ_TYPE_EDGE_RISING>,
>  					<GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
>  			};
> +
> +			/* PCIE phy */
> +			serdeses {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				serdes@0 {
> +					reg = <0>;
> +					phys = <&pcie0_phy>;
> +				};
> +			};
> +
>  		};
>  	};
>  };
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
