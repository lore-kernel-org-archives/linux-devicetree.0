From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH RFC 1/5] drm/msm/hdmi: deprecate non standard gpio
 properties.
Date: Mon, 10 Aug 2015 14:45:12 +0200
Message-ID: <20150810124510.GC1262@ulmo.nvidia.com>
References: <1439207923-30812-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1439207962-30860-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1128633726=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1439207962-30860-1-git-send-email-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1128633726==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CPaaJmjEtnx7DmsZ"
Content-Disposition: inline


--CPaaJmjEtnx7DmsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2015 at 12:59:22PM +0100, Srinivas Kandagatla wrote:
> This patch updates the bindings to discourage the usage of non standard
> gpio properites, this will help in projects focused on upstreaming.

That last part is an odd comment to make in the commit message of a
patch submitted upstream...

> These deprecated properties are still supported but will be remove over
> the time.

You can't ever remove them because you can't ever be sure that people
won't be using an old DTB.

>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/drm/msm/hdmi.txt | 22 ++++++++++++++++=
+-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/drm/msm/hdmi.txt b/Documen=
tation/devicetree/bindings/drm/msm/hdmi.txt
> index c43aa53..acba581 100644
> --- a/Documentation/devicetree/bindings/drm/msm/hdmi.txt
> +++ b/Documentation/devicetree/bindings/drm/msm/hdmi.txt
> @@ -11,15 +11,27 @@ Required properties:
>  - interrupts: The interrupt signal from the hdmi block.
>  - clocks: device clocks
>    See ../clocks/clock-bindings.txt for details.
> -- qcom,hdmi-tx-ddc-clk-gpio: ddc clk pin
> -- qcom,hdmi-tx-ddc-data-gpio: ddc data pin
> -- qcom,hdmi-tx-hpd-gpio: hpd pin
> +- qcom,hdmi-tx-ddc-clk-gpios: ddc clk pin
> +- qcom,hdmi-tx-ddc-data-gpios: ddc data pin
> +- qcom,hdmi-tx-hpd-gpios: hpd pin
>  - core-vdda-supply: phandle to supply regulator
>  - hdmi-mux-supply: phandle to mux regulator
> =20
> +- qcom,hdmi-tx-ddc-clk-gpio: (deprecated) use
> +	"qcom,hdmi-tx-ddc-clk-gpios" instead
> +- qcom,hdmi-tx-ddc-data-gpio: (deprecated) use
> +	"qcom,hdmi-tx-ddc-data-gpios" instead
> +- qcom,hdmi-tx-hpd-gpio: (deprecated) use
> +	"qcom,hdmi-tx-hpd-gpios" instead
> +
>  Optional properties:
> -- qcom,hdmi-tx-mux-en-gpio: hdmi mux enable pin
> -- qcom,hdmi-tx-mux-sel-gpio: hdmi mux select pin
> +- qcom,hdmi-tx-mux-en-gpios: hdmi mux enable pin
> +- qcom,hdmi-tx-mux-sel-gpios: hdmi mux select pin
> +
> +- qcom,hdmi-tx-mux-en-gpio: (deprecated) use "qcom,hdmi-tx-mux-en-gpios"
> +	instead
> +- qcom,hdmi-tx-mux-sel-gpio: (deprecated) use "qcom,hdmi-tx-mux-sel-gpio"
> +	instead
>  - pinctrl-names: the pin control state names; should contain "default"
>  - pinctrl-0: the default pinctrl state (active)
>  - pinctrl-1: the "sleep" pinctrl state

I don't see much use in listing that these properties are deprecated. We
already have code to catch the deprecated names, so having them in the
binding will at best be distracting.

Anyway, I don't know if there's been any advice on this from the device
tree bindings maintainers, so adding devicetree@vger.kernel.org for
visibility.

Thierry

--CPaaJmjEtnx7DmsZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVyJzWAAoJEN0jrNd/PrOhfQYP/RJSxc5vZG+yNNYIrlMBbayw
PdTlIgy+LcWEfGvUD92PuHXxHQY9d2QiHCInVHgkrSGzhSNblCKtGy7Z/Jfm05Jn
QTTtGQdeoN6LbLihKFSeT8AAUKeZyDSxk1yvj4w4N4s6JKxo72eMxyxRYeWdBdJU
akjbjUxIl+UxurE94JwzLLXlVnO7+2MSFZ78/OQWaItxYG85MObmLwiNwxhAgasK
NAzIjHRqsEiEIc599DfkJs+uGIVrC4cysne4w6sSfckF9539v8TSVTWzw242t62C
yfGtKYkrt7202sZdZO1w67l/P5HHXI1R0qqrPLolsWJnSjByFFyyIc8f+r/pBHH4
Y2bKFYmhF+fWgHZ4KMuTIDG5O4rAO/TCWQJoRQtpQbFP/qnQOfsPaFLDQGE37K0n
M5JXgGNcLEGyV1huN5dWAJ2L4yAlFpYlwUr7FZPetfXiCIL100uVMKIMj5qNESGk
Tmsorbtpy+cqQM5reAt2242EVL4aMdVIIH7rmupoIdtQnV0L6zyU5uvu0HJtRA2E
LHInqFcQxxw8/IYh1xp80weLrcuAoIroGKTJoYkVkWjiFNv61rBFHrY/W8RkNvC4
ft8nbR+ufnbd7DRhJDy8EBmAIEXvIxrtePG5mG8VUAZ5K5mbgawak+PiNCoQ5QAg
GbjOQ+AFlKcRF16DKs2E
=tkdq
-----END PGP SIGNATURE-----

--CPaaJmjEtnx7DmsZ--

--===============1128633726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1128633726==--
