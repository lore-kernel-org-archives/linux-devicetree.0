From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: marvell: Enable Armada-8040-DB CPS SPI1
Date: Thu, 21 Sep 2017 09:52:39 +0200
Message-ID: <20170921075239.GE3568@kwain>
References: <20170921073643.5677-1-miquel.raynal@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170921073643.5677-1-miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Christine Gharzuzi <chrisg-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Miquel,

On Thu, Sep 21, 2017 at 09:36:43AM +0200, Miquel Raynal wrote:
> From: Christine Gharzuzi <chrisg-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> +&cps_spi1 {
> +	status =3D "okay";
> +
> +	spi-flash@0 {
> +		#address-cells =3D <0x1>;
> +		#size-cells =3D <0x1>;
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0x0>;
> +		spi-max-frequency =3D <20000000>;
> +
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			partition@0 {
> +				label =3D "Boot";
> +				reg =3D <0x0 0x200000>;
> +			};
> +			partition@200000 {
> +				label =3D "Filesystem";
> +				reg =3D <0x200000 0xd00000>;
> +			};
> +			partition@d00000 {

The node should be 'partition@f00000'.

> +				label =3D "Boot_2nd";
> +				reg =3D <0xf00000 0x100000>;
> +			};
> +		};
> +	};
> +};

Thanks,
Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEM7Tg8N8kXOlT7hOhXE2LyK3bvNgFAlnDb8cACgkQXE2LyK3b
vNhUCw//X2qe54X3ZisCFfaMHtw1yXl5GCGKJosy7ANvFJnc2kagx+UVJOJ+kv9A
zTqB567BMo31HrGDbD0Tbpnf7jF83wSxQG/5wkNLHe20sODQBuh8VZ+dDAJiXL1G
8DLwoJMOEcDThk6NJ7ybb5BQ1AJ6g4cbLajf3vE1IlQj8jUgnDp2XhaDGCS2nrVq
dtj0ChoGUE7lE9nrHGQgIH9x/HXi94H5CWZ1CgapM3poZf+tIhEwVhuPouQhdXGX
ID14kQPqBppCYBe8LQRxhxR7rGl/8EERxAitP0Y6MM/lbsqrm8a+6fqsRmPO5F2+
4JAhm0s2FrnEhHMeC+83F3JgvtWt3j/o4K1asc4lp6B2FHDyEk/LiCXwY6+kIpct
m7pVeYxjp3Ytxrw9ar2/rMM0EdVWd/uEJf6QNrrAsIWJMm1l6sH7RpTJ3wW8iRdt
NwFG9Ke0Nww6wGBfiDwNil4hp7hU/HgESiP+OtSf8APESbs1FIXXK6pjlxaahtJ4
v2sKKsjYV5E+Ql/79sUySglCjaHFIu1bb0GaRhdwa9T0EimzxM3gXYh15Mue4Q/z
xxaZe7gxfmbEkDOHRiyPWkFsGyOF32Jpq5l/rSPDSBJ5OeJVo7p7pIAc7tufVbIR
/RWadDw/F+TrLv/wjGn+8U87N1Lp1t5OOMydZybq/MR44CapCQI=
=LkRb
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
