From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH V1 1/6] dt-bindings: mt8183: Add binding for DIP
 shared memory
Date: Tue, 14 May 2019 11:19:38 -0500
Message-ID: <CAL_JsqKGW9WqyNgqKD0MxsqxYHKZ+VNV5A2p+neGqwmKmiODOQ@mail.gmail.com>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-2-frederic.chen@mediatek.com>
 <20190430011506.GA8514@bogus>
 <1557238925.11663.21.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1557238925.11663.21.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frederic Chen <frederic.chen@mediatek.com>
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Rynn.Wu@mediatek.com, christie.yu@mediatek.com, srv_heupstream <srv_heupstream@mediatek.com>, holmes.chiou@mediatek.com, suleiman@chromium.org, Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>, Tomasz Figa <tfiga@chromium.org>, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, Hans Verkuil <hans.verkuil@cisco.com>, zwisler@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 7, 2019 at 9:22 AM Frederic Chen <frederic.chen@mediatek.com> wrote:
>
> Dear Rob,
>
> I appreciate your comments.
>
> On Mon, 2019-04-29 at 20:15 -0500, Rob Herring wrote:
> > On Wed, Apr 17, 2019 at 06:45:06PM +0800, Frederic Chen wrote:
> > > This patch adds the binding for describing the shared memory
> > > used to exchange configuration and tuning data between the
> > > co-processor and Digital Image Processing (DIP) unit of the
> > > camera ISP system on Mediatek SoCs.
> > >
> > > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > > ---
> > >  .../mediatek,reserve-memory-dip_smem.txt      | 45 +++++++++++++++++++
> > >  1 file changed, 45 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > > new file mode 100644
> > > index 000000000000..64c001b476b9
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > > @@ -0,0 +1,45 @@
> > > +Mediatek DIP Shared Memory binding
> > > +
> > > +This binding describes the shared memory, which serves the purpose of
> > > +describing the shared memory region used to exchange data between Digital
> > > +Image Processing (DIP) and co-processor in Mediatek SoCs.
> > > +
> > > +The co-processor doesn't have the iommu so we need to use the physical
> > > +address to access the shared buffer in the firmware.
> > > +
> > > +The Digital Image Processing (DIP) can access memory through mt8183 IOMMU so
> > > +it can use dma address to access the memory region.
> > > +(See iommu/mediatek,iommu.txt for the detailed description of Mediatek IOMMU)
> > > +
> > > +
> > > +Required properties:
> > > +
> > > +- compatible: must be "mediatek,reserve-memory-dip_smem"
> >
> > Don't use '_'.
>
> I got it. I will use "mediatek,reserve-memory-dip-smem" instead in next
> version of the patch
>
> >
> > > +
> > > +- reg: required for static allocation (see reserved-memory.txt for
> > > +  the detailed usage)
> > > +
> > > +- alloc-range: required for dynamic allocation. The range must
> > > +  between 0x00000400 and 0x100000000 due to the co-processer's
> > > +  addressing limitation
> >
> > Generally, you should pick either static or dynamic allocation for a
> > given binding. Static if there's some address restriction or sharing,
> > dynamic if not.
> >
> > Sounds like static in this case.
> >
>
> DIP reserved memory has address restriction so it is the static case. I
> would like to remove the dynamic allocation part and modify the
> description as following:
>
> - reg: required for DIP. The range must be between 0x00000400 and
>   0x100000000 due to the co-processor's addressing limitation.
>   The size must be 26MB. Please see reserved-memory.txt for the
>   detailed usage.

You can use dma-ranges to define addressing translations and
restrictions like this. That will in turn set the device's dma-mask to
ensure allocations are done in a region that is addressable.

But if you have a known, fixed size, then a carve out with
reserved-memory is fine.

Rob
