From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 09/15] arm64: dts: msm8996: thermal: Add interrupt support
Date: Tue, 27 Aug 2019 17:35:21 -0700
Message-ID: <5d65cc4a.1c69fb81.376b6.2486@mx.google.com>
References: <cover.1566907161.git.amit.kucheria@linaro.org> <1cb5ab682bce53d32f3a73b5b29cc6c3e800bfcc.1566907161.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1cb5ab682bce53d32f3a73b5b29cc6c3e800bfcc.1566907161.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, agross@kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, marc.w.gonzalez@free.fr, masneyb@onstation.org
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Amit Kucheria (2019-08-27 05:14:05)
> Register upper-lower interrupts for each of the two tsens controllers.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 60 ++++++++++++++-------------
>  1 file changed, 32 insertions(+), 28 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/=
qcom/msm8996.dtsi
> index 96c0a481f454e..bb763b362c162 100644
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

Is it really necessary to change the configuration here to be 0 instead
of some number? Why can't we detect that there's an interrupt and then
ignore these properties?
