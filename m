From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v9 1/2] regulator: dt-bindings: add QCOM RPMh regulator
 bindings
Date: Tue, 24 Jul 2018 17:59:42 +0100
Message-ID: <20180724165942.GP13268@sirena.org.uk>
References: <cover.1531531808.git.collinsd@codeaurora.org>
 <56b9d5c38cfe46da1228c54f001a49773c3e31dc.1531531808.git.collinsd@codeaurora.org>
 <CAD=FV=VmfqWRGRMEn+0dzZ8x4R5vVaHbkthXAN91Lm-XmP9Gqg@mail.gmail.com>
 <20180724145755.GF13268@sirena.org.uk>
 <CAD=FV=Uo8sT72a0gRitOVoK0SfC-_QixsovW94_LnL6H7QdKvA@mail.gmail.com>
 <20180724152514.GJ13268@sirena.org.uk>
 <CAD=FV=WHJcAoR7Y_uhi7_GbVzy6K8FnovVFVRz8js0REONox=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YolNsh7G+K7zsfIR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WHJcAoR7Y_uhi7_GbVzy6K8FnovVFVRz8js0REONox=w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org


--YolNsh7G+K7zsfIR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 24, 2018 at 08:43:46AM -0700, Doug Anderson wrote:
> On Tue, Jul 24, 2018 at 8:25 AM, Mark Brown <broonie@kernel.org> wrote:

> > There was also some other thing called command DB as well which was a
> > separate series.  Ideally there'd be a branch I could pull as there's a
> > build dependency on rpmh so I can't apply until the code has landed in
> > my tree, don't know what command DB is exactly.

> Yup.  That one landed in May and is already in mainline Linux.  Refer
> to commit 312416d9171a ("drivers: qcom: add command DB driver").

That's good at least - the cover letter said it was still under review,
guess it just hadn't been updated.

> Adding Andy to this thread (I guess he wasn't on it?).  Hopefully he
> can provide you with the branch.

Andy?

--YolNsh7G+K7zsfIR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltXWv0ACgkQJNaLcl1U
h9BuHgf9GRH5tb+1FbNT9oKVHDnQgIn4bP+9Wfh0QYbjjzaRVriOVKEOsImplY9A
L6DDe4zYGa8cyKNFMwf+Zy8nd2IT4pv2Ko1DsK4/iSkrfvT2GEi7u0S3g2ipv7Wc
xVZHtDJf3SYdsjefueAPydmUlndUASHoz7Cvs9RZmqJKo/5H2S9rRdjp/zZQM7bI
qO6h1RVB5sk/bfUB7AM9CfyWPCUNBdR6okiopiJywjLdrOcnPlfXbsIj2JPDzu4e
KdH7tEoejUOtYtrbflKplNt+NnNv7kGOF0v+6OO1MzlsHk3MH3BYtNNYwHZTBewX
XwHvI3U08/h54RUL2z0EViHU9PLk3g==
=hLlJ
-----END PGP SIGNATURE-----

--YolNsh7G+K7zsfIR--
