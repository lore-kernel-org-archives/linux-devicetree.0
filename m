From: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Fri, 20 Mar 2015 19:43:07 +1100
Message-ID: <20150320194307.51cb4225@notabene.brown>
References: <20150318055437.21025.13990.stgit@notabene.brown>
	<80D7E742-4633-4CCD-B754-221387D82922@goldelico.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/ejbYyRP428pXQqNAX9EpGS7"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <80D7E742-4633-4CCD-B754-221387D82922-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, List for communicating with real GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Sig_/ejbYyRP428pXQqNAX9EpGS7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Mar 2015 08:54:35 +0100 "Dr. H. Nikolaus Schaller"
<hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org> wrote:

> Hi Neil,
>=20
> Am 18.03.2015 um 06:58 schrieb NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>:
>=20
> > Hi again,
> > here is version 3 of support for tty-slaves.
> >=20
> > This version introduces a new bus-type for tty-slaves,
>=20
> Hm. I am still not convinced that a tty is a =E2=80=9Ebus=E2=80=9C and=20
> that this is a solution for a wide-spread problem.

Don't read too much into the word "bus".  It is really just a mechanism for
grouping drivers together - with maybe a hint of a suggestions that it helps
communicate with the devices which the drivers drive.

And I'm not particularly interested in solving wide-spread problems, just in
solving my problem in a suitably idiomatic way.


>=20
> > and causes
> > a tty-slave device to appear in /sys/devices between the uart and the
> > tty.
> > It effectively intercepts and calls from the tty to the uart (i.e. any
> > tty_operations) and applies extra functionality at that point.
>=20
> >=20
> > Currently the only driver intercepts open and close.
> > It powers on the device on open, and powers off at last-close.
>=20
> That is what the missing piece in Linux is to make the w2sg0004
> chip work.
>=20
> >=20
> > Power can be controlled by a regulator or by toggling a GPIO.
>=20
> I think such a GPIO logic has nothing to do with serial and
> should be left over to the regulator logic, i.e. we need a special
> regulator-w2sg0004 driver.
>=20
> So I suggest to remove the GPIO logic from your=20
>=20
> drivers/tty/slave/serial-power-manager.c
>=20
> And then you can even get rid of adding a chip specific =E2=80=9Ecompatib=
le=E2=80=9C
> entry for the subnodes.

But (nearly) every node has a "compatible" entry.
Each node describes a device, and the "compatible" string tells us what sort
of device.
Surely you agree that there is a particular device that needs to be
controlled?  In that case there needs to be a node representing it and a
"compatible" string describing it.  That is how "devicetree" works.


>=20
> >=20
> > I think I've incorporated most of the feed back I received from
> > previous versions, but if I missed something - I apologize.  If
> > this approach is structurally acceptable then I can fix up all the
> > smaller issues.
>=20
> As said I would prefer that the w2sg0004 driver is just a separate
> =E2=80=9Eregulator=E2=80=9C driver as we had proposed before.

You can prefer that if you wish.  But given that the w2sg0004 is not in fact
a regulator, but is in fact a GPS device, I doubt you will find a lot of
support for your approach (as indeed I didn't when I tried it...)

Thanks,
NeilBrown


--Sig_/ejbYyRP428pXQqNAX9EpGS7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVQvdnDnsnt1WYoG5AQI5Lw/7B2iFoKqne1pfk1SA8GnWZp44UTEVuWkO
FskFWRMWwtJlScH0KsPbUgbiwt9+yAJW7F8RYM2IpAjVZbEInEVIpYC9s9OCL8p4
Kj8l00cIvfVE+ffCMt5HzqiZ64SloS+82K7fYfb5ruMmQSi5p8V1G9rwpdSOU/gN
ORn1iF5VygFH2VqEdr7rY0jJb9RPWOYomMGTH82zezxOY89aRrsqFyBoC6xLyjL1
rAJQySv+7pvd/LCetyz7Pt5b/ZaVCpf6JLkDN2J9UMv+WmD5XN0h2V2HLY1YCTJ1
dGgLj64/52YFLD4s+7G0+xNm++OBQe24UfoYZaN7RC8mRCMmIfurd4FySNmlrGEP
Xa6B8mEKeh2dx0F66j9SumJkJHWbavgR7JbB7SvK2B98mIqfEmpmYPwjsS9pVEUg
eQt6t6xhXZGEVKzVfXHqfnUue6UTiesa8Q0nhOuuf7RgOsZeMwsCP/V0OuDPXMwR
edn8sqCrMqGErGIUlttFppoZzn0Lutg189aZujAWEdf29vybqJlMWBS7MN0z+pmB
MS4lzMeM9kP+1Da8UEcvjAQfXG9U6pJ4SCVjlmFLLJxdSgjhpigp8ZAqgi+LEV7J
W1ZgS44QRHZ2sHM8N5s8/2pZeqjB7u1fi8LOuPD9grtRcOlg+RXr/Z1NyoPt5ycf
9s2x5vEyxT4=
=dhVj
-----END PGP SIGNATURE-----

--Sig_/ejbYyRP428pXQqNAX9EpGS7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
