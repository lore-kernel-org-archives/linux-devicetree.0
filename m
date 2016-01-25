From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/15] dmaengine: dw: revisit data_width property
Date: Mon, 25 Jan 2016 10:31:30 +0000
Message-ID: <yw1xfuxmkl19.fsf@unicorn.mansr.com>
References: <1453663322-14474-1-git-send-email-mans@mansr.com>
	<1453663322-14474-8-git-send-email-mans@mansr.com>
	<C2D7FE5348E1B147BCA15975FBA23075F4E86560@us01wembx1.internal.synopsys.com>
	<1453711547.2521.209.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453711547.2521.209.camel-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> (Andy Shevchenko's
	message of "Mon, 25 Jan 2016 10:45:47 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine@vger.kernel.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:

> On Mon, 2016-01-25 at 07:32 +0000, Vineet Gupta wrote:
>> On Monday 25 January 2016 12:55 AM, Mans Rullgard wrote:
>> > From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> >=20
>> > There are several changes are done here:
>> >=20
>> > =A0- Convert the property to be in bytes
>> >=20
>> > =A0=A0=A0Much more convenient than keeping encoded value.
>> >=20
>> > =A0- Use one value for all AHB masters for now
>> >=20
>> > =A0=A0=A0It seems in practice we have no controllers where masters=
 have
>> > different
>> > =A0=A0=A0data bus width, we still might return to distinct values =
when
>> > there is a use
>> > =A0=A0=A0case.
>> >=20
>> > =A0- Rename data_width to data-width in the device tree bindings.
>> >=20
>> > =A0- While here, replace dwc_fast_ffs() by __ffs().
>> >=20
>> > Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> > Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
>> > ---
>> > This patch changes the DT binding, so it should probably be amende=
d
>> > for
>> > compatibility with old device trees.=A0=A0I've included it as is s=
ince
>> > I think
>> > the change as such is good.
>> > ---
>> > =A0Documentation/devicetree/bindings/dma/snps-dma.txt |=A0=A05 ++-
>> > =A0arch/arc/boot/dts/abilis_tb10x.dtsi=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0|=A0=A02 +-
>> > =A0arch/arm/boot/dts/spear13xx.dtsi=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0|=A0=A04 +--
>> > =A0drivers/dma/dw/core.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0| 40 +++-------
>> > ------------
>> > =A0drivers/dma/dw/platform.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0|=A0=A08 ++---
>> > =A0drivers/dma/dw/regs.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0|=A0=A02 +-
>> > =A0include/linux/platform_data/dma-dw.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0|=A0=A05 ++-
>> > =A07 files changed, 16 insertions(+), 50 deletions(-)
>> >=20
>> > diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt
>> > b/Documentation/devicetree/bindings/dma/snps-dma.txt
>> > index c99c1ffac199..fe7f7710a6b4 100644
>> > --- a/Documentation/devicetree/bindings/dma/snps-dma.txt
>> > +++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
>> > @@ -13,8 +13,7 @@ Required properties:
>> > =A0- chan_priority: priority of channels. 0 (default): increase fr=
om
>> > chan 0->n, 1:
>> > =A0=A0=A0increase from chan n->0
>> > =A0- block_size: Maximum block size supported by the controller
>> > -- data_width: Maximum data width supported by hardware per AHB
>> > master
>> > -=A0=A0(0 - 8bits, 1 - 16bits, ..., 5 - 256bits)
>> > +- data-width: Maximum data width supported by hardware (in bytes)
>>=20
>> To the reader this suggests a value truely byte granular, but code
>> uses ffs
>> implying that it is still power of 2.
>> Can you mention this here (....in bytes, always power of 2).
>
> While this comment is good, I have still note that using non-power of=
 2
> values will not break anything. Least power of two number will be use=
d
> in that case. So, means I would suggest to replace 'always' by 'bette=
r
> to be' or something like that.

Although the code rounds down, the hardware actually works in powers of
two, and it's better to document this.

--=20
M=E5ns Rullg=E5rd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
