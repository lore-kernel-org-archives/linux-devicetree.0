From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V8 1/2] regulator: Add document for MT6323 regulator
Date: Mon, 11 Jul 2016 22:07:54 +0100
Message-ID: <20160711210754.GA9976@sirena.org.uk>
References: <1468240179-7558-1-git-send-email-john@phrozen.org>
 <20160711180805.GG3701@sirena.org.uk>
 <cef78bd8-9a4a-e848-d7cb-13a27127f11e@phrozen.org>
 <20160711192211.GI3701@sirena.org.uk>
 <c1acbf13-93a0-4257-ee48-4885a87fede5@phrozen.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c1acbf13-93a0-4257-ee48-4885a87fede5@phrozen.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <john@phrozen.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 11, 2016 at 10:31:45PM +0200, John Crispin wrote:

> maybe i am missing something here, but i can see the dependencies inside
> the for-next branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git. is
> this not the tree i should base patches on for v4.8 ?

Oh, so these aren't things that Lee just applied but rather things that
have propagated through?  You didn't say what commits you were talking
about, you linked to a long gitweb URL that would have been difficult to
paste due to wrapping.  This sort of thing is why it's really helpful to
make your e-mails directly human readable, saying something like "these
depend on change X which is in Linus' tree now" would've made this
clear.

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXhAqoAAoJECTWi3JdVIfQTLoH/jr0xdIPvmi8cunTocybOSrB
5HkLOuAGuIrxyuU20n/1gXVohQHT47HhGteqi8Vw4HSDkwBhVvz8uruJ2EnPDxcC
SCLwsuYVD82hI/cBU4z2lNzctFf7BsaHZ6lOGNTItUw/DuA84R0b3QkCD9IqyS9a
Ym15a3jm+Xfa+vsXTSULWWLI7VPswmSuh49w86RHr9G4Pbmosoa42LBvWLl1ph8V
bqe4Kb75rYoIjdQV1il2k+cNFXnUk2kqGwW3xBF63Bz56wB6sCf9Su9FN5oTpIm0
yn16u1rr8GRdpM5Ov9AdXjwveEWVFUhatfogkNOycnPyACXdmY74yPem7Ht0WnY=
=ckCh
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
