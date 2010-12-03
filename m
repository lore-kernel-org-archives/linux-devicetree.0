From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: UIO / of_genirq driver
Date: Fri, 3 Dec 2010 16:50:31 +0100
Message-ID: <20101203155031.GC5636@pengutronix.de>
References: <1d3f23371001272313i62fc9158se4cd9173f196fb12@mail.gmail.com>
	<20100128104545.GA3105@pengutronix.de>
	<201012031643.31428.sr@denx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8779531679019186730=="
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <201012031643.31428.sr@denx.de>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Stefan Roese <sr@denx.de>
Cc: hjk@linutronix.de, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, gregkh@suse.de, Linux Kernel list <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, John Williams <john.williams@petalogix.com>
List-Id: devicetree@vger.kernel.org


--===============8779531679019186730==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Is there any update on this in the meantime? Do you know of any plans to =
re-
> work/-push this patchset? Just checking...

I had another look recently; I wouldn't like to just copy/paste the
"new_id"-mechanism from PCI because the code would then exist three
times in the kernel (PCMCIA being the third user I am aware of). I
wondered if it was feasible to make the "new-id"-code generic and make
those subsystems just use it. I haven't started working on it, though.

Kind regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkz5EccACgkQD27XaX1/VRuMWQCdF8iOdjY8DK3GeACA1YbVY/qX
oVkAniWPpN9kz0GSvHQJuDUZ18Jf0OgD
=8Ygy
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--

--===============8779531679019186730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/linuxppc-dev
--===============8779531679019186730==--
