From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 06/13] ASoC: ux500_pcm: Extend ux500 MSP binding for
 enumeration
Date: Wed, 6 Nov 2013 12:04:26 +0000
Message-ID: <20131106120426.GL11602@sirena.org.uk>
References: <1383732985-18928-1-git-send-email-lee.jones@linaro.org>
 <1383732985-18928-7-git-send-email-lee.jones@linaro.org>
 <20131106104658.GE11602@sirena.org.uk>
 <CACRpkdZgi9Egvm585Y9tJpmj0YX-oJBDg-C7pCu91Pf5ALMGLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3010599234339988056=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZgi9Egvm585Y9tJpmj0YX-oJBDg-C7pCu91Pf5ALMGLg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============3010599234339988056==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LR9UEBmNK407lwl9"
Content-Disposition: inline


--LR9UEBmNK407lwl9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 06, 2013 at 12:55:51PM +0100, Linus Walleij wrote:
> On Wed, Nov 6, 2013 at 11:46 AM, Mark Brown <broonie@kernel.org> wrote:
> > On Wed, Nov 06, 2013 at 10:16:18AM +0000, Lee Jones wrote:

> >> + - id               : MSP ID - used during component registration

> > I have no idea what this means or how one would pick the number?  It
> > looks like something purely internal to the driver...

> Actually it's quite common when we have several HW blocks of the
> same thing to add something like an id. For example for different
> GPIO banks.

That's common but having the number be in the device tree as a property
or referenced by anything like this isn't common - usually it's just in
the node name if it appears in the DT at all.

--LR9UEBmNK407lwl9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSejBHAAoJELSic+t+oim9/lgP/11VPD8NAqxhGjBnwYC5XFuq
c6JaViDCaAumQnRm5LR+vCBBgI3/TmhHlbvlc8MwrE3+4/rQ+zVu+6LYcRhBpJ3o
LrJLti52Z+O3iFS1sQvNEnyNyyubMB+v5IybHbtlA0T+PYER90Rji1qZFPFUwWF+
acZjWmDTv0UJDK8B4eg0fLGN+cg5UQiLU1QrC6FsyAxwSPj8gud589URfXxU4Qmy
u9vfQV46876TRj5qorLO8NKZp7ZQXkJGBChdFDl7uRxR4QlOlblIf04aaQETGrXw
fXUiubmPz2oRkDjo3QTqvIJa3V4+S5GDnWWhYDoK/OL0mVS2+AonffuSv9U6zQaO
Sngu6Kj8MZ42+QcVyZwfQ+XGf1llHpnLeMngQnzY9ATzcxMeWaKMg/RZHXIdgDa0
WQ6AAMPLN35m8JQUTAgTmxOjeVsFIsvHeMxK89z7CJnysRJAhKvXekARQcI4AzAW
tGOV+JvQYHw0rm+DAinBSckOJF2I5wliy8lCryochoS088U/BIZPGDkgaDJXjysl
9v1m9yHPk2O9aC6vVgux3yh0udPVRzM9gLJiagaqrcJekZHLf9gKLL62whBjQbRC
HF+OmfzgzTsQWHv5GowgjtE3H5BfhIg1ETPRqvc3l7QXBfWo+ogBdqoIK/1yNXwW
xqqbAxd/X7C+yYV5zAqt
=zkIA
-----END PGP SIGNATURE-----

--LR9UEBmNK407lwl9--


--===============3010599234339988056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3010599234339988056==--
