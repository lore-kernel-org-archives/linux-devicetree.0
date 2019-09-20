From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 09/15] arm64: dts: msm8996: thermal: Add interrupt support
Date: Fri, 20 Sep 2019 15:02:41 -0700
Message-ID: <5d854c82.1c69fb81.66e1f.96ab@mx.google.com>
References: <cover.1569015835.git.amit.kucheria@linaro.org> <f627e66c455f52b5662bef6526d7c72869808401.1569015835.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f627e66c455f52b5662bef6526d7c72869808401.1569015835.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, agross@kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, masneyb@onstation.org
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Amit Kucheria (2019-09-20 14:52:24)
> Register upper-lower interrupts for each of the two tsens controllers.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 60 ++++++++++++++-------------
>  1 file changed, 32 insertions(+), 28 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/=
qcom/msm8996.dtsi
> index 96c0a481f454..bb763b362c16 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -175,8 +175,8 @@
> =20
>         thermal-zones {
>                 cpu0-thermal {
> -                       polling-delay-passive =3D <250>;
> -                       polling-delay =3D <1000>;
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;

I thought the plan was to make this unnecessary to change?
