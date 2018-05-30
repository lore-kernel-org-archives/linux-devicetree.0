From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 1/2] regulator: dt-bindings: add QCOM RPMh regulator
 bindings
Date: Wed, 30 May 2018 11:37:20 +0100
Message-ID: <20180530103720.GH6920@sirena.org.uk>
References: <cover.1527040878.git.collinsd@codeaurora.org>
 <6d03576cf90f06afb1194301cb41fc31704def1d.1527040878.git.collinsd@codeaurora.org>
 <CAD=FV=VH0bTxPOmRr+jUyV0cGNQHLcwQTV9L-t0bxZOqD8FnHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lrvsYIebpInmECXG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=VH0bTxPOmRr+jUyV0cGNQHLcwQTV9L-t0bxZOqD8FnHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>
List-Id: devicetree@vger.kernel.org


--lrvsYIebpInmECXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 29, 2018 at 10:23:20PM -0700, Doug Anderson wrote:

> > +                       qcom,drms-mode-max-microamps = <10000 1000000>;

> Things look pretty good to me now.  I'm still hesitant about the whole
> need to list the modes twice (once using the unordered
> "regulator-allowed-modes" and once to match up against the ordered
> "qcom,drms-mode-max-microamps").  I'm also still of the opinion that
> the whole "drms-mode-max-microamps" ought to be a standard property
> (not a qcom specific one) and handled in the regulator core.

I'm confused as to why we are specifying the maximum current the device
can deliver in a given mode in the DT - surely that's a fixed property
of the hardware?

--lrvsYIebpInmECXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlsOfuAACgkQJNaLcl1U
h9DCkwf/TUW3B79DOQ8gDtXWhAdDlfnHkl1MQ+yklnO9/BV1sXKmL7RPDwwOyCqT
cKIWmY4o4H7nvMpr1YXBwW1CXG4r6+87fQDaP0212TufnzJkJjVPv4XMsMAe/Z7b
BTtTtXCFmudVjSrp4l24q94APzWQcgt5I3FWLKiiv93HhKp8+4RBVCKFq/D3XLxk
3nhjUG8zvTMhDtADgAYw3cZrT473IOyUEaXCwTc3wY3srVSX5ffzSZqM8Y2K1Vmi
PLzk694h1wLsHXZe5Ig9HCF/Ys3y65fqhipmHGPcDkB3voPiJj9PNAmSZa16xsYc
Beq6G12n2RpuddPVHJGdx+kuX2KvmQ==
=SPtN
-----END PGP SIGNATURE-----

--lrvsYIebpInmECXG--
