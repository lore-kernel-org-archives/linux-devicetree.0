From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH V0 5/7] dts: arm64: mt8183: Add FD nodes
Date: Mon, 25 Mar 2019 16:57:28 -0500
Message-ID: <20190325215728.GA32712@bogus>
References: <1550648893-42050-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1550648893-42050-6-git-send-email-Jerry-Ch.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1550648893-42050-6-git-send-email-Jerry-Ch.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com, christie.yu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, tfiga@chromium.org, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, hans.verkuil@cisco.com, zwisler@chromium.org, frederic.chen@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 03:48:11PM +0800, Jerry-ch Chen wrote:
> This patch adds nodes for Face Detection (FD) unit. FD is embedded
> in Mediatek SoCs and works with the co-processor to perform face
> detection on the input data and image and output detected face result.
> 
> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index b3d8dfd..45c7e2f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -440,6 +440,26 @@
>  			#clock-cells = <1>;
>  		};
>  
> +		fd_smem: fd_smem {
> +			compatible = "mediatek,fd_smem";
> +			mediatek,larb = <&larb5>;
> +			iommus = <&iommu M4U_PORT_CAM_IMGI>;

This doesn't look like an actual h/w device...

> +		};
> +
> +		fd:fd@1502b000 {

space after the :  ^
> +			compatible = "mediatek,fd";

Should be SoC specific.

> +			mediatek,larb = <&larb5>;
> +			mediatek,vpu = <&vpu>;
> +			iommus = <&iommu M4U_PORT_CAM_FDVT_RP>,
> +				 <&iommu M4U_PORT_CAM_FDVT_WR>,
> +				 <&iommu M4U_PORT_CAM_FDVT_RB>;
> +			reg = <0 0x1502b000 0 0x1000>;
> +			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&imgsys CLK_IMG_FDVT>;
> +			clock-names = "FD_CLK_IMG_FD";
> +			smem_device = <&fd_smem>;
> +		};
> +
>  		vdecsys: syscon@16000000 {
>  			compatible = "mediatek,mt8183-vdecsys", "syscon";
>  			reg = <0 0x16000000 0 0x1000>;
> -- 
> 1.9.1
> 
