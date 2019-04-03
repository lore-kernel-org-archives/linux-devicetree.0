From: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Subject: Re: [RFC PATCH V0 5/7] dts: arm64: mt8183: Add FD nodes
Date: Wed, 3 Apr 2019 10:26:54 +0800
Message-ID: <1554258414.11458.27.camel@mtksdccf07>
References: <1550648893-42050-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1550648893-42050-6-git-send-email-Jerry-Ch.chen@mediatek.com>
 <20190325215728.GA32712@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325215728.GA32712@bogus>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= <Sean.Cheng@mediatek.com>, "laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>, Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= <Rynn.Wu@mediatek.com>, Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= <christie.yu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>, Holmes Chiou =?UTF-8?Q?=28=E9=82=B1=E6=8C=BA=29?= <holmes.chiou@mediatek.com>, Jerry-ch.chen@mediatek.com, "tfiga@chromium.org" <tfiga@chromium.org>, Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= <jungo.lin@mediatek.com>, Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?= <sj.huang@mediatek.com>, "yuzhao@chromium.org" <yuzhao@chromium.org>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>, "zwisler@chromium.org" <zwisler@>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-03-26 at 05:57 +0800, Rob Herring wrote:
> On Wed, Feb 20, 2019 at 03:48:11PM +0800, Jerry-ch Chen wrote:
> > This patch adds nodes for Face Detection (FD) unit. FD is embedded
> > in Mediatek SoCs and works with the co-processor to perform face
> > detection on the input data and image and output detected face result.
> > 
> > Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index b3d8dfd..45c7e2f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -440,6 +440,26 @@
> >  			#clock-cells = <1>;
> >  		};
> >  
> > +		fd_smem: fd_smem {
> > +			compatible = "mediatek,fd_smem";
> > +			mediatek,larb = <&larb5>;
> > +			iommus = <&iommu M4U_PORT_CAM_IMGI>;
> 
> This doesn't look like an actual h/w device...
> 
Thank you for your comments.

fd_smem is not an actual h/w device and it will not be used in the
future. We are going to remove the fd smem driver and fd_smem node.

> > +		};
> > +
> > +		fd:fd@1502b000 {
> 
> space after the :  ^
will be fixed.

> > +			compatible = "mediatek,fd";
> 
> Should be SoC specific.
> 
will be fixed as "mediatek, mt8183-fd".

Thanks and Best Regards
Jerry
> > +			mediatek,larb = <&larb5>;
> > +			mediatek,vpu = <&vpu>;
> > +			iommus = <&iommu M4U_PORT_CAM_FDVT_RP>,
> > +				 <&iommu M4U_PORT_CAM_FDVT_WR>,
> > +				 <&iommu M4U_PORT_CAM_FDVT_RB>;
> > +			reg = <0 0x1502b000 0 0x1000>;
> > +			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
> > +			clocks = <&imgsys CLK_IMG_FDVT>;
> > +			clock-names = "FD_CLK_IMG_FD";
> > +			smem_device = <&fd_smem>;
> > +		};
> > +
> >  		vdecsys: syscon@16000000 {
> >  			compatible = "mediatek,mt8183-vdecsys", "syscon";
> >  			reg = <0 0x16000000 0 0x1000>;
> > -- 
> > 1.9.1
> > 
