From: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2] itg3200: add dt support.
Date: Tue, 19 Nov 2013 16:48:39 +1100
Message-ID: <20131119164839.7cd3f4f1@notabene.brown>
References: <20131119113013.39dae3cd@notabene.brown>
	<20131119014938.GA20782@earth.universe>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_//XwP1PsStxcHcGrjfeISlYD"; protocol="application/pgp-signature"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131119014938.GA20782-SfvFxonMDyemK9LvCR3Hrw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Manuel Stahl <manuel.stahl-GeUHRtUQU7nSyEMIgutvibNAH6kLmebB@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_//XwP1PsStxcHcGrjfeISlYD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Nov 2013 02:49:38 +0100 Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:

> Hi,
>=20
> On Tue, Nov 19, 2013 at 11:30:13AM +1100, NeilBrown wrote:
> > No new configuration, just a 'compatible' string and
> > documentation.
>=20
> itg3200 looks like a candidate for the list of trivial i2c
> devices [0] to me.
>=20
> [0] Documentation/devicetree/bindings/i2c/trivial-devices.txt
>=20
> -- Sebastian

Hmmm... a file that isn't referenced anywhere else in the kernel
documentation so is unlikely to be found except by people who know it is
there....

I can see that having lots of files for trivial devices is rather clumsy, b=
ut
there must be a better way.
I don't suppose we could just put the documentation in the device-driver fi=
le
in some format similar to kernel-doc and just extract it if it is wanted
separately?  I think people read code a lot more than they read
documentation. I know I do.

But I can re-send with an update to trivial-devices.txt is that is what is
wanted.

Thanks,
NeilBrown

--Sig_//XwP1PsStxcHcGrjfeISlYD
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIVAwUBUor7tznsnt1WYoG5AQJVxhAAtjwgPu/xThBn/uG19TfyH9EPA3r0LUSr
1YXQTcK5iI7soYxSXAbYLZDyGVk/JEd7a6+78/zADRG1YH5WiZHSLo9ns9sJ6lNF
/VGz6SxrSVctrps4sowsIeZCHLuW8hPGQpTRCrQMO/pclZnoERwlYOIMXNO8bAD2
UrGACHZcUiMZDWztwAmgsapAmKRFjW4+RS+XSthiLbDVgErSjJoI6mtJcwz1pj3E
flKEaQhGtD8t8awtjZHYbAQbBlBgwLn9LyfsRcBmoiX7AQ6Rn1DuOIOzojye+PGO
PYng8ks08Dq5R6h3TuM0vEOZphf5uK26lLbjkSnygMFWYxCuVzvnFqW06Tjq41ch
A8GbQZPA6iGo9oaFNCX/Z5AOTEo7xXPydvzfMAoM3YBKHAtqujpFOBq7NA13rPVF
gSwNRPgudabj7Ffbr+pUilLonYjwI+KGfvsIlCwUlr15oqMVexwdkxAWRAjLnI5/
hCeiV/dEBXzSweaERYehEkFwUQUY21EA4TZwPmSmhkGL7pqfT3UNulkNEzNJIEH+
VO8L4qbrT0j+nPYWiFAZ68MdcTalcRe2N3Sj2xeeDrQqdmSlXj+p6D4miXAp0zTq
jbbJfqpDGRhh1I9q4dNWaqhIEZFq16ZiNAAVvtdL5cWNr+G7CoEPUxlTlB4XToCg
1+Yg30BvvOM=
=Yxmd
-----END PGP SIGNATURE-----

--Sig_//XwP1PsStxcHcGrjfeISlYD--
