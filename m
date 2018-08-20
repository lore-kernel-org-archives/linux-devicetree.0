From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-mtp: Add RPMh VRM/XOB regulators
Date: Mon, 20 Aug 2018 11:18:47 -0700
Message-ID: <153478912722.28926.1278085207557745493@swboyd.mtv.corp.google.com>
References: <20180810215150.82490-1-dianders@chromium.org>
 <20180810215150.82490-3-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180810215150.82490-3-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, tfiga@chromium.org, Manu Gautam <mgautam@codeaurora.org>, David Collins <collinsd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Douglas Anderson (2018-08-10 14:51:49)
> @@ -20,6 +21,450 @@
>         chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
> +
> +       vph_pwr: vph-pwr-regulator {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vph_pwr";
> +               regulator-min-microvolt =3D <3700000>;
> +               regulator-max-microvolt =3D <3700000>;
> +       };
> +
> +       /*
> +        * Apparently RPMh does not provide support for PM8998 S4 because=
 it
> +        * is always-on; model it as a fixed regulator.
> +        */
> +       vreg_s4a_1p8: pm8998-smps4 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vreg_s4a_1p8";
> +
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +
> +               regulator-always-on;
> +               regulator-boot-on;

Can vin be vph_pwr? That would properly model this.

> +       };
> +};
