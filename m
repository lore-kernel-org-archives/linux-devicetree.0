From: Nishanth Menon <nm@ti.com>
Subject: Re: [RFC PATCH 36/40] arm64: dts: k3-am6: Add
 "socionext,synquacer-pre-its" property to gic_its
Date: Fri, 21 Sep 2018 14:42:38 -0500
Message-ID: <20180921194238.mhckqlsztk2eduwp@kahuna>
References: <20180921102155.22839-1-kishon@ti.com>
 <20180921102155.22839-37-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180921102155.22839-37-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Murali Karicheri <m-karicheri2@ti.com>, Gustavo.Pimentel@synopsys.com, Mark Rutland <mark.rutland@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <t-kristo@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 10:21-20180921, Kishon Vijay Abraham I wrote:
> GIC_ITS used in AM65x platform has the same configuration as that of
> GIC_ITS used in Socionext SoCs. Add "socionext,synquacer-pre-its"
> property to get PCI MSI working.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> index adcd6341e40c..2df4acb198bd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -24,6 +24,7 @@
>  		gic_its: gic-its@18200000 {
>  			compatible = "arm,gic-v3-its";
>  			reg = <0x00 0x01820000 0x00 0x10000>;
> +			socionext,synquacer-pre-its = <0x1000000 0x400000>;
>  			msi-controller;
>  			#msi-cells = <1>;
>  		};
> -- 
> 2.17.1
> 


Please post the DTS series separately. This specific patch is a GIC ITS
patch, and does'nt need to depend on rest of the PCI series. Also looks
like you missed the v4.20-rc1 bandwagon.

 
-- 
Regards,
Nishanth Menon
