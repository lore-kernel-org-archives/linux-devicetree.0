From: Mark Brown <broonie@kernel.org>
Subject: Re: [Dev] [PATCH 0/5] RFC: Mezzanine handling for 96boards
Date: Tue, 19 Jun 2018 12:56:08 +0100
Message-ID: <20180619115608.GA11230@sirena.org.uk>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <20180619111018.r3m35g4ei6625pqz@holly.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7244222950074648983=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180619111018.r3m35g4ei6625pqz@holly.lan>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, dev@lists.96boards.org, Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andy@infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============7244222950074648983==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 19, 2018 at 12:10:18PM +0100, Daniel Thompson wrote:
> On Mon, Jun 18, 2018 at 09:45:51AM +0200, Linus Walleij wrote:

> > - I am especially curious about input from Andy and Mika from
> >   the Intel/ACPI camp on what they have seen for non-discoverable
> >   plug-in boards. Does this problem even exist in the Intel
> >   world, or not...

> I'm also interested in the "what about ACPI" question?

> Using C makes describing a board in ACPI fairly easy. AFAICT allocating
> IDs to a board rather than its included components is fairly natural for
> ACPI.

Yes, they have this problem - they have plug in modules on for example
the minnowboard and some of their other reference platforms.  They have
overlays working for ACPI, these have their own problems in that they
don't appear to have the equivalent of DMI data (at least the patches
people are sending indicates that they don't) which is unfortuate as the
idiomatic thing for ACPI is as you say to key huge chunks of data of
quirk tables based on the DMI information for their boards.

They don't to my knowledge have generic connectors or anything like
that, it's just patches to the base ACPI.

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlso71cACgkQJNaLcl1U
h9AeMgf/adnXyEP00ks41ZOxubqHBbsGpu9JbJucDt9mSdbwh/ogURGasPDVwb90
bBKxy/zEvLDtVd0QjaVa/v5qV95iJQmb2Dj3dgNCmMAo2QPyrMxyLu1j4IPmED7f
dnqjwogqOlZO9BA8VimTLKyAddAnzWsjKvPmvqLy9Yz4wJg04iIL2lnmr4GXVcz5
7OXLy16dUJizDMtKEucjqs9IAesDaiA4VEWibjq1aw9B7Ah7yCx+5XZGfwJjruhL
GaLmrY/cEZGhmxGIitNCkDqdDP5wuaPVHltZocXHHWmTP8bJxWlMB2Ha/mTXkCfg
r8t+t5a4p/FIT7Xb/g3O03WVkPCV+g==
=Fcpz
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--


--===============7244222950074648983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7244222950074648983==--
