From: Frederic Chen <frederic.chen@mediatek.com>
Subject: Re: [RFC PATCH V1 1/6] dt-bindings: mt8183: Add binding for DIP
 shared memory
Date: Tue, 7 May 2019 22:22:05 +0800
Message-ID: <1557238925.11663.21.camel@mtksdccf07>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-2-frederic.chen@mediatek.com>
 <20190430011506.GA8514@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190430011506.GA8514@bogus>
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
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com, christie.yu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, tfiga@chromium.org, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, hans.verkuil@cisco.com, zwisler@chromium.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Rob,

I appreciate your comments.

On Mon, 2019-04-29 at 20:15 -0500, Rob Herring wrote:
> On Wed, Apr 17, 2019 at 06:45:06PM +0800, Frederic Chen wrote:
> > This patch adds the binding for describing the shared memory
> > used to exchange configuration and tuning data between the
> > co-processor and Digital Image Processing (DIP) unit of the
> > camera ISP system on Mediatek SoCs.
> > 
> > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > ---
> >  .../mediatek,reserve-memory-dip_smem.txt      | 45 +++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > new file mode 100644
> > index 000000000000..64c001b476b9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > @@ -0,0 +1,45 @@
> > +Mediatek DIP Shared Memory binding
> > +
> > +This binding describes the shared memory, which serves the purpose of
> > +describing the shared memory region used to exchange data between Digital
> > +Image Processing (DIP) and co-processor in Mediatek SoCs.
> > +
> > +The co-processor doesn't have the iommu so we need to use the physical
> > +address to access the shared buffer in the firmware.
> > +
> > +The Digital Image Processing (DIP) can access memory through mt8183 IOMMU so
> > +it can use dma address to access the memory region.
> > +(See iommu/mediatek,iommu.txt for the detailed description of Mediatek IOMMU)
> > +
> > +
> > +Required properties:
> > +
> > +- compatible: must be "mediatek,reserve-memory-dip_smem"
> 
> Don't use '_'.

I got it. I will use "mediatek,reserve-memory-dip-smem" instead in next
version of the patch

> 
> > +
> > +- reg: required for static allocation (see reserved-memory.txt for
> > +  the detailed usage)
> > +
> > +- alloc-range: required for dynamic allocation. The range must
> > +  between 0x00000400 and 0x100000000 due to the co-processer's
> > +  addressing limitation
> 
> Generally, you should pick either static or dynamic allocation for a 
> given binding. Static if there's some address restriction or sharing, 
> dynamic if not.
> 
> Sounds like static in this case.
> 

DIP reserved memory has address restriction so it is the static case. I
would like to remove the dynamic allocation part and modify the
description as following:

- reg: required for DIP. The range must be between 0x00000400 and
  0x100000000 due to the co-processor's addressing limitation.
  The size must be 26MB. Please see reserved-memory.txt for the 
  detailed usage.

> > +
> > +- size: required for dynamic allocation. The unit is bytes.
> > +  If you want to enable the full feature of Digital Processing Unit,
> > +  you need 20 MB at least.
> > +
> > +
> > +Example:
> > +
> > +The following example shows the DIP shared memory setup for MT8183.
> > +
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +		reserve-memory-dip_smem {
> > +			compatible = "mediatek,reserve-memory-dip_smem";
> > +			size = <0 0x1400000>;
> > +			alignment = <0 0x1000>;
> > +			alloc-ranges = <0 0x40000000 0 0x50000000>;
> > +		};
> > +	};
> > -- 
> > 2.18.0
> > 

Sincerely,

Frederic Chen
