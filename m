From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v8 2/2] regulator: add QCOM RPMh regulator driver
Date: Tue, 26 Jun 2018 13:07:33 +0100
Message-ID: <20180626120733.GD1779@sirena.org.uk>
References: <cover.1529712888.git.collinsd@codeaurora.org>
 <35c4ea70cdf5caba560fb6f40e866ee8bc456d93.1529712888.git.collinsd@codeaurora.org>
 <CAD=FV=XVEEPgjBXxR+-46RgxLOq63Xvq-jtruoaCxccmMoKUuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=XVEEPgjBXxR+-46RgxLOq63Xvq-jtruoaCxccmMoKUuA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org


--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 25, 2018 at 11:50:52AM -0700, Doug Anderson wrote:

> ...to this patch.  Speaking of which it might be getting very close to
> time for this series to land along with David's other series, AKA:

> * [1/2] regulator: of: add property for allowed modes specification
>   https://patchwork.kernel.org/patch/10395731/

> * [2/2] regulator: of: add support for allowed modes configuration
>   https://patchwork.kernel.org/patch/10395725/

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlsyLIQACgkQJNaLcl1U
h9A3mQf7BbinIiX/WnJKrr4+my+I3hHicVubnBVayQLn5dXhoqJdolPD/4I39ig/
0OBI2Xz6IAuEByEmZKC5cFlV9x7VQaMvfPjjD9vYQJbQmAkd1kwUrKrutjXhtkKn
yStHJBE9mxuxzbIRnonjAwj+TGSGRsnRhVrZaO8xJ8MejTntnCKtSXA55XdqZ5QT
e0IckrY+pD5C1sC9gvCbr6tgHyYRpml7ZkhC6JGPwseoFXVvv2lZdmR6iZ7SUqKy
RzMv6XpdOWESd7I8MMbkYKntbOENYY2hyJRPUApm391hcHFWoOpYi7cO+2K/VDI7
2JrEXzzQX5KyGo80Yy648/8tlqxYqQ==
=e0zs
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--
