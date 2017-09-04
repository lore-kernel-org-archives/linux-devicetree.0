From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5] arm64: allwinner: h5: add support for NanoPi NEO Plus2
Date: Mon, 4 Sep 2017 10:27:32 +0200
Message-ID: <20170904082732.g2q2tjd6qlvhaea7@flea>
References: <20170824231716.2623-1-antony@phenome.org>
 <20170830125057.38529-1-antony@phenome.org>
 <20170831145859.rief3fqo36ns23rm@flea>
 <20170901105313.m26y2re3ulskua43@AntonyAntony.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hx3j53k22auftwjx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170901105313.m26y2re3ulskua43-sIi4olfLYEDaK4aX9S0K76zUEOm+Xw19@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--hx3j53k22auftwjx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Antony,

On Fri, Sep 01, 2017 at 12:53:13PM +0200, Antony Antony wrote:
> > > +&emac {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&emac_rgmii_pins>;
> > > +	phy-supply =3D <&reg_gmac_3v3>;
> > > +	phy-handle =3D <&ext_rgmii_phy>;
> > > +	phy-mode =3D "rgmii";
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&mdio {
> > > +	ext_rgmii_phy: ethernet-phy@7 {
> > > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > > +		reg =3D <7>;
> > > +	};
> > > +};
> >=20
> > This will not compile.
>=20
> I don't understand you, because, v5 file compiled for me. Here is output=
=20
> from running system, just the relevant part.  using dtc -I fs=20
> /proc/device-tree
>=20
> ext_rgmii_phy =3D "/soc/ethernet@1c30000/mdio/ethernet-phy@7";
>=20
> ethernet@1c30000 {
> 	mdio {
> 	..
> 		ethernet-phy@7 {
> 			compatible =3D "ethernet-phy-ieee802.3-c22";
> 			phandle =3D <0x1c>;
> 			reg =3D <0x7>;
> 			linux,phandle =3D <0x1c>;
> 		};
> };
>=20
> Is this what you expect?

The bindings have been reverted recently, so if you based your work on
a version between 4.13-rc1 and 4.13-rc6 it will work, but anything
more recent will not compile anymore.

> > > +	status =3D "okay";
> > > +
> > > +	/*
> > > +	 * AMPAK AP6212A WiFi module with BCM43430, rev=3D1 inside
> > > +	 * sdio vendor ID: 0x02d0, sdio device ID: 0xa9a6
> > > +	 * There is no specific Documentation: dt-binding for BCM43430
> > > +	 * brcm,bcm4329-fmac compatible can initialize this module
> > > +	 */
> >=20
> > This is not really relevant.
>=20
> would you prefer no comment or a rewrite? How does this look?
>=20
> /*
>  * AMPAK AP6212A WiFi module with BCM43430, rev=3D1 inside
>  * sdio vendor ID: 0x02d0, sdio device ID: 0xa9a6
>  */
>=20
> I am afraid a casual reader would think "brcm,bcm4329-fmac" is wrong,=20
> because that is not the actual chip inside the module.

No comment is fine, and I'm not sure the casual reader will ever read
this :)

> > > +&mmc2_8bit_pins {
> > > +	/* Increase drive strength for DDR modes */
> > > +	drive-strength =3D <40>;
> >=20
> > It's very likely that you actually don't need 40mA
>=20
> drive-strength and the node mmc2_8bit_pins are gone. When I removed it=20
> drive-strength =3D <0x1e>;  seems the default. And eMMC seems to work whe=
n=20
> booting from Micro SD.

Yes, we set the specs default in the DTSI. 40mA is above what the spec
requires, so not a big deal, but useless.

> NOTE: the  40mA came from a vresion of vendor's old dts file and I also=
=20
> noticed the same value is used in other dts in kernel e.g=20
> sun8i-h3-orangepi-plus.dts, sun9i-a80-cubieboard4.dts
> It could be a copy paste error or those boards need it. Anyway I removed =
it.

And we used to let that in before yes, so there might be some places
where it's left.

Feel free to clean them up if you feel bored :)

> > > +&usb_otg {
> > > +	dr_mode =3D "host";
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&usbphy {
> > > +	/* USB Type-A ports' VBUS is always on */
> > > +	usb0_id_det-gpios =3D <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
> >=20
> > If it has an ID-detect pin, then it's not a host-only USB OTG
> > controller. dr_mode should be set to otga=20
>=20
> good point. I don't see an ID-detect connected in the schematic. The=20
> previous generation had.=20
>=20
> I will leave=20
> &usb_otg {
>   dr_mode =3D "host";
>   status =3D "okay";
> };
>=20
> &usbphy {
> 	/* USB Type-A ports' VBUS is always on */
> 	status =3D "okay";
> };

Looking at the schematics, it seems that the micro USB isn't even
wired to a bus but is only used to power the board. If so, you can
even remove the usb_otg node.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hx3j53k22auftwjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZrQ50AAoJEBx+YmzsjxAghJ8QAKoLRSetzxmZU/VHM66UW9Ty
jaw85VUHmNexQF+M1UpU2LtMr92rILdcY4MhjrpFfRW1Qgbki02CqS4kTSdLPMSt
r4ZEOVJqqbDp+KvbRJQazvKqRKigOWHzIpIkvZYkM2lvIjIyAqtnYWPWD0D9dp/w
RmBGudVE1CwLgV0FuArLoy4xke9hLulCjCB2DwyQdu521MwBg5zgcwG5heOvr5/4
CFGdc0XKyRrQSPcT/MaVG6EGxehEHcD9BhzvB+lxk5JQsS5TyDAVcd94CXpaOMG3
30ZKVqzqLpHSEu8+cfvL9Y0KTJKuavicB9FKp9PJ2YAXMcubgH7VPm3t2GEL1DJr
985NqQeXAfVM74jRVlfpRINGKVMOAzHk9I+w7010WZAhxStIsvSZT4OLCqDpQkVb
pn3bEy5/Y6CZ0eIYEd9d9YcDTgOca6shvVPPXrvoJHLwY6Mr+xY2oEnv8jTfUBUH
88J/nBlDahRZxHQm58G9KIXg6hfNJJTendce88EtIyMOXt1zr6OFHsPKs2jN1ns0
HpVYkte3IPkuspN3l8TIoaewLNtPLM/wtnqa2/7G6PSHlO5h4iff7sDUEfDbug2A
5OyGwfnFt8C9pWhTiIM36qbmvXvzjaaLhO7rGS5I1OtqBvURn2blpyY/uRiIZ4BY
fbkZmulj/s+zqp/edjjR
=sHYo
-----END PGP SIGNATURE-----

--hx3j53k22auftwjx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
