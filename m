From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: Re: [Patch v2 1/2] 5200/mpc: improve i2c bus error recovery
Date: Thu, 06 May 2010 19:54:31 +0200
Message-ID: <1273168472.1767.1@antares>
References: <20100505220916.GD3529@ovro.caltech.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5480857228557753608=="
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20100505220916.GD3529@ovro.caltech.edu> (from
	iws@ovro.caltech.edu on Thu May  6 00:09:16 2010)
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: "Ira W. Snyder" <iws@ovro.caltech.edu>, Grant Likely <grant.likely@secretlab.ca>
Cc: Linux PPC Development <linuxppc-dev@ozlabs.org>, Devicetree Discussions <devicetree-discuss@lists.ozlabs.org>, "Ben Dooks (embedded platforms)" <ben-linux@fluff.org>
List-Id: devicetree@vger.kernel.org

--===============5480857228557753608==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=PGP-SHA1; boundary="=-GESm4MLGNwyJwiypmWfs"

--=-GESm4MLGNwyJwiypmWfs
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 06.05.10 00:09 schrieb(en) Ira W. Snyder:
> Did this series get forgotten about? I don't see it in bjdook's next-i2c =
branch or in benh's next branch.

It's not in Grant's 5xxx tree either - as it's specific for those processor=
s, I think he might be the responsible person.  The patch is still in a "ne=
w" state in patchwork, btw.

> I've pulled these into my 2.6.31.13 kernel, and they seem to work fine. Y=
ou've got my Tested-by if you didn't get one from me already.

Tanks a lot!

I think, though, the whole stuff has been discussed in depth in February, s=
o I do not understand why it's still pending as "new".  Grant, did we miss =
something here?

Thanks, Albrecht.

--=-GESm4MLGNwyJwiypmWfs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iD8DBQBL4wJXn/9unNAn/9ERAnIKAKCtGrks2uRqLy0dIrGrUdSvLi/MvQCgy3zK
QTMSuK41i8DzgaFSXhZrZUY=
=khvH
-----END PGP SIGNATURE-----

--=-GESm4MLGNwyJwiypmWfs--

--===============5480857228557753608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/linuxppc-dev
--===============5480857228557753608==--
