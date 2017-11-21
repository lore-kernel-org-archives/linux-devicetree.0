From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] pinctrl: mcp23s08: configure irq polarity using
 irq data
Date: Tue, 21 Nov 2017 16:21:42 +0100
Message-ID: <20171121152142.zg3r57gl2kenjwgi@earth>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
 <1511252491-79952-5-git-send-email-preid@electromag.com.au>
 <20171121133434.tuvxtrrbabjk4zeg@earth>
 <c191a9d6-3ebb-e95b-7342-aa18598ddf2b@electromag.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ze7drs3yxfouuxb2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c191a9d6-3ebb-e95b-7342-aa18598ddf2b-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ze7drs3yxfouuxb2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 21, 2017 at 10:46:29PM +0800, Phil Reid wrote:
> G'day Sebastian,
>=20
> On 21/11/2017 21:34, Sebastian Reichel wrote:
> > Hi,
> >=20
> > On Tue, Nov 21, 2017 at 04:21:30PM +0800, Phil Reid wrote:
> > > The irq polarity is already encoded in the irq config. Use that to
> > > determine the polarity for the mcp32s08 irq output instead of the
> > > custom microchip,irq-active-high property.
> > >=20
> > > Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
> > > ---
> >=20
> > I don't like, that we use the flags for configuring the host
> > interrupt input and the mcp23xxx interrupt output. Usually
> > when the interrupt line has an inverter on it, board DTS files
> > just toggle the interrupts polarity. This will not work with
> > this patch applied. We would need to explicitly add an inverter
> > in the interrupt line, which is completely different to how its
> > implemented everywhere else (I know at least some Tegra devices
> > have implicit inverters on interrupt lines).
> >=20
> > In case this is really wanted, this patch and the first patch
> > should be merged to avoid temporarily exposing the splitted
> > logic.
> >=20
> Thanks for looking at the series.
>=20
> Yes I understand where your coming from. And that's exactly what I
> was trying to do in v2. I have 2 of these devices with open drain output
> that is feed to an inverter. So active low output from devices and irq
> consumer is active high input.
>=20
> However Linux wasn't a fan of the property and wanted it gone.

I guess s/Linux/Linus Walleij/?

> He suggested we need a "inverter" device to allow for that in the
> device tree. I haven't got my head around how to do that thou.

Just to be on the same term, we are talking about these two variants:

--------------------------------------------
gpio: host-gpio {
    random-properties;
}

inv: line-inverter {
    /*
     * configure the gpio controller input to be active low
     * and the inverter interrupt output to be active low
     */
    interrupts =3D <&gpio ACTIVE_LOW>;
};

mcp23xxx {
    random-properties;

    /*
     * configure the chip interrupt output to be active high=20
     * and the inverter interrupt input to be active high
     */
    interrupts =3D <&inv ACTIVE_HIGH>;
}
--------------------------------------------

versus

--------------------------------------------
gpio: host-gpio {
    random-properties;
}

mcp23xxx {
    random-properties;

    /* configure host interrupt input pin to be active low */
    interrupts =3D <&gpio ACTIVE_LOW>;

    /* configure chip interrupt output pin to be active high */
    microchip,irq-active-high;
}
--------------------------------------------

I think this is something, that Rob should comment on. Obviously at
least in the mainline kernel nobody implemented the first solution
(since there is no fitting interrupt-invert driver), but there are
a few instances of the second variant. On the other hand the first
solution describes the hardware more detailed.

> And if someone is relying on that implicit behaviour are we allowed
> to break things? Probably ok with this one as it's currently not possible
> due to code patch 1 removes.
>=20
> If we need to model the invert to get the patches accepted I look into th=
at.
> I don't actually need it for my system as I can set open-drain with overr=
ides
> the active-high control on this device, while have active high irq consum=
er.
> :)

IMHO the explicit line-inverter is a bit over-engineered and
implicit line-inverter is enough, but I'm fine with both solutions.
I think the DT binding maintainers should comment on this though,
since it's pretty much a core decision about interrupt specifiers.

-- Sebastian

> > >   drivers/pinctrl/pinctrl-mcp23s08.c | 11 ++++++++---
> > >   1 file changed, 8 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pin=
ctrl-mcp23s08.c
> > > index 8ff9b77..6b3f810 100644
> > > --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> > > +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> > > @@ -773,6 +773,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mc=
p, struct device *dev,
> > >   	bool mirror =3D false;
> > >   	bool irq_active_high =3D false;
> > >   	bool open_drain =3D false;
> > > +	u32 irq_trig;
> > >   	mutex_init(&mcp->lock);
> > > @@ -863,9 +864,13 @@ static int mcp23s08_probe_one(struct mcp23s08 *m=
cp, struct device *dev,
> > >   	mcp->irq_controller =3D
> > >   		device_property_read_bool(dev, "interrupt-controller");
> > >   	if (mcp->irq && mcp->irq_controller) {
> > > -		irq_active_high =3D
> > > -			device_property_read_bool(dev,
> > > -					      "microchip,irq-active-high");
> > > +		if (device_property_present(dev, "microchip,irq-active-high"))
> > > +			dev_warn(dev,
> > > +				 "microchip,irq-active-high is deprecated\n");
> > > +
> > > +		irq_trig =3D irqd_get_trigger_type(irq_get_irq_data(mcp->irq));
> > > +		if (irq_trig =3D=3D IRQF_TRIGGER_HIGH)
> > > +			irq_active_high =3D true;
> > >   		mirror =3D device_property_read_bool(dev, "microchip,irq-mirror");
> > >   		open_drain =3D device_property_read_bool(dev, "drive-open-drain");
> > > --=20
> > > 1.8.3.1

--ze7drs3yxfouuxb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAloURIMACgkQ2O7X88g7
+po7BBAAlQ/Mcobx4qAaerQ7puYw7iXuptqHCrLO7dDQ343cFAAwJabUj9aRIvO5
Cdoxjz9AU618AGkf7yHwr6PwCo/tYsCCzbvRmc+rzIwE1yL8A219X9zokrA/8jcw
ybMQWQq+CumvuZ7baAvoVnAbiX+vWGkUNA37JHDkgt80PTA0aGMPFJ46tRk5sPc4
g3+GBjpINlY+f2sYc9CW9jz9xWzCPEsQDT/jLSfrk/ZYXxrMJ5JVpc+df7n/vnCb
L5UBgXBik7lWZU4wY4Gzn3ufIpG4ZbV/SAM0YiAt29tZVk+gR270EM8DmJFz8ezg
cEQv+afH1SEUPsyYXogZcuDQgXr8VweKlTjrBhTHvy3LKbLXY4JrKM9hroLIJpkW
E/VVXonIw89JZvl8kDelkRwHOwzloy9t8c+g5QqFdf+6nCfMEkugw5UaqMpyUWQ9
WYIpTPyOfU1K84emgDYuuZ0oF8heugeQdMfTK1Tn6enBBJPPexWZykk8+QNYTCU0
2sA/Q36GBe+4h4UG3XgzuPbwlZBgLIMQYYV3EEv9fgVxhZ+LkUJRJ4kfMBk7Q6ks
y1J/nB8IzhD9QtdCJte8h1IUU/OwrwKNMxyhfmuOrQ7aw9Wt7IWsDwi/wpsoJMKK
FqC7+izWFLr0SotdbMxLMB94kIt6wBTk2YSVP2giKNhyuqygSnk=
=RAns
-----END PGP SIGNATURE-----

--ze7drs3yxfouuxb2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
