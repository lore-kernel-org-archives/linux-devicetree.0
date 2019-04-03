From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: sunxi-nand: Add YAML schemas
Date: Wed, 3 Apr 2019 10:49:38 +0200
Message-ID: <20190403084938.nk5po4w7ljy5bniw@flea>
References: <74b8a52ce98b09d7906f988c107793a86c0c5f6b.1554216856.git-series.maxime.ripard@bootlin.com>
 <079279c3713042bdcc76ea27907d5f75bcb483fc.1554216856.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqLrdFAhdbjVi0ZoCOM6ajEOdQeLpkSKBsZ90X+UvfkLmA@mail.gmail.com>
 <20190403074418.by3cmvtmdcbovyw5@flea>
 <CAL_Jsq+bivuKJ107tiQDb9EN2S+AyK89+CzfcofioXcqGLLqjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7225824869344414350=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_Jsq+bivuKJ107tiQDb9EN2S+AyK89+CzfcofioXcqGLLqjA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>, MTD Maling List <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============7225824869344414350==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a76thyva57lxv6lt"
Content-Disposition: inline


--a76thyva57lxv6lt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 03, 2019 at 03:33:42AM -0500, Rob Herring wrote:
> > The other one that might be more problematic is that it also tries to
> > validate nodes that are not enabled. For in-SoC components that don't
> > rely on anything external, it's fine, however, for components that
> > would require something that is connected on the board (like a
> > regulator, a phy, a GPIO, whatever), then we can't have all the
> > required resources in the DTSI, and boards that don't use that
> > component (and keep it disabled) will emit warning that this
> > particular property is missing.
> >
> > I've tried to look into it but couldn't find an easy fix for that in
> > the tooling, so I've opened a github issue for this. Let me know if
> > it's not appropriate.
>
> Yeah, I need to go look at that. Skipping disabled nodes shouldn't be
> too hard to do within the tool. This came up before I think and I've
> resisted because I don't want to skip validating at least what is
> there. Maybe the better solution would be to drop 'required' from
> schema when validating disabled nodes. (At least, I think just
> 'required' is the problem?)

I thought about something along those lines too, since indeed the only
thing that causes troube is required.

> The complication would be we'd need 2 sets of schemas and select the
> right one for each node.

You mean two instances of the schema in the tool, right? Not two
schema files? Do you expect any drawback to that (like
performance-wise maybe, if we have more schemas with more complicated
select patterns)?

> Another way to implement it would be just to filter out the warning
> messages.

That would work too I guess :)

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--a76thyva57lxv6lt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKRzogAKCRDj7w1vZxhR
xac1AP0QLbbbxWvLkIPGe2zrWPi6nKLa/QhvRdMWM3ZbsDeZAgEA2a953gpc7deu
ZRklMgGMaC2SedAc09yfEV12U/V2OAU=
=qt3G
-----END PGP SIGNATURE-----

--a76thyva57lxv6lt--


--===============7225824869344414350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7225824869344414350==--
