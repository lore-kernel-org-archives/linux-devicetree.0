From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v5] media: et8ek8: add device tree binding documentation
Date: Fri, 11 Nov 2016 13:17:50 +0100
Message-ID: <20161111121750.GA3022@amd>
References: <20161023191706.GA25754@amd>
 <20161030204134.hpmfrnqhd4mg563o@rob-hp-laptop>
 <20161107104648.GB5326@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161107104648.GB5326@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2016-11-07 11:46:48, Pavel Machek wrote:
> Add device tree binding documentation for toshiba et8ek8 sensor.
>=20
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>

Rob, can we get an ack here?

Thanks,
							Pavel

> diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.t=
xt b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
> new file mode 100644
> index 0000000..b03b21d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
> @@ -0,0 +1,53 @@
> +Toshiba et8ek8 5MP sensor
> +
> +Toshiba et8ek8 5MP sensor is an image sensor found in Nokia N900 device
> +
> +More detailed documentation can be found in
> +Documentation/devicetree/bindings/media/video-interfaces.txt .
> +
> +
> +Mandatory properties
> +--------------------
> +
> +- compatible: "toshiba,et8ek8"
> +- reg: I2C address (0x3e, or an alternative address)
> +- vana-supply: Analogue voltage supply (VANA), 2.8 volts
> +- clocks: External clock to the sensor
> +- clock-frequency: Frequency of the external clock to the sensor. Camera
> +  driver will set this frequency on the external clock. The clock freque=
ncy is
> +  a pre-determined frequency known to be suitable to the board.
> +- reset-gpios: XSHUTDOWN GPIO. The XSHUTDOWN signal is active high. The =
sensor
> +  is in hardware standby mode when the signal is in low state.
> +
> +
> +Endpoint node mandatory properties
> +----------------------------------
> +
> +- remote-endpoint: A phandle to the bus receiver's endpoint node.
> +
> +Endpoint node optional properties
> +----------------------------------
> +
> +- clock-lanes: <0>
> +- data-lanes: <1..n>
> +
> +Example
> +-------
> +
> +&i2c3 {
> +	clock-frequency =3D <400000>;
> +
> +	cam1: camera@3e {
> +		compatible =3D "toshiba,et8ek8";
> +		reg =3D <0x3e>;
> +		vana-supply =3D <&vaux4>;
> +		clocks =3D <&isp 0>;
> +		clock-frequency =3D <9600000>;
> +		reset-gpio =3D <&gpio4 6 GPIO_ACTIVE_HIGH>; /* 102 */
> +		port {
> +			csi_cam1: endpoint {
> +				remote-endpoint =3D <&csi_out1>;
> +			};
> +		};
> +	};
> +};
>=20
>=20



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgltu4ACgkQMOfwapXb+vIgWwCdHLmjWXC5LDGJnaG6/oOPYQpk
8dQAn1dy30+Jujqczk0da+zyGtcXh+IJ
=1I2P
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
