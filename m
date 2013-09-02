From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/4] ARM: shmobile: r8a7778: add Ether DT support
Date: Mon, 02 Sep 2013 15:14:37 +0200
Message-ID: <1643070.uIkONXsrBj@avalon>
References: <201309010311.05466.sergei.shtylyov@cogentembedded.com> <201309010315.49763.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <201309010315.49763.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: horms@verge.net.au, linux-sh@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Sergei,

Thank you for the patch.

On Sunday 01 September 2013 03:15:48 Sergei Shtylyov wrote:
> Define the generic R8A777x part of the Ether device node.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  arch/arm/boot/dts/r8a7778.dtsi |   11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> Index: renesas/arch/arm/boot/dts/r8a7778.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7778.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7778.dtsi
> @@ -98,4 +98,15 @@
>  		reg = <0xfffc000 0x118>;
>  		#gpio-range-cells = <3>;
>  	};
> +
> +	ether: ethernet@fde00000 {
> +		device_type = "network";

Documentation/devicetree/bindings/net/sh_eth.txt from "[PATCH 2/2] sh_eth: add 
device tree support" doesn't document this property, should you update it ?

> +		compatible = "renesas,ether-r8a7779";
> +		reg = <0xfde00000 0x400>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 105 0x4>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
>  };

-- 
Regards,

Laurent Pinchart

