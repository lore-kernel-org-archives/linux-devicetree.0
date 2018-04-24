From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] mfd: qcom-spmi-pmic: Add support for pm8005,pm8998,pmi8998
Date: Mon, 23 Apr 2018 22:26:29 -0700
Message-ID: <CAD=FV=VoGpRLsPXcfPaiaJh18u+79DcN9PUGScDKUu+COgj7Gw@mail.gmail.com>
References: <20180419230032.13611-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180419230032.13611-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Apr 19, 2018 at 4:00 PM, Stephen Boyd <swboyd@chromium.org> wrote:
> diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
> index 2022bdfa7ab4..0b26387c22e7 100644
> --- a/drivers/mfd/qcom-spmi-pmic.c
> +++ b/drivers/mfd/qcom-spmi-pmic.c
> @@ -39,6 +39,9 @@
>  #define PM8916_SUBTYPE         0x0b
>  #define PM8004_SUBTYPE         0x0c
>  #define PM8909_SUBTYPE         0x0d
> +#define PM8998_SUBTYPE         0x14
> +#define PMI8998_SUBTYPE                0x15
> +#define PM8005_SUBTYPE         0x18

I was being overly paranoid and double-checking these numbers.  I
confirmed PMI8998 and PM8005 from the docs (yay!).  The PM8998 docs
didn't have this, but I confirmed that I was talking to PM8998 by
confirming it was on the right USID and and then printing out the
value at probe time.  All look good.


>  static const struct of_device_id pmic_spmi_id_table[] = {
>         { .compatible = "qcom,spmi-pmic", .data = (void *)COMMON_SUBTYPE },
> @@ -54,7 +57,10 @@ static const struct of_device_id pmic_spmi_id_table[] = {
>         { .compatible = "qcom,pmi8994",   .data = (void *)PMI8994_SUBTYPE },
>         { .compatible = "qcom,pm8916",    .data = (void *)PM8916_SUBTYPE },
>         { .compatible = "qcom,pm8004",    .data = (void *)PM8004_SUBTYPE },
> +       { .compatible = "qcom,pmi8998",   .data = (void *)PMI8998_SUBTYPE },
> +       { .compatible = "qcom,pm8005",    .data = (void *)PM8005_SUBTYPE },
>         { .compatible = "qcom,pm8909",    .data = (void *)PM8909_SUBTYPE },
> +       { .compatible = "qcom,pm8998",    .data = (void *)PM8998_SUBTYPE },

nit: It appears that the above table was previously sorted by SUBTYPE
ID.  Could you perhaps move your 3 new PMICs to the bottom to maintain
this?  Other than that, you can add my Reviewed-by if you would like
(not that I have _any_ real expertise on SPMI, so might not be worth
it).


-Doug
