From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] ARM: Dove: Add the audio devices in DT
Date: Thu, 29 Aug 2013 17:12:17 +0100
Message-ID: <20130829161217.GK10783@sirena.org.uk>
References: <20130828113459.48ecbb34@armhf>
 <521DCD33.2070008@gmail.com>
 <20130828121943.1c8327ca@skate>
 <521DD057.4040208@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GmIAiBEz2jSsbeLA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <521DD057.4040208@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, Jean-Francois Moine <moinejf@free.fr>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org


--GmIAiBEz2jSsbeLA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 28, 2013 at 12:26:31PM +0200, Sebastian Hesselbarth wrote:

> Unfortunately, mvebu-audio has already been taken by Mark. Also, we
> know the differences for the three SoCs now and should have a compatible
> for each (and maybe mvebu-audio for fallback).

We're not at the merge window yet so we can always change it.  We can
also add additional compatible strings to the drivers at any point - the
device can list as many as it likes, this is useful if you've got new
controllers which are supersets of old ones for example.

> Also, we'll need to distinguish between the different audio controllers
> on a single SoC, i.e. i2s0 and i2s1. I suggest checking the (phys) reg
> base passed.

Why is this required - ideally this would have been mentioned in some of
the previous reviews...

--GmIAiBEz2jSsbeLA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSH3LdAAoJELSic+t+oim9OPEQAJlMM5h1dhk4zB9HhyANZSqw
1OTJC4MbJeioLX7k+mLo9HPFOO8sMP1ya8WGtVyHeMjVjv4IYl8sanadWpa86psr
c3jKZ2M9onsp7il75Z/0fNklK+/iZP9XbsmPwatVinEDYCxJ0/9dbFtZuJjq2Tuu
ejnNOq/b5XYqIkfzyvPQQjMW0Avj3TycrpmAi68YnsEXbWhg4uhawYaSqUK5RFU+
Rz9H41Is3daIOha66VoLIvOf4e2mK7Zn189snygWa6jWYmHglhAIWBKQZeOXXoeW
L2OzeF6lFuVYEoQvuzVVOS4bApz669U8aMJ+r1sEFxzZBsUOSQANaBK1srv609Jq
jnonxkgj7MucJ2RM860L1QmytOqemSsqIlR/ksr19GuOveIPcL5rWcsK9S540kYh
fXDIVfkjOUbVeAtUPHqzmuoJoyn3OjB7G/CHtVfndoMmSMLTb3vbaL3IeC6MzNp9
Xa/M2XGENgTAALOs5pa8877zwHqXbP0DQyP5yDwVgW6A5tGDHkvxUBkxJXvJoE2W
KkYZWW+vBUsCVgKIp2h2EdUBAXERrNACau9gkHzx1bGcI1+KcADr3r9HemdIPi6z
kekD5sS8yDQ5NHq++jb1r/tXx8X6I11g0mfUnudww/wDj2QLQsImkz+yV8ZcWmup
PsY5NBzWsK7ccvE46X0C
=YMzN
-----END PGP SIGNATURE-----

--GmIAiBEz2jSsbeLA--
