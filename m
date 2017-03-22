From: Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Wed, 22 Mar 2017 14:10:29 -0400
Message-ID: <1490206229.21130.10.camel@ndufresne.ca>
References: <aef6c412-5464-726b-42f6-a24b7323aa9c@mentor.com>
         <20170319103801.GQ21222@n2100.armlinux.org.uk>
         <9b3311a8-34a7-2b5b-9bc7-836371e1e0a4@gmail.com>
         <179aca0a-deb5-7937-f955-26cc6d93afba@xs4all.nl>
         <20170320132930.GJ21222@n2100.armlinux.org.uk>
         <d0e2a9c2-5e94-d810-7ef4-ae089a6b25f5@xs4all.nl>
         <20170320141158.GK21222@n2100.armlinux.org.uk>
         <40e08d05-58cd-a295-3174-123147ee2ac5@xs4all.nl>
         <20170321104212.GC3784@bigcity.dyn.berto.se>
         <7fe51907-311d-e1cd-3e4c-dd3dc4af7d78@xs4all.nl>
         <20170321113629.GW21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-KdCPDvEHKmVtgP+E71wA"
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170321113629.GW21222@n2100.armlinux.org.uk>
Sender: linux-media-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Steve Longerbeam <slongerbeam@gmail.com>, Steve Longerbeam <steve_longerbeam@mentor.com>, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, mchehab@kernel.org, nick@shmanahar.org, markus.heiser@darmarIT.de, p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com, bparrot@ti.com, geert@linux-m68k.org, arnd@arndb.de, sudipm.mukherjee@gmail.com, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, jean-christophe.trotin@st.com, horms+renesas@verge.net.au, robert.jarzmik@free.fr, songjun.wu@microchip.com, andrew-ct.chen@mediatek.com, gregkh@linuxfoundation.org, shuah@kernel.org, sakari.ailus@linux.intel.com, pavel@ucw.cz, devicetree
List-Id: devicetree@vger.kernel.org


--=-KdCPDvEHKmVtgP+E71wA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 21 mars 2017 =C3=A0 11:36 +0000, Russell King - ARM Linux a =C3=A9=
crit=C2=A0:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 warn: v4l2-test-formats.cpp(1187): S_PARM is
> supported for buftype 2, but not ENUM_FRAMEINTERVALS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 warn: v4l2-test-formats.cpp(1194): S_PARM is
> supported but doesn't report V4L2_CAP_TIMEPERFRAME

For encoders, the framerate value is used as numerical value to
implement bitrate control. So in most cases any interval is accepted.
Though, it would be cleaner to just implement the enumeration. It's
quite simple when you support everything.

Nicolas
--=-KdCPDvEHKmVtgP+E71wA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAljSvhUACgkQcVMCLawGqBzgaACfTk1lVWBoO/6edBKgnB58rTdw
Le8AoMZYILZhMmGN7rgvAiNqf+SFjvBx
=vNgW
-----END PGP SIGNATURE-----

--=-KdCPDvEHKmVtgP+E71wA--
