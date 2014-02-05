From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v7 2/7] dt-bindings: sram: describe option to reserve parts of the memory
Date: Wed, 05 Feb 2014 13:05:14 +0100
Message-ID: <1816961.2dvm7Iumeh@phil>
References: <4970034.fqvMoHdOyd@phil> <1782709.QdZpsrsctf@phil> <20140205111247.476B7C40A89@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140205111247.476B7C40A89-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 5. Februar 2014, 11:12:47 schrieb Grant Likely:
> On Mon, 20 Jan 2014 16:42:58 +0100, Heiko St=C3=BCbner <heiko@sntech.=
de> wrote:
> > Some SoCs need parts of their sram for special purposes. So while b=
eing
> > part of the peripheral, it should not be part of the genpool contro=
lling
> > the sram.
> >=20
> > Therefore add an option mmio-sram-reserved to keep arbitrary portio=
ns of
> > the sram from general usage.
> >=20
> > Suggested-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > Tested-by: Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> >=20
> >  Documentation/devicetree/bindings/misc/sram.txt |    8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/misc/sram.txt
> > b/Documentation/devicetree/bindings/misc/sram.txt index 4d0a00e..09=
ee7a3
> > 100644
> > --- a/Documentation/devicetree/bindings/misc/sram.txt
> > +++ b/Documentation/devicetree/bindings/misc/sram.txt
> >=20
> > @@ -8,9 +8,17 @@ Required properties:
> >  - reg : SRAM iomem address range
> >=20
> > +Optional properties:
> > +
> > +- mmio-sram-reserved: ordered list of reserved chunks inside the s=
ram
> > that
> > +  should not be used by the operating system.
> > +  Format is <base size>, <base size>, ...; with base being relativ=
e to
> > the
> > +  reg property base.
> > +
>=20
> We've now got a draft binding for reserved memory. Can you use the fo=
rmat
> here? Basically each reserved region is a sub node with either a reg
> property or a size property.
>=20
> This is specifically for sram, so I won't make a big deal about it, b=
ut
> it would be good to have some commonality.

I guess you're talking about "[PATCH v2 0/5] reserved-memory regions/CM=
A in=20
devicetree, again", right?

In general I'm all for commonality :-). So I guess you mean it to look=20
something like the following:

	sram: sram@10080000 {
		compatible =3D "rockchip,rk3066-sram", "mmio-sram";
		reg =3D <0x10080000 0x8000>;

		reserved-memory {
			#address-cells =3D <1>;
			#size-cells =3D <1>;

			smp@200 {
				/* hmm, relative or absolute, aka 0x200 or 0x10080200? */
				reg =3D <0x200 0x50>;
			};
		};
	};

As it looks like only a slight modification of my "parsing" code this s=
hould be=20
doable. Do you suggest more changes to the example above?


Heiko


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
