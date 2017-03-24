From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 06/15] ARM: dts: r8a779x: fix PCI bus dtc warnings
Date: Fri, 24 Mar 2017 08:06:14 +0100
Message-ID: <20170324070614.GJ1319@verge.net.au>
References: <20170322020313.24338-1-robh@kernel.org>
 <20170322020313.24338-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170322020313.24338-6-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, arm@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 21, 2017 at 09:03:04PM -0500, Rob Herring wrote:
> dtc recently added PCI bus checks. Fix these warnings.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Simon Horman <horms@verge.net.au>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> Sub-arch maintainers, please apply to your trees unless arm-soc wants 
> to take the whole lot.

I would prefer to take these through my tree to reduce the chances of
conflicts emerging later.

Geert, are you happy with this patch and its changelog as-is?

> 
>  arch/arm/boot/dts/r8a7790.dtsi | 16 ++++++----------
>  arch/arm/boot/dts/r8a7791.dtsi | 16 ++++++----------
>  arch/arm/boot/dts/r8a7794.dtsi | 16 ++++++----------
>  3 files changed, 18 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
> index 6d10450de6d7..c16a37e9fb5d 100644
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -1598,16 +1598,14 @@
>  				 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
>  				 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
>  
> -		usb@0,1 {
> +		usb@1,0 {
>  			reg = <0x800 0 0 0 0>;
> -			device_type = "pci";
>  			phys = <&usb0 0>;
>  			phy-names = "usb";
>  		};
>  
> -		usb@0,2 {
> +		usb@2,0 {
>  			reg = <0x1000 0 0 0 0>;
> -			device_type = "pci";
>  			phys = <&usb0 0>;
>  			phy-names = "usb";
>  		};
> @@ -1654,16 +1652,14 @@
>  				 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
>  				 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
>  
> -		usb@0,1 {
> -			reg = <0x800 0 0 0 0>;
> -			device_type = "pci";
> +		usb@1,0 {
> +			reg = <0x20800 0 0 0 0>;
>  			phys = <&usb2 0>;
>  			phy-names = "usb";
>  		};
>  
> -		usb@0,2 {
> -			reg = <0x1000 0 0 0 0>;
> -			device_type = "pci";
> +		usb@2,0 {
> +			reg = <0x21000 0 0 0 0>;
>  			phys = <&usb2 0>;
>  			phy-names = "usb";
>  		};
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index 9f9e48511836..a1d8686eaea5 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -1596,16 +1596,14 @@
>  				 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
>  				 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
>  
> -		usb@0,1 {
> +		usb@1,0 {
>  			reg = <0x800 0 0 0 0>;
> -			device_type = "pci";
>  			phys = <&usb0 0>;
>  			phy-names = "usb";
>  		};
>  
> -		usb@0,2 {
> +		usb@2,0 {
>  			reg = <0x1000 0 0 0 0>;
> -			device_type = "pci";
>  			phys = <&usb0 0>;
>  			phy-names = "usb";
>  		};
> @@ -1631,16 +1629,14 @@
>  				 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
>  				 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
>  
> -		usb@0,1 {
> -			reg = <0x800 0 0 0 0>;
> -			device_type = "pci";
> +		usb@1,0 {
> +			reg = <0x10800 0 0 0 0>;
>  			phys = <&usb2 0>;
>  			phy-names = "usb";
>  		};
>  
> -		usb@0,2 {
> -			reg = <0x1000 0 0 0 0>;
> -			device_type = "pci";
> +		usb@2,0 {
> +			reg = <0x11000 0 0 0 0>;
>  			phys = <&usb2 0>;
>  			phy-names = "usb";
>  		};
> diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
> index 319c1069b7ee..c07495185cc4 100644
> --- a/arch/arm/boot/dts/r8a7794.dtsi
> +++ b/arch/arm/boot/dts/r8a7794.dtsi
> @@ -817,16 +817,14 @@
>  				 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
>  				 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
>  
> -		usb@0,1 {
> +		usb@1,0 {
>  			reg = <0x800 0 0 0 0>;
> -			device_type = "pci";
>  			phys = <&usb0 0>;
>  			phy-names = "usb";
>  		};
>  
> -		usb@0,2 {
> +		usb@2,0 {
>  			reg = <0x1000 0 0 0 0>;
> -			device_type = "pci";
>  			phys = <&usb0 0>;
>  			phy-names = "usb";
>  		};
> @@ -852,16 +850,14 @@
>  				 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
>  				 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
>  
> -		usb@0,1 {
> -			reg = <0x800 0 0 0 0>;
> -			device_type = "pci";
> +		usb@1,0 {
> +			reg = <0x10800 0 0 0 0>;
>  			phys = <&usb2 0>;
>  			phy-names = "usb";
>  		};
>  
> -		usb@0,2 {
> -			reg = <0x1000 0 0 0 0>;
> -			device_type = "pci";
> +		usb@2,0 {
> +			reg = <0x11000 0 0 0 0>;
>  			phys = <&usb2 0>;
>  			phy-names = "usb";
>  		};
> -- 
> 2.10.1
> 
