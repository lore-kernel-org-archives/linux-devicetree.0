From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 07/15] dmaengine: dw: revisit data_width property
Date: Mon, 25 Jan 2016 12:36:50 +0200
Message-ID: <1453718210.2521.219.camel@linux.intel.com>
References: <1453663322-14474-1-git-send-email-mans@mansr.com>
	 <1453663322-14474-8-git-send-email-mans@mansr.com>
	 <C2D7FE5348E1B147BCA15975FBA23075F4E86560@us01wembx1.internal.synopsys.com>
	 <1453711547.2521.209.camel@linux.intel.com>
	 <yw1xfuxmkl19.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <yw1xfuxmkl19.fsf-OEaqT8BN2ezZK2NkWkPsZwC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Cc: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2016-01-25 at 10:31 +0000, M=C3=A5ns Rullg=C3=A5rd wrote:
> Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
>=20
> > On Mon, 2016-01-25 at 07:32 +0000, Vineet Gupta wrote:
> > > On Monday 25 January 2016 12:55 AM, Mans Rullgard wrote:

> > > > --- a/Documentation/devicetree/bindings/dma/snps-dma.txt
> > > > +++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
> > > > @@ -13,8 +13,7 @@ Required properties:
> > > > =C2=A0- chan_priority: priority of channels. 0 (default): incre=
ase
> > > > from
> > > > chan 0->n, 1:
> > > > =C2=A0=C2=A0=C2=A0increase from chan n->0
> > > > =C2=A0- block_size: Maximum block size supported by the control=
ler
> > > > -- data_width: Maximum data width supported by hardware per AHB
> > > > master
> > > > -=C2=A0=C2=A0(0 - 8bits, 1 - 16bits, ..., 5 - 256bits)
> > > > +- data-width: Maximum data width supported by hardware (in
> > > > bytes)
> > >=20
> > > To the reader this suggests a value truely byte granular, but
> > > code
> > > uses ffs
> > > implying that it is still power of 2.
> > > Can you mention this here (....in bytes, always power of 2).
> >=20
> > While this comment is good, I have still note that using non-power
> > of 2
> > values will not break anything. Least power of two number will be
> > used
> > in that case. So, means I would suggest to replace 'always' by
> > 'better
> > to be' or something like that.
>=20
> Although the code rounds down, the hardware actually works in powers
> of
> two, and it's better to document this.

Let's do "(in bytes, power of 2)" then?

--=20
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
