From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 10/13] arm64: dts: qcom: qcs404: Add HFPLL node
Date: Mon, 17 Dec 2018 11:39:11 -0800
Message-ID: <154507555157.19322.2712807405425817338@swboyd.mtv.corp.google.com>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1545039990-19984-11-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545039990-19984-11-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, jassisinghbrar@gmail.com, jorge.ramirez-ortiz@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com
Cc: bjorn.andersson@linaro.org, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2018-12-17 01:46:27)
> The high frequency pll functionality is required to enable CPU
> frequency scaling operation.
>=20
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/q=
com/qcs404.dtsi
> index 4594fea7..ec3f6c7 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -375,6 +375,15 @@
>                         #mbox-cells =3D <1>;
>                 };
> =20
> +               apcs_hfpll: clock-controller@0b016000 {

Drop leading 0 on unit address please.

> +                       compatible =3D "qcom,hfpll";
> +                       reg =3D <0x0b016000 0x30>;

Wow that is small!

> +                       #clock-cells =3D <0>;
> +                       clock-output-names =3D "apcs_hfpll";
> +                       clocks =3D <&xo_board>;
> +                       clock-names =3D "xo";
> +               };
> +
