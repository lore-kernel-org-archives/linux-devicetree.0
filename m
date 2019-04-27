From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/8] qcom: spmi/ssbi gpio: correct gpio hogging
Date: Fri, 26 Apr 2019 22:30:34 -0700
Message-ID: <20190427053034.GH3137@builder>
References: <20190306005316.12232-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190306005316.12232-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 05 Mar 16:53 PST 2019, Brian Masney wrote:

> Here are some patches that fix gpio hogging for all boards that use
> spmi-gpio and ssbi-gpio. These depend on the following two patches
> that were merged in 4.20-rc1:
> 
> commit 149a96047237 ("pinctrl: qcom: spmi-gpio: fix gpio-hog related
> boot issues")
> 
> commit 7ed078557738 ("pinctrl: qcom: ssbi-gpio: fix gpio-hog related
> boot issues")
> 
> I've already fixed pm8941 for the Nexus 5 and that fix is queued to go
> into v5.1 during this merge window:
> 
> https://lore.kernel.org/lkml/20181101001149.13453-7-masneyb@onstation.org/
> 
> Andy: You may want to consider submitting these post rc1 as a fix for
> v5.1 and possibly marking these for stable.
> 
> Brian Masney (8):
>   ARM: dts: qcom: apq8064: add gpio-ranges
>   ARM: dts: qcom: mdm9615: add gpio-ranges
>   ARM: dts: qcom: msm8660: add gpio-ranges
>   ARM: dts: qcom: pma8084: add gpio-ranges

Looks like I missed the ARM patches before. All 8 picked up now, with
Linus' r-b.

Thanks,
Bjorn

>   arm64: dts: qcom: pm8005: add gpio-ranges
>   arm64: dts: qcom: pm8998: add gpio-ranges
>   arm64: dts: qcom: pmi8994: add gpio-ranges
>   arm64: dts: qcom: pmi8998: add gpio-ranges
> 
>  arch/arm/boot/dts/qcom-apq8064.dtsi   | 1 +
>  arch/arm/boot/dts/qcom-mdm9615.dtsi   | 1 +
>  arch/arm/boot/dts/qcom-msm8660.dtsi   | 1 +
>  arch/arm/boot/dts/qcom-pma8084.dtsi   | 1 +
>  arch/arm64/boot/dts/qcom/pm8005.dtsi  | 1 +
>  arch/arm64/boot/dts/qcom/pm8998.dtsi  | 1 +
>  arch/arm64/boot/dts/qcom/pmi8994.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 1 +
>  8 files changed, 8 insertions(+)
> 
> -- 
> 2.20.1
> 
