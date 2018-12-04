From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 7/8] arm64: dts: sdm845: Add rpmh powercontroller node
Date: Tue, 04 Dec 2018 15:16:03 -0800
Message-ID: <154396536335.88331.9265777410326926096@swboyd.mtv.corp.google.com>
References: <20181204052119.806-1-rnayak@codeaurora.org>
 <20181204052119.806-8-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204052119.806-8-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-12-03 21:21:18)
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index b72bdb0a31a5..a6d0cd8d17b0 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1324,6 +1325,56 @@
>                                 compatible =3D "qcom,sdm845-rpmh-clk";
>                                 #clock-cells =3D <1>;
>                         };
> +
> +                       rpmhpd: power-controller {
> +                               compatible =3D "qcom,sdm845-rpmhpd";
> +                               #power-domain-cells =3D <1>;
> +                               operating-points-v2 =3D <&rpmhpd_opp_tabl=
e>;
> +                       };
> +
> +                       rpmhpd_opp_table: opp-table {

This table should go somewhere else? I don't understand why it's in the
rpmh node because it's not an rpmh device. Does it go to the root? Or
does it go under rpmhpd itself? I'm not sure.
