From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] RM64: dts: ls208xa: Add iommu-map property for pci
Date: Thu, 31 Aug 2017 10:32:09 +0100
Message-ID: <06c57ca4-edaa-df26-b1d9-1906141c5065@arm.com>
References: <1504171424-15536-1-git-send-email-Bharat.Bhushan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504171424-15536-1-git-send-email-Bharat.Bhushan@nxp.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Bharat Bhushan <Bharat.Bhushan@nxp.com>, robh+dt@kernel.org, ark.rutland@arm.com, will.deacon@arm.com, oss@buserror.net, Gang.Liu@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com
List-Id: devicetree@vger.kernel.org

On 31/08/17 10:23, Bharat Bhushan wrote:
> This patch adds iommu-map property for PCIe, which enables
> SMMU for these devices on LS208xA devices.
> 
> Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> index 94cdd30..67cf605 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> @@ -606,6 +606,7 @@
>  			num-lanes = <4>;
>  			bus-range = <0x0 0xff>;
>  			msi-parent = <&its>;
> +			iommu-map = <0 &smmu 0 1>;	/* This is fixed-up by u-boot */

What does this do when your version of u-boot doesn't fill this in for you?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
