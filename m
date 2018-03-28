From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: add QCOM RPMh regulator driver
Date: Wed, 28 Mar 2018 10:08:45 +0800
Message-ID: <20180328020845.GB29099@sirena.org.uk>
References: <cover.1521246069.git.collinsd@codeaurora.org>
 <71fab82672524b95632cdb588c16edfc9711866a.1521246069.git.collinsd@codeaurora.org>
 <CAD=FV=Xz01ra=WS--vtA+dkb1H8wcw3UnFzXPS=zYWAQCPP5eg@mail.gmail.com>
 <184378e4-caf8-6ce3-e089-3690588fcb28@codeaurora.org>
 <CAD=FV=WsVDDaV-mMUvQWUomyBFCJZunKiyDt_K81_syoNhGRZQ@mail.gmail.com>
 <20180327115606.GC29239@sirena.org.uk>
 <172d1da4-bde0-1f0c-b907-5582c31c8156@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <172d1da4-bde0-1f0c-b907-5582c31c8156@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, sboyd@kernel.org, ilina@codeaurora.org
List-Id: devicetree@vger.kernel.org


--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 27, 2018 at 04:38:07PM -0700, David Collins wrote:
> On 03/27/2018 04:56 AM, Mark Brown wrote:

> > I didn't spot this in the code but something called "device tree mode"
> > sounds like it's going to be awfully confusing...

> As I explained in the earlier email, it makes the device tree
> configurations much simpler and less confusing/error prone.  I'd like to
> keep this concept around unless their are strong objections.

Like I say I didn't spot this in the code, I did give it a brief once
over but as Doug had spotted such extensive problems I was expecting a
resend.  It *is* setting off big alarm bells though, in general if your
individual driver is doing something weird to make life easier that's a
sign that it's doing things at the wrong level.

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlq6+SwACgkQJNaLcl1U
h9C+SAf/Xk5fE40iWdnaUAqxbdfK4umBb0ItVeFUEAEC5DU7mZmPPr9R+Ziqog80
V7Kjb7qmjamPSeATF/ShzlEusjGwihXp1V8/M3Tov5Tc9pTAgFWU/2FrasWGAmXs
upINCPMZDk7qmBfqb46sFYZd5FL8HSjr0cI4m7xWZKBQMIjRkWrt7S32USdKikiI
6m8fXobyddNS4D9d0OfySaE7/IeOE6KqkcNvWARGrPUdnB5SjbxK5hSLIIauXE2D
kNwPWhvGCwLABbmn97g58d2il3JtKCqS9Casek28B568yp+VWYkWRzrhdlQVjv3y
z1S5aAniKXr6/AZdi2ti3eBV+V5Qpg==
=rd+x
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
