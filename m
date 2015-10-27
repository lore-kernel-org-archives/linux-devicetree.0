From: Stuart Yoder <stuart.yoder@freescale.com>
Subject: RE: [PATCH] arm64: dts: Added syscon-reboot node for FSL's LS2085A
 SoC
Date: Tue, 27 Oct 2015 16:31:16 +0000
Message-ID: <CY1PR0301MB07483CD5D8B23940A49816B687220@CY1PR0301MB0748.namprd03.prod.outlook.com>
References: <1445650280-9966-1-git-send-email-German.Rivera@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445650280-9966-1-git-send-email-German.Rivera@freescale.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Sharma Bhupesh <bhupesh.sharma@freescale.com>, Li Leo <LeoLi@freescale.com>, Jose Rivera <German.Rivera@freescale.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: J. German Rivera [mailto:German.Rivera@freescale.com]
> Sent: Friday, October 23, 2015 8:31 PM
> To: robh+dt@kernel.org; mark.rutland@arm.com; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Cc: Sharma Bhupesh-B45370; Yoder Stuart-B08248; Li Yang-Leo-R58472; Rivera Jose-B46482
> Subject: [PATCH] arm64: dts: Added syscon-reboot node for FSL's LS2085A SoC
> 
> Added sys-reboot node to the FSL's LS2085A SoC DT to leverage
> the ARM-generic reboot mechanism for this SoC. This mechanism
> is enabled through CONFIG_POWER_RESET_SYSCON.
> 
> Signed-off-by: J. German Rivera <German.Rivera@freescale.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> index e281ceb..6f82163 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> @@ -131,6 +131,18 @@
>  		interrupts = <1 9 0x4>;
>  	};
> 
> +	rst_ccsr: rstccsr@1E60000 {
> +	        compatible = "syscon";
> +		reg = <0x0 0x1E60000 0x0 0x10000>;
> +	};
> +
> +	reboot@65024000 {
> +		compatible ="syscon-reboot";
> +		regmap = <&rst_ccsr>;
> +		offset = <0x0>;
> +		mask = <0x2>;
> +	};
> +

Drop the unit address "65024000", since you have no "reg" property.

The ePAPR explicitly says: "If the node has no reg property, the
@ and unit-address must be omitted and the node-name alone differentiates
the node from other nodes at the same level in the tree.

Also, other examples in the kernel just use plain "reboot" as
the name:

arch/arm/boot/dts/hisi-x5hd2.dtsi
arch/arm/boot/dts/vfxxx.dtsi
arch/mips/boot/dts/brcm/bcm6328.dtsi

Also, Bhupesh's LS2080A DTS updates were just accepte4d, and the device tree
name is no longer fsl-ls2085a.dtsi.  You need to rebase on top of
those changes.

Thanks,
Stuart
