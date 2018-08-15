From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] firmware: qcom: scm: Add sdm660 soc compatible
Date: Wed, 15 Aug 2018 13:31:26 -0700
Message-ID: <153436508626.28926.521245329376033797@swboyd.mtv.corp.google.com>
References: <20180811162453.10930-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180811162453.10930-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: ctatlor97@gmail.com, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Sricharan R <sricharan@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Craig Tatlor (2018-08-11 09:24:50)
> Add the compatible for SDM660.
> This does not need clocks to do scm calls
> =

> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>  drivers/firmware/qcom_scm.c                             | 3 +++
>  2 files changed, 4 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Do=
cumentation/devicetree/bindings/firmware/qcom,scm.txt
> index fcf6979c0b6d..499608fcc864 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> @@ -11,6 +11,7 @@ Required properties:
>   * "qcom,scm-msm8660" for MSM8660 platforms
>   * "qcom,scm-msm8690" for MSM8690 platforms
>   * "qcom,scm-msm8996" for MSM8996 platforms
> + * "qcom,scm-sdm660" for SDM660 platforms
>   * "qcom,scm-ipq4019" for IPQ4019 platforms
>   * "qcom,scm" for later processors (MSM8916, APQ8084, MSM8974, etc)
>  - clocks: One to three clocks may be required based on compatible.
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index e778af766fae..ee113ceb5d41 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -603,6 +603,9 @@ static const struct of_device_id qcom_scm_dt_match[] =
=3D {
>         { .compatible =3D "qcom,scm-msm8996",
>           .data =3D NULL, /* no clocks */
>         },
> +       { .compatible =3D "qcom,scm-sdm660",
> +         .data =3D NULL, /* no clocks */
> +       },

Do you need to update the driver? It looks like the scm driver should be
changed to just try and get all the clks it can and treat them as
optional clks, i.e. don't fail if they aren't actually listed in DT.
Then we can just have one qcom,scm compatible string in this driver but
we're free to add different compatibles to the binding for all the
different SoCs out there.
