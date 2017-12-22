From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/5] bindings: regulator: added support for suspend states
Date: Fri, 22 Dec 2017 15:49:04 +0000
Message-ID: <20171222154904.GK1827@finisterre>
References: <1513837506-26543-1-git-send-email-zhang.chunyan@linaro.org>
 <1513837506-26543-2-git-send-email-zhang.chunyan@linaro.org>
 <20171221232614.rhrgrpyl2w2lc6bw@rob-hp-laptop>
 <CAG2=9p9ahGgnz1Gos-o-o5PB9UH--2t3Lv54PaK5_f2jpNQnDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M0YLxmUXciMpOLPE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAG2=9p9ahGgnz1Gos-o-o5PB9UH--2t3Lv54PaK5_f2jpNQnDQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org


--M0YLxmUXciMpOLPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 22, 2017 at 02:05:21PM +0800, Chunyan Zhang wrote:
> On 22 December 2017 at 07:26, Rob Herring <robh@kernel.org> wrote:
> > On Thu, Dec 21, 2017 at 02:25:02PM +0800, Chunyan Zhang wrote:

> >> +     - regulator-suspend-microvolt: the default voltage which regulator
> >> +       should be set in suspend, this can be adjusted among
> >> +       <regulator-suspend-min-microvolt, regulator-suspend-max-microvolt>

> > Perhaps this should stay a single property with: <target> <min> <max>

> Do you mean that change the property name from "regulator-suspend-microvolt" to
> "regulator-suspend-target-microvolt"?

> "regulator-suspend-microvolt" is the one that some SoC is using. My
> intention was just to keep that configuration still working.

Yeah, the regulator-suspend-microvolt is an existing property.  Thinking
about it we should probably say that it's equivalent to setting both
-min and -max to the same value and possibly mark it as deprecated too.
It is documented in regulator.txt already.

> > Though why would you ever not try to set to the minimum voltage within
> > the range of <min> to <max>?

> IIUC, you mean just removing "regulator-suspend-microvolt", and use
> "regulator-suspend-min-microvolt" as the default value for suspend
> voltage?
> I think that can work, but would it be better to not remove that right
> now, since some one is using that?

Indeed.  I think my suggestion above would cover things.

--M0YLxmUXciMpOLPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlo9KW0ACgkQJNaLcl1U
h9BsfAf/aLd29F5ggAUSccjNW7JhIgywZ4Q33ANltRQ8jn0fkGzIkFN3MUy0nKvn
QQ/hS5RSq8YcATFIlzEjKFtK8XMJFrhvC7OaQx63QtIu1e8+5+MUUU6PmSp+D67u
agvVRGjEIY1wqW9NkNKnQtYVP/cwktO3ym/4G5bhTfXlQUB+qgbcTrT/MyjXmQtg
glA2Ly9U3rWYBuKiVfJ1oR4UD/qeNCLwg35rRv96wiPlbymIJqg7XWXsQeEWV+93
EcBKLBhYn0WlAlC+tpUhv815WE8OtCHUZKZFNlKfc5/AVTQskD7trZXZH1MSoiSM
Ju++UlwImVKeKzITWkX0f3gkNYJ+1g==
=bpvE
-----END PGP SIGNATURE-----

--M0YLxmUXciMpOLPE--
