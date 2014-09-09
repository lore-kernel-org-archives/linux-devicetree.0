From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/4] mfd/axp2xx: extend axp20x to support axp288 pmic
Date: Tue, 9 Sep 2014 15:37:04 +0200
Message-ID: <20140909133704.GO3804@lukather>
References: <1410215046-31751-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1410215046-31751-3-git-send-email-jacob.jun.pan@linux.intel.com>
 <20140909073747.GI3804@lukather>
 <20140909054517.5bd4e8b6@ultegra>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oJAv8lSwuaQsYd0G"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140909054517.5bd4e8b6@ultegra>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compagn>
List-Id: devicetree@vger.kernel.org


--oJAv8lSwuaQsYd0G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 09, 2014 at 05:45:17AM -0700, Jacob Pan wrote:
> > > -static int axp20x_i2c_probe(struct i2c_client *i2c,
> > > -			 const struct i2c_device_id *id)
> > > +static int axp2xx_match_device(struct axp2xx_dev *axp2xx, struct
> > > device *dev) {
> > > -	struct axp20x_dev *axp20x;
> > > +	const struct acpi_device_id *acpi_id;
> > >  	const struct of_device_id *of_id;
> > > -	int ret;
> > > =20
> > > -	axp20x =3D devm_kzalloc(&i2c->dev, sizeof(*axp20x),
> > > GFP_KERNEL);
> > > -	if (!axp20x)
> > > -		return -ENOMEM;
> > > +	of_id =3D of_match_device(axp2xx_of_match, dev);
> > > +	if (of_id) {
> > > +		axp2xx->variant =3D (long) of_id->data;
> > > +		goto found_match;
> > > +	}
> > > =20
> > > -	of_id =3D of_match_device(axp20x_of_match, &i2c->dev);
> > > -	if (!of_id) {
> > > -		dev_err(&i2c->dev, "Unable to setup AXP20X
> > > data\n");
> > > +	acpi_id =3D acpi_match_device(dev->driver->acpi_match_table,
> > > dev);
> > > +	if (!acpi_id || !acpi_id->driver_data) {
> > > +		dev_err(dev, "Unable to setup AXP2XX ACPI data\n");
> > >  		return -ENODEV;
> > >  	}
> > > -	axp20x->variant =3D (long) of_id->data;
> > > +	axp2xx->variant =3D (long) acpi_id->driver_data;
> >=20
> > Shouldn't that be in the if statement above? I guess acpi_id will be
> > null on a DT-based system.
> >=20
> I am not sure what you mean. if acpi_id =3D=3D NULL, then it will return
> -ENODEV since of_match_device() already found no match. If acpi_id !=3D
> NULL, then id must contain variant info.

Hmm, never mind. I read it backward and thought you were still in this
code path. I guess I need more coffee.

That goto isn't very intuitive though.

Maybe something like

if (of_id) {
   /* DT case */
} else if (acpi_id) {
  /* ACPI case */
} else {
  return;
}

would be better?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--oJAv8lSwuaQsYd0G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUDwKAAAoJEBx+YmzsjxAgEnYP/0Hzi9Djt972iel2iLbXdSCW
1b3bQf2LRVNhOJ3kDHgGQcMzxd5SlJquHTXTsEoRZnF4NMRPiPIDo34yT1cgagLR
+E3T10fdSFJf1veZ4rW4r19njFNYhe5bChEVSq6w1hsYrz0PtsrNcN9gTfqIyLOK
I0NVoyy4jbzC0NLkikNHHcsLzaciGbCdpUkWATyJz0m3UuYPFHBHT3U3cWd6ZvRz
0Dlr/nNx+1w50STODT47WTj2iB0VX2bsXoVQVzS3Vuz4rsJk/ixes15eW1qolizU
CdkEKjFSspz3LfI4UVSQZ1UrlohzZI0jmUBembYM5AhU5a8eBca7ObgoZE0eIP5k
ZYuBwvsDL2yp6mVIihZ/zWX9kSeJtiW6EEZDDromHMvadEZo/YkkpQO51waRUrwH
Rqh3luRr85wNyrzeMPvFYrGH2CCo9pgWBuKQ21CPHYz3JVbMszX04cXg7kD8Koau
qv2OqHsqZ9DQIvKV416iLZvVuumtcDpY40goUbc6lTyTWDBGCCPo3QrXUT0GS1zX
mKuLS9bAmjvwfVlhAQSdRUUA8QpqcpzzOSzcja0CEPw9pjZjiM8EP2xCjSgTQ/Xo
pDCQIbQEnRbL9+YqkFba0jN3qrp0Rf/obu224cDilT/IomC4MtJm/IVKSpVZg1+E
5ia5N08VuANhKzlBYsVA
=R500
-----END PGP SIGNATURE-----

--oJAv8lSwuaQsYd0G--
