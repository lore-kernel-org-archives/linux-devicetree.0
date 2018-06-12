From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 0/7] Add powerdomain driver for corners on msm8996/sdm845
Date: Tue, 12 Jun 2018 09:47:25 +0200
Message-ID: <CAPDyKFppkycq0d53eiBVErHh5C6TwGcUrqaiagY_165Xcpux7w@mail.gmail.com>
References: <20180612044052.4402-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612044052.4402-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>, collinsd@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 12 June 2018 at 06:40, Rajendra Nayak <rnayak@codeaurora.org> wrote:
> Changes in v3:
> * Bindings split into seperate patches
> * Bindings updated to remove duplicate OPP table phandles
> * DT headers defining macros for Power domain indexes and OPP levels
> * Optimisations to use rpmh_write_async() whereever applicable
> * Fixed up handling of ACTIVE_ONLY/WAKE_ONLY/SLEEP voting for RPMh
> * Fixed the vlvl to hlvl conversions in set_performance
> * Other minor fixes based on review of v2
> * TODO: This series does not handle the case where all VDD_MX votes
> should be higher than VDD_CX from APPs, as pointed out
> by David Collins in v2. This needs support at genpd to propogate performance
> state up the parents, if we model these as Parent/Child to handle the
> interdependency.
>
> Changes in v2:
> * added a powerdomain driver for sdm845 which supports communicating to RPMh
> * dropped the changes to sdhc driver to move over to using OPP
> as there is active discussion on using OPP as the interface vs
> handling all of it in clock drivers
> * Other minor binding updates based on review of v1
>
> With performance state support for genpd/OPP merged, this is an effort
> to model a powerdomain driver to communicate corner/level
> values for qualcomm platforms to RPM (Remote Power Manager) and RPMh.
>
> Rajendra Nayak (7):
>   dt-bindings: power: Add qcom rpm power domain driver bindings
>   soc: qcom: rpmpd: Add a Power domain driver to model corners
>   soc: qcom: rpmpd: Add support for get/set performance state
>   arm64: dts: msm8996: Add rpmpd device node
>   dt-bindings: power: Add qcom rpmh power domain driver bindings
>   soc: qcom: Add RPMh Power domain driver
>   soc: qcom: rpmpd/rpmhpd: Add a max vote on all corners at init
>
>  .../devicetree/bindings/power/qcom,rpmhpd.txt |  65 +++
>  .../devicetree/bindings/power/qcom,rpmpd.txt  |  49 ++
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |  34 ++
>  drivers/soc/qcom/Kconfig                      |  18 +
>  drivers/soc/qcom/Makefile                     |   2 +
>  drivers/soc/qcom/rpmhpd.c                     | 437 ++++++++++++++++++
>  drivers/soc/qcom/rpmpd.c                      | 356 ++++++++++++++
>  include/dt-bindings/power/qcom-rpmhpd.h       |  31 ++
>  include/dt-bindings/power/qcom-rpmpd.h        |  16 +
>  9 files changed, 1008 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmhpd.txt
>  create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
>  create mode 100644 drivers/soc/qcom/rpmhpd.c
>  create mode 100644 drivers/soc/qcom/rpmpd.c
>  create mode 100644 include/dt-bindings/power/qcom-rpmhpd.h
>  create mode 100644 include/dt-bindings/power/qcom-rpmpd.h
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>

For the series:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
