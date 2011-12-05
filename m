From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] drivers, char: add U-Boot bootcount driver
Date: Mon, 5 Dec 2011 08:43:05 +0100
Message-ID: <20111205074305.GA7806@avionic-0098.mockup.avionic-design.de>
References: <1322991921-21096-1-git-send-email-hs@denx.de>
 <20111204114741.GA5788@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0651321381914914933=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111204114741.GA5788-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vitaly Bordug <vbordug-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============0651321381914914933==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Wolfram Sang wrote:
> On Sun, Dec 04, 2011 at 10:45:21AM +0100, Heiko Schocher wrote:
[...]
> >                   reg =3D <0x23060 0x20>;
>=20
> I assume that non-volatile memory would qualify as a boot-counter, so tho=
se
> could be tied to I2C busses etc? reg would not fit then.

This is not really on-topic, but in the device-tree the "reg" property is
used to encode an I2C device's slave address.

Thierry

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7cdgkACgkQZ+BJyKLjJp+5QwCfeX4ZaVA2ok1ZGKMt/jDI2X6E
fGMAoK5wU19BDYES7zSJ7/iBMfzg6VXD
=FRhB
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--

--===============0651321381914914933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0651321381914914933==--
