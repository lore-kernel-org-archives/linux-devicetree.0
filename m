From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: sdm845: Add UFS nodes for sdm845-mtp
Date: Mon, 19 Nov 2018 11:19:08 -0800
Message-ID: <154265514855.88331.12521366940818102477@swboyd.mtv.corp.google.com>
References: <20181026173544.136037-1-evgreen@chromium.org>
 <20181026173544.136037-5-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181026173544.136037-5-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Can Guo <cang@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Evan Green (2018-10-26 10:35:43)
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dt=
s/qcom/sdm845-mtp.dts
> index eedfaf8922e2..d5fddea71a85 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -356,6 +356,20 @@
>         status =3D "okay";
>  };
>  =

> +&ufshc1 {
> +       status =3D "okay";
> +
> +       vcc-supply =3D <&vreg_l20a_2p95>;
> +       vcc-max-microamp =3D <600000>;

Is this board dependent? I would guess this is SoC specific and not
board specific.

> +};
> +
> +&ufsphy1 {
> +       status =3D "okay";
> +
> +       vdda-phy-supply =3D <&vdda_ufs1_core>;
> +       vdda-pll-supply =3D <&vdda_ufs1_1p2>;

These two properties can be specified in the SoC dtsi file instead of
each board variant file. This way we don't have to specify the things
that are SoC independent in each board file. The board integrator just
has to attach the labels to the right regulator nodes, in this case
vdda_ufs1_core and vdda_ufs1_1p2, and then the sdm845.dtsi file will be
matched up with the right regulator automatically. It's also nice so
that board integrators don't have to know anything besides what
regulator goes to what pin on the SoC.

The status property has to stay of course.
