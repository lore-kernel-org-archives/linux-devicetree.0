From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Current state of devicetree and x86
Date: Fri, 28 Sep 2012 22:04:21 +0200
Message-ID: <20120928200421.GA30777@avionic-0098.mockup.avionic-design.de>
References: <CAH9NwWeVMZi3fH43DVZnp2_J1XbH-NDmVXND9TX8SGr35Sy+eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5516559931148280817=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAH9NwWeVMZi3fH43DVZnp2_J1XbH-NDmVXND9TX8SGr35Sy+eQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============5516559931148280817==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2012 at 08:13:05PM +0200, Christian Gmeiner wrote:
> Hi all.
>=20
> I am interested in the current state of dt and x86. In general I have
> device with some
> i2c devices and gpio stuff and a coreboot based BIOS. That means I could =
add the
> dt into the BIOS flash and make use of it. Is there any x86 bootloader th=
at does
> support devicetree? Has somebody some experiences?

I patched syslinux a while back to allow loading and passing a DTB to
the Linux kernel. Patches based on that work went into syslinux 4.06
IIRC. Note that currently onle the linux.c32 executable contains that
functionality but there were plans to make it available in the standard
loader in 5.00 I think.

Alternatively you could customize OpenFirmware for your device. OFW can
be built as a COM32 executable and can be run from syslinux or it can be
used as a BIOS replacement.

Thierry

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQZgLFAAoJEN0jrNd/PrOh4I0P/3AwFwItiq5OS7pOGR/UeIU7
vT39dDw8IElTuUY0UbRHeJP/KcqVxaQSGXaa/0VoLBGX1dwtUr5cjotP397t0XLE
EK108M3EfuV4MnuGlTVro8ygx2Rvc0UCuE9o3CuHBX0iCXqBx9gns80JQEmOfXyL
aocJhkeCGWwzYX5Dha7HgKvgEHjzaU370EUqjHBrFiT4Y2cnbxglhNEl2Ww09KG5
aVrAozW2COzjIT1pKiX2cDfAp+6AOrA60osvXQny7jr7C9Pfeeq85HA2c06joYUW
6XAhRFVfts0LFoYgK9HZhaVguYWydYE3IuBAMEQ1s8qv/x9rIReaAO2arzN0qLo8
5ULZu1ZjKVN/X4WPMoTpUIei7NQ5Qb7jLJMcbHheuh24BgIDi1ARoPFe7CqykskY
kBVmwc5EjwX4JJzTzOkuAB4w1wobZCQh7M86SRFKpEXPZBOXq8/gU42We6ABUuIU
ruVb7U3M431qlbllyU7RN3t/cpdIlQ+bBsf8TEFvFspOd+uysrTNVGC0E9aEe2Gz
IenvOG5uw+xlZ1QYG3wh8IIND1jjm+LbUNhnAvHai3bx6PujhlMlE8kRQmIlKLeG
ZCqdqtgVEi3Cmv4dPbBr4j0+Cr7q/5MCWFj98dtSIfEAga2YlsjoyxEXrjolaZio
WTqMgpD01DyPtMu+Yo9e
=TpVe
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--

--===============5516559931148280817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5516559931148280817==--
