From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH RFC 12/15] ARM: dts: imx6qdl-sabresd: Add support for
 TRULY TFT480800-16-E MIPI DSI panel
Date: Wed, 10 Dec 2014 15:07:53 +0100
Message-ID: <20141210140751.GF23558@ulmo.nvidia.com>
References: <1418200648-32656-1-git-send-email-Ying.Liu@freescale.com>
 <1418200648-32656-13-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1582104360=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1418200648-32656-13-git-send-email-Ying.Liu@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Liu Ying <Ying.Liu@freescale.com>
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1582104360==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B0nZA57HJSoPbsHY"
Content-Disposition: inline


--B0nZA57HJSoPbsHY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 10, 2014 at 04:37:25PM +0800, Liu Ying wrote:
[...]
> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
[...]
> +&mipi_dsi {
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "himax,hx8369a-dsi";
> +		reg = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_mipi_panel>;
> +		reset-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
> +		reset-delay = <120>;
> +		bs2-gpios = <&gpio6 14 GPIO_ACTIVE_HIGH>;
> +		data-lanes = <2>;
> +		panel-width-mm = <45>;
> +		panel-height-mm = <76>;
> +		bs = <10>;
> +		status = "okay";
> +
> +		display-timings {
> +			native-mode = <&timing1>;
> +			timing1: truly-tft480800-16-e {

This is the only place where Truly is mentioned. The panel vendor is
either Truly or it is Himax, it can't be a mix. From this example and
your patch description it seems like Truly is the manufacturer of the
panel, hence the panel compatible should really be:

	compatible = "truly,tft480800-16-e";

That it uses an HX8369A chip internally is really secondary, at least
regarding the binding. If we ever get need to support multiple panels
with the same driver IC the proper solution would be to abstract that
code out into a helper library that is used from the various panel
drivers.

Thierry

--B0nZA57HJSoPbsHY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUiFO3AAoJEN0jrNd/PrOhNVMQAJ7nyeBGoPn6DqBNFXP48D0u
6WICYrBJ/ZufLiIHcYQsaHpZd2yMz3xuSp+FRdGZWMk8fbYflhgu79xAUIz+KAth
vP1ew3b7gcokFfHQMunHGrOPQUSsuVIGBHuqiC6dIxqppmSZWkJIhzNXIGJf66xV
pNqe7Cd3/8v/HhhQUeI3Z47HwTxHMNmO10OLvf5iBatx4GRZy1n5uxu9cE4Dm+RV
xjvuVciqfgqkHhd5Hrd8YXyOv3tJfGjMl5QEdDOCXx/3Afo+zcMwNp/VOHSoWDKp
Ewf6qZtkpnQjDkni5e2gCnhFDQ7k1+rLpkQHOMgtEfXLlppKALTlZDw3s6S00mX2
uJ6YI0a/b/uZiWacOji8YPQNLAaIM36Puf25m1ubng27It2aU3jH3qBxM2yNwqnx
HRpl6dRNx09FXCW2+UOmlrWslhRbm6gsogNwJKeESqG1BorFlih6v72qHiCD9t0Z
TScCCaCVBGs7339lT/eq8IGD/z9bdr6997Crepv7srs5/pKmGo15OhNM7Jkw9rWy
zbFFhDUg6IxbT4Da+OEErRgEvi/zgl24cgSF7iFeVakoOrJPLq6t7GlejP+u+jyM
ZfowlAith9Q6dib8X4o3TPCulvw4BnP8ovn8U9CIxbEfoY5HgoL0atOa0q9qLAvm
hHy1NDzgISH1Zxfn61S9
=Rml8
-----END PGP SIGNATURE-----

--B0nZA57HJSoPbsHY--

--===============1582104360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1582104360==--
