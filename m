From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] regulator: Add labibb driver
Date: Tue, 18 Jun 2019 11:59:35 +0100
Message-ID: <20190618105935.GM5316@sirena.org.uk>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-4-git-send-email-nishakumari@codeaurora.org>
 <20190613172518.GN5316@sirena.org.uk>
 <577d6e90-0bed-ff2e-32dc-e64c3118458f@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sbU44GGDGzBBUYp9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <577d6e90-0bed-ff2e-32dc-e64c3118458f@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nisha Kumari <nishakumari@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org, linux-kernel@vger.kernel.org, kgunda@codeaurora.org, rnayak@codeaurora.org
List-Id: devicetree@vger.kernel.org


--sbU44GGDGzBBUYp9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2019 at 11:51:18AM +0530, Nisha Kumari wrote:
> On 6/13/2019 10:55 PM, Mark Brown wrote:

> > > +	labibb->lab_vreg.vreg_enabled = 1;
> > What function does this serve?  It never seems to be read.
> Its used in next patch for handling interrupts

It'd be better to move this code into the patch where it's used then.

> > > +		if (val & IBB_STATUS1_VREG_OK_BIT) {
> > > +			labibb->ibb_vreg.vreg_enabled = 1;
> > > +			return 0;
> > > +		}
> > > +	}

> > This is doing more than the other regulator was but it's not clear why -
> > is it just that the delays are different for the two regulators?

> LAB regulator comes up in first try, so we did not added much delay in that
> like IBB. Planning to make equal no of retries for both in next patch so
> that code can be reused.

Is there actually a need for polling at all?

--sbU44GGDGzBBUYp9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0IxBYACgkQJNaLcl1U
h9DGQQf9Fn7TqN/dXa0DWnKZiNKqKqQOQ0wKS8WelZLNW4v6/5KFIyrz+82a3s8p
r7RFFxI24fxs2p8pztsKCXeh1izQCVTOW/FbP5rML9FGkMVoNeGw7YseKvmiIPpn
vF9XsDTNRe9RIQ4UOMqwMNvauR5eHR9aPtLDtZ0tspewoj2fNtszc40LqZJsA+Kq
pzf6Mk4JZr6ZcteH3fnBoGDsW9mNEYmc3Iq1ypR4nuxcLwOUpilFssOzYAziTt2D
we0Cz/kP/ANEk7/f6YJLfDMKiKJMhddbI37MvIktRpMuLw7chcQJcS9buuvIHAiE
wQNNKWGz/eyWI+Ke81ZfjeXzLO8Raw==
=im0z
-----END PGP SIGNATURE-----

--sbU44GGDGzBBUYp9--
