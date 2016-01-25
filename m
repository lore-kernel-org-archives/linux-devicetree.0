From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 07/15] dmaengine: dw: revisit data_width property
Date: Mon, 25 Jan 2016 10:45:47 +0200
Message-ID: <1453711547.2521.209.camel@linux.intel.com>
References: <1453663322-14474-1-git-send-email-mans@mansr.com>
	 <1453663322-14474-8-git-send-email-mans@mansr.com>
	 <C2D7FE5348E1B147BCA15975FBA23075F4E86560@us01wembx1.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E86560-cALIpNOex2c3t6iM5Z/N3fufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2016-01-25 at 07:32 +0000, Vineet Gupta wrote:
> On Monday 25 January 2016 12:55 AM, Mans Rullgard wrote:
> > From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> >=20
> > There are several changes are done here:
> >=20
> > =C2=A0- Convert the property to be in bytes
> >=20
> > =C2=A0=C2=A0=C2=A0Much more convenient than keeping encoded value.
> >=20
> > =C2=A0- Use one value for all AHB masters for now
> >=20
> > =C2=A0=C2=A0=C2=A0It seems in practice we have no controllers where=
 masters have
> > different
> > =C2=A0=C2=A0=C2=A0data bus width, we still might return to distinct=
 values when
> > there is a use
> > =C2=A0=C2=A0=C2=A0case.
> >=20
> > =C2=A0- Rename data_width to data-width in the device tree bindings=
=2E
> >=20
> > =C2=A0- While here, replace dwc_fast_ffs() by __ffs().
> >=20
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
> > ---
> > This patch changes the DT binding, so it should probably be amended
> > for
> > compatibility with old device trees.=C2=A0=C2=A0I've included it as=
 is since
> > I think
> > the change as such is good.
> > ---
> > =C2=A0Documentation/devicetree/bindings/dma/snps-dma.txt |=C2=A0=C2=
=A05 ++-
> > =C2=A0arch/arc/boot/dts/abilis_tb10x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A02 +-
> > =C2=A0arch/arm/boot/dts/spear13xx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|=C2=A0=C2=A04 +--
> > =C2=A0drivers/dma/dw/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 40 =
+++-------
> > ------------
> > =C2=A0drivers/dma/dw/platform.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A08 ++---
> > =C2=A0drivers/dma/dw/regs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A02 +-
> > =C2=A0include/linux/platform_data/dma-dw.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A05 ++-
> > =C2=A07 files changed, 16 insertions(+), 50 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt
> > b/Documentation/devicetree/bindings/dma/snps-dma.txt
> > index c99c1ffac199..fe7f7710a6b4 100644
> > --- a/Documentation/devicetree/bindings/dma/snps-dma.txt
> > +++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
> > @@ -13,8 +13,7 @@ Required properties:
> > =C2=A0- chan_priority: priority of channels. 0 (default): increase =
from
> > chan 0->n, 1:
> > =C2=A0=C2=A0=C2=A0increase from chan n->0
> > =C2=A0- block_size: Maximum block size supported by the controller
> > -- data_width: Maximum data width supported by hardware per AHB
> > master
> > -=C2=A0=C2=A0(0 - 8bits, 1 - 16bits, ..., 5 - 256bits)
> > +- data-width: Maximum data width supported by hardware (in bytes)
>=20
> To the reader this suggests a value truely byte granular, but code
> uses ffs
> implying that it is still power of 2.
> Can you mention this here (....in bytes, always power of 2).

While this comment is good, I have still note that using non-power of 2
values will not break anything. Least power of two number will be used
in that case. So, means I would suggest to replace 'always' by 'better
to be' or something like that.

>=20
> > ...
> > @@ -726,10 +710,7 @@ dwc_prep_dma_memcpy(struct dma_chan *chan,
> > dma_addr_t dest, dma_addr_t src,
> > =C2=A0
> > =C2=A0	dwc->direction =3D DMA_MEM_TO_MEM;
> > =C2=A0
> > -	data_width =3D dw->data_width[dwc->m_master];
> > -
> > -	src_width =3D dst_width =3D min_t(unsigned int, data_width,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dwc_fast_ffs(src | dest |
> > len));
> > +	src_width =3D dst_width =3D __ffs(dw->data_width | src | dest
> > | len);
> > ...
>=20
> -Vineet

--=20
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
