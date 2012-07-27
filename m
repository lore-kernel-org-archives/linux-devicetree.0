From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Fri, 27 Jul 2012 11:08:46 +0100
Message-ID: <20120727100845.GA7777@opensource.wolfsonmicro.com>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
 <1342713281-31114-4-git-send-email-shawn.guo@linaro.org>
 <20120726131121.GB7306@sirena.org.uk>
 <20120727021303.GB3347@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120727021303.GB3347@b20223-02.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@freescale.com>
Cc: Shawn Guo <shawn.guo@linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 27, 2012 at 10:13:04AM +0800, Richard Zhao wrote:
> On Thu, Jul 26, 2012 at 02:11:21PM +0100, Mark Brown wrote:
> > On Thu, Jul 19, 2012 at 11:54:41PM +0800, Shawn Guo wrote:

> > > +Optional properties:
> > > +- transition-latency: Specify the possible maximum transition latency,
> > > +  in unit of nanoseconds.

> > This should make it clear that the transition latency being documented
> > here is just that for the core clock change itself, there may be other
> > sources of latency like the regulator ramp time or reprogramming PLLs.

> I think it's the total time and board dts can over-write it if it
> needs. Different transitions between different operating points may
> differ, and regulator may be able to indicate the transition time but
> clk don't have such api, and probably not worth to have.

That's going to be awfully manual if every board has to tweak values
(though obviously the main effect is just going to be bad decisions
rather than breakage).  I've seen several systems where the clock could
provide useful timing input here - the usual pattern is that you've got
a PLL which you can use as well as some dividers.  Transitions that only
need a divider update are extremely quick but transitions that change
the PLL setup can take much longer.  It seems better to just allow the
board maintainer to plug everything together rather than having to work
out their specific latencies to squeeze the performance out of the
system.

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQEmiiAAoJEBus8iNuMP3d9XwP/3SMhLTDY318w8HuT8pKGM4x
o4MieAHPe2V2UC5b+qUVM3dQclhwkQ5cy/G5vWqPIX7GHWGOLiAj1K0N2N0Kpxtw
efC0dof6rgCNSbMq7UnYZamvyeSSlDLOwk2cLnk9cb14Pjf4c0UQiXoBsDcCcaX+
YyJ+xeZRdeHLXTdOdEPI5LUa5PLr3acayU7PaUkSBtq+yXXYJHi0VLURI2AzzdQQ
+p8FhTxQunxhYdlE2FbNyqtVznGOCd2yGRYxXPkNRFrrUDcQSL9nU9TFalrtD60o
xFonVGFK4SDOVA2igl8+aaj//fh5Kv+SDzUqgKBuOp93lafIZJbok3kCiqxwipGt
xrby1GBgdxDs/C8iVzDtzH7P+X+AWIcb4/Xc4teqtca0mJU4AmGdfH/GRlamgGm9
gGGTo+jhhidPBDVU/C0a/PpFs5jiz3vSXwHaGmB66OH1jVoCuIh69SLF1RXUbmtg
0u6z0xo2S/1Ew47c05vS97TeadhuOCO8Zj80pC4QnqBbG0pRt4FF1AJIIQjHiVgr
gntQtcrx5J8aMbj3VwoZmGACz69XNJ08tHTF99mPZsCq/2NYOhKMbyWEJ7HiDX/J
rvX4Fu5QrD2aGHQZAbZ4ptPALAYk0VVw0BTiE7OwrQrcMGph9NgG6oqY5ryZfU8Y
J9/VLBtScfjR+HnQ0jCw
=UKtf
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
