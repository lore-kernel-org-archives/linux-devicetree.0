From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1] usb: dwc3: enable otg mode for dwc3 usb ip on
 layerscape
Date: Sun, 6 Oct 2019 10:54:52 +0800
Message-ID: <20191006025450.GO7150@dragon>
References: <20190909090244.42543-1-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190909090244.42543-1-yinbo.zhu@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yinbo Zhu <yinbo.zhu@nxp.com>, Li Yang <leoyang.li@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, xiaobo.xie@nxp.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, jiafei.pan@nxp.com, Ran Wang <ran.wang_1@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 09, 2019 at 05:02:44PM +0800, Yinbo Zhu wrote:
> layerscape otg function should be supported HNP SRP and ADP protocol
> accroing to rm doc, but dwc3 code not realize it and use id pin to
> detect who is host or device(0 is host 1 is device) this patch is to
> enable OTG mode on ls1028ardb ls1088ardb and ls1046ardb in dts
> 
> Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>

The patch prefix should be something like: 'arm64: dts: ...'

@Leo, do you agree with the changes?

Shawn

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index 7975519b4f56..5810d0400dbc 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -320,7 +320,7 @@
>  			compatible = "fsl,ls1028a-dwc3", "snps,dwc3";
>  			reg = <0x0 0x3110000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> -			dr_mode = "host";
> +			dr_mode = "otg";
>  			snps,dis_rxdet_inp3_quirk;
>  			snps,quirk-frame-length-adjustment = <0x20>;
>  			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index b0ef08b090dd..ecce6151b9b0 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -582,7 +582,7 @@
>  			compatible = "snps,dwc3";
>  			reg = <0x0 0x3000000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> -			dr_mode = "host";
> +			dr_mode = "otg";
>  			snps,quirk-frame-length-adjustment = <0x20>;
>  			snps,dis_rxdet_inp3_quirk;
>  			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index dacd8cf03a7f..4b5413f7c90c 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -385,7 +385,7 @@
>  			compatible = "snps,dwc3";
>  			reg = <0x0 0x3110000 0x0 0x10000>;
>  			interrupts = <0 81 IRQ_TYPE_LEVEL_HIGH>;
> -			dr_mode = "host";
> +			dr_mode = "otg";
>  			snps,quirk-frame-length-adjustment = <0x20>;
>  			snps,dis_rxdet_inp3_quirk;
>  			status = "disabled";
> -- 
> 2.17.1
> 
