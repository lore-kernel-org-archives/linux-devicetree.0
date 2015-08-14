From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 3/6] slimbus: Add messaging APIs to slimbus framework
Date: Fri, 14 Aug 2015 19:33:53 +0100
Message-ID: <20150814183353.GA30451@sirena.org.uk>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
 <1438585190-11894-4-git-send-email-sdharia@codeaurora.org>
 <20150814182525.GD10748@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150814182525.GD10748@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2015 at 07:25:25PM +0100, Mark Brown wrote:
> On Mon, Aug 03, 2015 at 12:59:47AM -0600, Sagar Dharia wrote:

> > +	sema_init(&ctrl->tx_sem, (ctrl->tx.n - 1));

> This sempahore counts the number of free slots in the statically
> allocated list of transfers we have allocated.  It would be good to see
> some discussion in the changelog as to why we've got this statically
> allocated pool rather than just dynamically allocating them as needed -
> I can see a performance argument there but it'd be good to have the
> thinking documented.

One other related thing here: we're keeping the buffers permanently
coherently mapped rather than only mapping them to the device as needed.
Is this the best approach?  On the one hand it increases the cost to the
CPU when setting things up and reading data back, on the other hand it
avoids mapping operations.

Since it's becoming part of the driver API with this it bears some
thought, it will be a little annoying (and fiddly) to change later.

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVzjSRAAoJECTWi3JdVIfQG0UIAIJFPwQyYVewezmN5/b19GB7
P8ZvBguplinAf9SaNKvq6zrmfmgnGrpQVYllA+F2tiKsASpiW8e3mQ1+pw3Q+7GN
7Nac+TQ+dTVp1mUjeEg/jJ108YwXQ326LQBvbW+9kav0kDExZZPQpg7Fi9GhCnif
t+BK4GIG2lBVtuEP3gYCf1QwJzdKnE3kgLF4kQ1Z2xIeTh0Vs81V66DyWjGx6D8Q
LQvjxRFnKvnrwpWMqkg3icq0MAiQh7KjuyUDESmdZQSTe9lGABh/FI61uvj5xuKc
4W288vpTq0LuBBXkGQrgMGcI5DP4nce6FuFVFqS88xM/yw9AlQ01sYXcA5jlrIA=
=+aSu
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
