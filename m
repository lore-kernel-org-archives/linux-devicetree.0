From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v9 1/2] regulator: dt-bindings: add QCOM RPMh regulator
 bindings
Date: Tue, 24 Jul 2018 16:25:14 +0100
Message-ID: <20180724152514.GJ13268@sirena.org.uk>
References: <cover.1531531808.git.collinsd@codeaurora.org>
 <56b9d5c38cfe46da1228c54f001a49773c3e31dc.1531531808.git.collinsd@codeaurora.org>
 <CAD=FV=VmfqWRGRMEn+0dzZ8x4R5vVaHbkthXAN91Lm-XmP9Gqg@mail.gmail.com>
 <20180724145755.GF13268@sirena.org.uk>
 <CAD=FV=Uo8sT72a0gRitOVoK0SfC-_QixsovW94_LnL6H7QdKvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vkEkAx9hr54EJ73W"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=Uo8sT72a0gRitOVoK0SfC-_QixsovW94_LnL6H7QdKvA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org


--vkEkAx9hr54EJ73W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 24, 2018 at 08:11:30AM -0700, Doug Anderson wrote:

> RPMh itself landed in Andy's tree and he sent a pull request on
> Saturday.  Feel free to refer to the request ("[GIT PULL] Qualcomm
> Driver updates for 4.19") AKA
> <https://patchwork.kernel.org/patch/10539125/>.

> It doesn't look like arm-soc has picked up Andy's pull request yet
> though.  If having it in arm-soc is a requirement then I'm happy to
> monitor arm-soc and ping this thread again when it's there.

There was also some other thing called command DB as well which was a
separate series.  Ideally there'd be a branch I could pull as there's a
build dependency on rpmh so I can't apply until the code has landed in
my tree, don't know what command DB is exactly.

--vkEkAx9hr54EJ73W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltXRNkACgkQJNaLcl1U
h9B3bwf+La4kf/5PmQL+J1NQkMHGXm91bKmR8eDDzkpswmiG1B1RLB/AcEIHjQGG
O+4kg+zfIT25E1bdVzcKvjJO4rwSHpXMpIIdgJc0NAGVCO4rb0Jh9qyWJnNzStMW
cVcRGg09wXvTzY11DT5LFLA//oqx3Dsw++sfGg+h2JoYsR0evnpHNXHQkRIlgDCa
PkNmkkTfPh4lPJjr99znmyuox8Llg+rwI9MmcqzDzuJTW2yj517Dyh07FXbcHU0X
GTVo10ah2mYE2RecDa3gRxNizHq8+qqhFnIA9zXITZfZCwVtFRajTw2ddFCxs518
6VoHO9Jy76VEYE7eQMc7bzeMYlhtlg==
=AohO
-----END PGP SIGNATURE-----

--vkEkAx9hr54EJ73W--
