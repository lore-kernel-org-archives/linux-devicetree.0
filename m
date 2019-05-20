From: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Subject: Re: [RFC PATCH V1 1/6] dt-bindings: mt8183: Add binding for FD
 shared memory
Date: Mon, 20 May 2019 18:04:13 +0800
Message-ID: <1558346653.3318.18.camel@mtksdccf07>
References: <20190423104505.38778-1-Jerry-Ch.chen@mediatek.com>
 <20190423104505.38778-2-Jerry-Ch.chen@mediatek.com>
 <20190501224512.GA4287@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190501224512.GA4287@bogus>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= <Sean.Cheng@mediatek.com>, "laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>, Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= <Rynn.Wu@mediatek.com>, Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= <christie.yu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>, Holmes Chiou =?UTF-8?Q?=28=E9=82=B1=E6=8C=BA=29?= <holmes.chiou@mediatek.com>, "suleiman@chromium.org" <suleiman@chromium.org>, "shik@chromium.org" <shik@chromium.org>, "tfiga@chromium.org" <tfiga@chromium.org>, Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= <jungo.lin@mediatek.com>, Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?= <sj.huang@mediatek.com>, "yuzhao@chromium.org" <yuzhao@chromium.org>, hans.verkuil@cisco.
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thank you for your comments.

On Thu, 2019-05-02 at 06:45 +0800, Rob Herring wrote:
> On Tue, Apr 23, 2019 at 06:45:00PM +0800, Jerry-ch Chen wrote:
> > From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > 
> > This patch adds the binding for describing the shared memory
> > used to exchange meta data between the co-processor and Face
> > Detection (FD) unit of the camera system on Mediatek SoCs.
> > 
> > Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > ---
> >  .../mediatek,reserve-memory-fd_smem.txt       | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-fd_smem.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-fd_smem.txt b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-fd_smem.txt
> > new file mode 100644
> > index 000000000000..52ae5071e238
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-fd_smem.txt
> > @@ -0,0 +1,44 @@
> > +Mediatek FD Shared Memory binding
> > +
> > +This binding describes the shared memory, which serves the purpose of
> > +describing the shared memory region used to exchange data between Face
> > +Detection hardware (FD) and co-processor in Mediatek SoCs.
> > +
> > +The co-processor doesn't have the iommu so we need to use the physical
> > +address to access the shared buffer in the firmware.
> > +
> > +The Face Detection hardware (FD) can access memory through mt8183 IOMMU so
> > +it can use dma address to access the memory region.
> > +(See iommu/mediatek,iommu.txt for the detailed description of Mediatek IOMMU)
> > +
> > +
> > +Required properties:
> > +
> > +- compatible: must be "mediatek,reserve-memory-fd_smem"
> > +
> > +- reg: required for static allocation (see reserved-memory.txt for
> > +  the detailed usage)
> > +
> > +- alloc-range: required for dynamic allocation. The range must
> > +  between 0x00000400 and 0x100000000 due to the co-processer's
> > +  addressing limitation
> > +
> > +- size: required for dynamic allocation. The unit is bytes.
> > +  for Face Detection Unit, you need 1 MB at least.
> 
> What's the most?
> 

For this part, we would like to revise as following:

alloc-range: required for dynamic allocation. The range must between
0x40000000 and 0x100000000 due to the co-processor's addressing
limitation

size: required for dynamic allocation. The unit is bytes.
for Face Detection Unit, you need 518KB.

> I don't think you really need reserved memory here if you don't need a 
> fixed address. The size is not that big that a contiguous allocation 
> shouldn't be a problem (though with IOMMU you don't even need that). 
> 'dma-ranges' can be used to set the kernel's dma mask and ensure a 
> range below 0x10000000.
> 

FD driver might be able to use the FD memory pool inside the scp
reserved memory instead of declaring reserved memory here.
would you have any suggestion if so?

Sincerely,
	Jerry


> Rob
