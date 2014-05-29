From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] watchdog: Add Cadence WDT driver
Date: Thu, 29 May 2014 11:43:05 +0200
Message-ID: <53870129.5010505@monstr.eu>
References: <1401185895-3677-1-git-send-email-harinik@xilinx.com> <20140529092106.GC24233@leverpostej>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="lMOK2oNEsjMuSaeX4mDQc4TLT8TPkNpNn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140529092106.GC24233@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Harini Katakam <harinik-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org" <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lMOK2oNEsjMuSaeX4mDQc4TLT8TPkNpNn
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Mark,

>> +static struct of_device_id cdns_wdt_of_match[] =3D {
>> +       { .compatible =3D "xlnx,zynq-wdt-r1p2", },
>> +       { .compatible =3D "cdns,wdt-r1p2", },
>=20
> If these can currently be handled identically, why not just have
> "cdns,wdt-r1p2" in the driver and in your dts have:
>=20
> compatible =3D "xlnx,zynq-wdt-r1p2", "cdns,wdt-r1p2";
>=20
> If we need to distinguish the two for some reason later we can always
> add the "xlnx,zynq-wdt-r1p2" string to the driver.

I would prefer to have 2 compatible strings just because
of that we don't know what is different compare to origin cadence
version. We have done the same for spi-cadence.c that's why
it shouldn't be any problem to keep it as is.
Having zynq compatible property here and using it give us option
that if another SoC vendor come with new configuration or clean
cadence one we can simple handle it without changing compatible
property for us.

thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--lMOK2oNEsjMuSaeX4mDQc4TLT8TPkNpNn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlOHASkACgkQykllyylKDCG8gwCeL6kJMQbQxry99bkhop6MTcJk
KbUAn0/EQdJPou+FGxg28m65l3X4Jipb
=riNy
-----END PGP SIGNATURE-----

--lMOK2oNEsjMuSaeX4mDQc4TLT8TPkNpNn--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
