From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/2] mfd: atmel-flexcom: add a driver for Atmel
 Flexible Serial Communication Unit
Date: Thu, 23 Jul 2015 10:13:11 +0100
Message-ID: <20150723091311.GX3061@x1>
References: <cover.1437558598.git.cyrille.pitchen@atmel.com>
 <7639e02fc2b16dc20b19fbe3bbbb986b0f3b9887.1437558598.git.cyrille.pitchen@atmel.com>
 <20150723073217.GT3061@x1>
 <20150723100101.7290242b@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150723100101.7290242b@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 23 Jul 2015, Boris Brezillon wrote:

> Hi Lee,
>=20
> On Thu, 23 Jul 2015 08:32:17 +0100
> Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>=20
> > On Wed, 22 Jul 2015, Cyrille Pitchen wrote:
> > > +	for_each_child_of_node(np, child) {
> > > +		const char *compatible;
> > > +		int cplen;
> > > +
> > > +		if (!of_device_is_available(child))
> > > +			continue;
> > > +
> > > +		compatible =3D of_get_property(child, "compatible", &cplen);
> > > +		if (!compatible || strlen(compatible) > cplen)
> > > +			continue;
> > > +
> > > +		if (strstr(compatible, "-usart")) {
> > > +			opmode =3D FLEX_MR_OPMODE_USART;
> > > +			break;
> > > +		}
> > > +
> > > +		if (strstr(compatible, "-spi")) {
> > > +			opmode =3D FLEX_MR_OPMODE_SPI;
> > > +			break;
> > > +		}
> > > +
> > > +		if (strstr(compatible, "-i2c")) {
> > > +			opmode =3D FLEX_MR_OPMODE_TWI;
> > > +			break;
> > > +		}
> > > +	}
> >=20
> > From what I understand Flexcom is a wrapper which can sit above any
> > number of SPI, I2C and/or UART devices.  Devices which you don't
> > really have any control over (source code wise).  So wouldn't it be
> > better to match on the details you do have control over i.e. the no=
de
> > name, rather than the compatible string?
> >=20
> > I would personally match on of_find_node_by_name() to future-proof
> > your implementation.
>=20
> Actually, I think using compatible strings is more future-proof than
> using the node names, because nothing in the DT bindings doc enforce =
the
> node name, and usually what we use to attach a node to a specific
> driver is the compatible string (this one is specified in the binding=
s
> doc).

I know what you're saying, but what if someone uses the Flexcom driver
to wrap a different type of SPI driver where (for instance) the
compatible string used is "<name>-<newtype>".  Then we'd have to keep
adding more lines here to accommodate.

Whereas if we used the child node name which only pertains to _this_
driver, we would then have full control and know that (unless it
=46lexcom is used for a completely different type of serial controller)
we wouldn't have to keep expanding the code to accommodate.

> Regarding the implementation itself, I would match the child node wit=
h
> an of_device_id table rather than trying to find a specific substring
> in the compatible string, but I think that's only a matter of taste.

You mean duplicate each of the supported device's compatible strings
in this driver, then fetch the attributed of_match_device()->data
value?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
