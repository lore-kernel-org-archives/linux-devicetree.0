From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: add QCOM RPMh regulator driver
Date: Wed, 28 Mar 2018 10:28:08 +0800
Message-ID: <20180328022808.GL29239@sirena.org.uk>
References: <cover.1521246069.git.collinsd@codeaurora.org>
 <71fab82672524b95632cdb588c16edfc9711866a.1521246069.git.collinsd@codeaurora.org>
 <CAD=FV=Xz01ra=WS--vtA+dkb1H8wcw3UnFzXPS=zYWAQCPP5eg@mail.gmail.com>
 <184378e4-caf8-6ce3-e089-3690588fcb28@codeaurora.org>
 <CAD=FV=WsVDDaV-mMUvQWUomyBFCJZunKiyDt_K81_syoNhGRZQ@mail.gmail.com>
 <20180327115606.GC29239@sirena.org.uk>
 <CAD=FV=XELzjc6h06MhwW-8XCOvH4vhMk1zzK_aD+94RdbCzUtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sT9gWZPUZYhvPS56"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=XELzjc6h06MhwW-8XCOvH4vhMk1zzK_aD+94RdbCzUtw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, sboyd@kernel.org, ilina@codeaurora.org
List-Id: devicetree@vger.kernel.org


--sT9gWZPUZYhvPS56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 27, 2018 at 01:51:56PM -0700, Doug Anderson wrote:

> Assuming I didn't mess up my analysis, the entire job of of_map_mode()
> is to convert from one integer to another.  It should take the number
> that was specified in the device tree and convert it to a
> REGULATOR_MODE_XXX.  That means that the regulator framework is
> enforcing a distinct and per-regulator numbering system for the mode
> (I called this "device tree mode").

OK, the confusion comes from your terminology invention rather than the
driver then :(

> So basically it sounds like everyone makes up some arbitrary numbering
> system that is only used in their device tree files and needs to be
> mapped into the standard numbering system...

It's not just that.  The very modes themselves are not defined at all
consistently between regulators - the set of options varies wildly as
does the range of applications they are suitable for.  We want people to
not only define numbers here but also names that make sense in the
context of the regulator documentation that can then be mapped into the
concept of modes we've inherited in the regulator subsystem.

--sT9gWZPUZYhvPS56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlq6/bcACgkQJNaLcl1U
h9CWvgf9F5NH0G4d8M5xivSJZyK25J9g0jvimxPEjnFU1G8G8U0kxG+yckZ5M+Mx
eFXKkWyHaSwqQXtwrVhBVIkkY7G4Zrp6mf+E9VHf/K2qrzYS52YE2RfWXhsgmMQ3
VWZF2nr+jCNylhzPcAi2IoWQmFvRL8xvrZS/mJpYukQS3D4J82hIzlOrkM8ixVMQ
W2D6mvhBy1FMlvWpBdWvgBSRYXh1JaREBSyF9UkgnrVZS8SYmZyHJzxs3v9LgWLD
RQQy/0lPkmNbLu97ct6KHzNy4lNauGrzlgRMA7LLyK6JeSBtjTHrmuBjS7UbJ3SJ
jmH4ansyHRyzb0xxyeAOhQreQHqgrw==
=VxCl
-----END PGP SIGNATURE-----

--sT9gWZPUZYhvPS56--
