From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1 2/3] usb: phy: convert gpio-vbus to gpio_desc
Date: Wed, 5 Nov 2014 13:29:57 -0600
Message-ID: <20141105192957.GM6548@saruman>
References: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
 <1414951910-16075-2-git-send-email-robert.jarzmik@free.fr>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fNagykWcDoSVAmSd"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1414951910-16075-2-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--fNagykWcDoSVAmSd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 02, 2014 at 07:11:49PM +0100, Robert Jarzmik wrote:
> In order to prepare device-tree conversion, port gpio_vbus to use
> gpio_desc.
>=20
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>

Can we just convert users of this to a phy-generic.c with a regulator ?

This is basically what gpio-vbus is doing, it's basically a regulator.

We can figure out how to maintain backwards compatibility with older DTS
too, no problem.

cheers

--=20
balbi

--fNagykWcDoSVAmSd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUWnq1AAoJEIaOsuA1yqRE7tAP/jIUEncHCB1BKFAbpzdG46Db
pBvDywL7SimXLgiEbrPR+mmVMqBza/wVR2U8djL+yqP8vFwvVEuuPaBU+Pe6jLCP
+347CuBCc38HoB6+cMU/Y/hFWdQNfPIX2RXKmi58xYEtGsCpSGQxtZbUCiHvqD6S
SgAbioRccrNBXkKv0aAF9a6CXX8g10mjr4fMEkuc/Pi7b7Xt+oTedlNYWUAqyhjK
ihW2lXLrhjsQvh5uVYCEVMqsiQ7fs+ixDmiN6O2Ifx+PzyrmWHHVzUqfP2XCuBY3
4UMfrDIncgFMRaF/yfDf66GLRmxP9q/Ik2unS3iORKz/VWsMJGI3hgDwHu3hC8+Z
PPK227EVMf9eHg5s5Qm+xyNIAoED4cRI7nm+xilMo5pwhRMyUrCPCpT1rVB4YW4G
G1FHkYb4cgDaLsrtyWhKKPnDRZ7cxfiqTRo6i7NnMyASAtoEXBEdapRs34f7Qfkq
tPoMuy+I8esbsGt45M+7kwmcqnBa5fM7MMyBBwRkHrqmbhDOG/rLVnXZs+9HenSe
SjnLEQ+xS/ipE9W4nye73zpen+csvMXvmOcECS40CkmhccSj/IefwCw4hjsPoGqp
I3Nkty6wZB6KgbShpqA2EYPhlmZdTaUiroHtlgb++0nIddGdFu2zxghYuKsQbouM
vgYtrstaCUooXENKleKE
=SsUu
-----END PGP SIGNATURE-----

--fNagykWcDoSVAmSd--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
