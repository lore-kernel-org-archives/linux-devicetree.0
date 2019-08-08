From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH 00/15] thermal: qcom: tsens: Add interrupt support
Date: Thu, 8 Aug 2019 18:34:37 +0530
Message-ID: <CAHLCerP4v_Lz5OGswx7+Z5uHVq_D8G5brq-_M6fOc0K6DK2OKg@mail.gmail.com>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <agross@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, sivaa@codeaurora.org
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>, Brian Masney <masneyb@onstation.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 26, 2019 at 3:48 AM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> Add interrupt support to TSENS. The first 6 patches are general fixes and
> cleanups to the driver before interrupt support is introduced.
>
> This series has been developed against qcs404 and sdm845 and then tested on
> msm8916. Testing on msm8998 and msm8974 would be appreciated since I don't
> have hardware handy. Further, I plan to test on msm8996 and also submit to
> kernelci.

Gentle nudge for reviews. This has now been successfully tested on
8974 (along with 8916, qcs404, sdm845). Testing on msm8998 would be
much appreciated.

> I'm sending this out for more review to get help with testing.
>
> Amit Kucheria (15):
>   drivers: thermal: tsens: Get rid of id field in tsens_sensor
>   drivers: thermal: tsens: Simplify code flow in tsens_probe
>   drivers: thermal: tsens: Add __func__ identifier to debug statements
>   drivers: thermal: tsens: Add debugfs support
>   arm: dts: msm8974: thermal: Add thermal zones for each sensor
>   arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
>   dt: thermal: tsens: Document interrupt support in tsens driver
>   arm64: dts: sdm845: thermal: Add interrupt support
>   arm64: dts: msm8996: thermal: Add interrupt support
>   arm64: dts: msm8998: thermal: Add interrupt support
>   arm64: dts: qcs404: thermal: Add interrupt support
>   arm64: dts: msm8974: thermal: Add interrupt support
>   arm64: dts: msm8916: thermal: Add interrupt support
>   drivers: thermal: tsens: Create function to return sign-extended
>     temperature
>   drivers: thermal: tsens: Add interrupt support
>
>  .../bindings/thermal/qcom-tsens.txt           |   5 +
>  arch/arm/boot/dts/qcom-msm8974.dtsi           | 108 +++-
>  arch/arm64/boot/dts/qcom/msm8916.dtsi         |  26 +-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |  60 +-
>  arch/arm64/boot/dts/qcom/msm8998.dtsi         |  82 +--
>  arch/arm64/boot/dts/qcom/qcs404.dtsi          |  42 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          |  88 +--
>  drivers/thermal/qcom/tsens-8960.c             |   4 +-
>  drivers/thermal/qcom/tsens-common.c           | 610 +++++++++++++++++-
>  drivers/thermal/qcom/tsens-v0_1.c             |  11 +
>  drivers/thermal/qcom/tsens-v1.c               |  29 +
>  drivers/thermal/qcom/tsens-v2.c               |  18 +
>  drivers/thermal/qcom/tsens.c                  |  52 +-
>  drivers/thermal/qcom/tsens.h                  | 285 +++++++-
>  14 files changed, 1214 insertions(+), 206 deletions(-)
>
> --
> 2.17.1
>
