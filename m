From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v2 08/10] dt-bindings: media: Document bindings for the
 Sunxi-Cedrus VPU driver
Date: Fri, 20 Apr 2018 01:31:59 +0000
Message-ID: <CAAFQd5DT_xjUbZzFOoKk7_duiSZ8Awb1J=0dPEhVTBk0P3gppA@mail.gmail.com>
References: <20180419154124.17512-1-paul.kocialkowski@bootlin.com>
 <20180419154536.17846-4-paul.kocialkowski@bootlin.com>
 <1524153860.3416.9.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524153860.3416.9.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Pawel Osciak <pawel@osciak.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, wens@csie.org, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Alexandre Courbot <acourbot@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Paul, Philipp,

On Fri, Apr 20, 2018 at 1:04 AM Philipp Zabel <p.zabel@pengutronix.de>
wrote:

> Hi Paul,

> On Thu, 2018-04-19 at 17:45 +0200, Paul Kocialkowski wrote:
> > This adds a device-tree binding document that specifies the properties
> > used by the Sunxi-Cedurs VPU driver, as well as examples.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../devicetree/bindings/media/sunxi-cedrus.txt     | 50
++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644
Documentation/devicetree/bindings/media/sunxi-cedrus.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/sunxi-cedrus.txt
b/Documentation/devicetree/bindings/media/sunxi-cedrus.txt
> > new file mode 100644
> > index 000000000000..71ad3f9c3352
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/sunxi-cedrus.txt
> > @@ -0,0 +1,50 @@
> > +Device-tree bindings for the VPU found in Allwinner SoCs, referred to
as the
> > +Video Engine (VE) in Allwinner literature.
> > +
> > +The VPU can only access the first 256 MiB of DRAM, that are DMA-mapped
starting
> > +from the DRAM base. This requires specific memory allocation and
handling.

And no IOMMU? Brings back memories.

> > +
> > +Required properties:
> > +- compatible         : "allwinner,sun4i-a10-video-engine";
> > +- memory-region         : DMA pool for buffers allocation;
> > +- clocks             : list of clock specifiers, corresponding to
entries in
> > +                          the clock-names property;
> > +- clock-names                : should contain "ahb", "mod" and "ram"
entries;
> > +- assigned-clocks       : list of clocks assigned to the VE;
> > +- assigned-clocks-rates : list of clock rates for the clocks assigned
to the VE;
> > +- resets             : phandle for reset;
> > +- interrupts         : should contain VE interrupt number;
> > +- reg                        : should contain register base and length
of VE.
> > +
> > +Example:
> > +
> > +reserved-memory {
> > +     #address-cells = <1>;
> > +     #size-cells = <1>;
> > +     ranges;
> > +
> > +     /* Address must be kept in the lower 256 MiBs of DRAM for VE. */
> > +     ve_memory: cma@4a000000 {
> > +             compatible = "shared-dma-pool";
> > +             reg = <0x4a000000 0x6000000>;
> > +             no-map;
> > +             linux,cma-default;
> > +     };
> > +};
> > +
> > +video-engine@1c0e000 {

> This is not really required by any specification, and not as common as
> gpu@..., but could this reasonably be called "vpu@1c0e000" to follow
> somewhat-common practice?

AFAIR the name is supposed to be somewhat readable for someone that doesn't
know the hardware. To me, "video-engine" sounds more obvious than "vpu",
but we actually use "codec" already, in case of MFC and JPEG codec on
Exynos. If encode/decode is the only functionality of this block, I'd
personally go with "codec". If it can do other things, e.g.
scaling/rotation without encode/decode, I'd probably call it
"video-processor".

Best regards,
Tomasz
