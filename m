From: Jungo Lin <jungo.lin@mediatek.com>
Subject: Re: [RFC,v4,1/4] media: dt-bindings: mt8183: Added camera ISP Pass 1
Date: Thu, 22 Aug 2019 20:48:43 +0800
Message-ID: <1566478123.5044.1.camel@mtksdccf07>
References: <jungo.lin@mediatek.com>
 <20190807124803.29884-1-jungo.lin@mediatek.com>
 <20190807124803.29884-2-jungo.lin@mediatek.com>
 <20190821201758.GB15270@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190821201758.GB15270@bogus>
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
Cc: ryan.yu@mediatek.com, frankie.chiu@mediatek.com, laurent.pinchart@ideasonboard.com, Rynn.Wu@mediatek.com, suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, frederic.chen@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, hverkuil-cisco@xs4all.nl, shik@chromium.org, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com, srv_heupstream@mediatek.com, sj.huang@mediatek.com, tfiga@chromium.org, zwisler@chromium.org, ddavenport@chromium.org
List-Id: devicetree@vger.kernel.org

Hi, Rob:
On Wed, 2019-08-21 at 15:17 -0500, Rob Herring wrote:
> On Wed, Aug 07, 2019 at 08:48:00PM +0800, Jungo Lin wrote:
> > This patch adds DT binding document for the Pass 1 (P1) unit
> > in Mediatek's camera ISP system. The Pass 1 unit grabs the sensor
> > data out from the sensor interface, applies ISP image effects
> > from tuning data and outputs the image data or statistics data to DRAM.
> > 
> > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,camisp.txt        | 73 +++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,camisp.txt b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> > new file mode 100644
> > index 000000000000..fa2713acceca
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> > @@ -0,0 +1,73 @@
> > +* Mediatek Image Signal Processor Pass 1 (ISP P1)
> > +
> > +The Pass 1 unit of Mediatek's camera ISP system grabs the sensor data out
> > +from the sensor interface, applies ISP effects from tuning data and outputs
> > +the image data and statistics data to DRAM. Furthermore, Pass 1 unit has
> > +the ability to output two different resolutions frames at the same time to
> > +increase the performance of the camera application.
> > +
> > +Required properties:
> > +- compatible: Must be "mediatek,mt8183-camisp" for MT8183.
> > +- reg: Physical base address of the camera function block register and
> > +  length of memory mapped region. Must contain an entry for each entry
> > +  in reg-names.
> > +- reg-names: Must include the following entries:
> > +  "cam_sys": Camera base function block
> > +  "cam_uni": Camera UNI function block
> > +  "cam_a": Camera ISP P1 hardware unit A
> > +  "cam_b": Camera ISP P1 hardware unit B
> > +  "cam_c": Camera ISP P1 hardware unit C
> > +- interrupts: Must contain an entry for each entry in interrupt-names.
> > +- interrupt-names : Must include the following entries:
> > +  "cam_uni": Camera UNI interrupt
> > +  "cam_a": Camera unit A interrupt
> > +  "cam_b": Camera unit B interrupt
> > +  "cam_c": Camera unit C interrupt
> > +- iommus: Shall point to the respective IOMMU block with master port
> > +  as argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > +  for details.
> > +- clocks: A list of phandle and clock specifier pairs as listed
> > +  in clock-names property, see
> > +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> > +- clock-names: Must be "camsys_cam_cgpdn" and "camsys_camtg_cgpdn".
> > +- mediatek,larb: Must contain the local arbiters in the current SoCs, see
> > +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > +  for details.
> > +- power-domains: a phandle to the power domain, see
> > +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> > +- mediatek,scp : The node of system control processor (SCP), see
> > +  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
> > +
> > +Example:
> > +SoC specific DT entry:
> > +
> > +		camisp: camisp@1a000000 {
> 
> Also, you can remove 2 levels of indentation here.
> 

Ok, got it.
We will change to use one level of indentation.

Thanks,

Jungo

> > +			compatible = "mediatek,mt8183-camisp", "syscon";
> > +			reg = <0 0x1a000000 0 0x1000>,
> > +					<0 0x1a003000 0 0x1000>,
> > +					<0 0x1a004000 0 0x2000>,
> > +					<0 0x1a006000 0 0x2000>,
> > +					<0 0x1a008000 0 0x2000>;
> > +			reg-names = "cam_sys",
> > +					"cam_uni",
> > +					"cam_a",
> > +					"cam_b",
> > +					"cam_c";
> > +			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_LOW>,
> > +					<GIC_SPI 254 IRQ_TYPE_LEVEL_LOW>,
> > +					<GIC_SPI 255 IRQ_TYPE_LEVEL_LOW>,
> > +					<GIC_SPI 256 IRQ_TYPE_LEVEL_LOW>;
> > +			interrupt-names = "cam_uni",
> > +					"cam_a",
> > +					"cam_b",
> > +					"cam_c";
> > +			iommus = <&iommu M4U_PORT_CAM_IMGO>;
> > +			clocks = <&camsys CLK_CAM_CAM>,
> > +					<&camsys CLK_CAM_CAMTG>;
> > +			clock-names = "camsys_cam_cgpdn",
> > +					"camsys_camtg_cgpdn";
> > +			mediatek,larb = <&larb3>,
> > +					<&larb6>;
> > +			power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> > +			mediatek,scp = <&scp>;
> > +		};
> > -- 
> > 2.18.0
> > 
