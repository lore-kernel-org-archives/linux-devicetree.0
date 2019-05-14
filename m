From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCHv1 0/8] qcom: Add cpuidle to some platforms
Date: Tue, 14 May 2019 18:11:51 +0200
Message-ID: <CAHYWTt3LAmT4=a9=e6Y_bP1okH0-3zM4i64p0ot+8chDG-DLhg@mail.gmail.com>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 10, 2019 at 04:59:38PM +0530, Amit Kucheria wrote:
> Fix up a few entry-method="psci" issues and then add cpuidle low power
> states for msm8996, msm8998, qcs404, sdm845. All these have been tested
> to only make sure that the C-states are entered from Linux point-of-view.
>
> We will continue to add more states and make power measurements to tweak
> some of these numbers, but getting these merged will allow other people to
> use these platforms to work on cpuidle, eas and related topics.

Hello Amit,

Your subject looks a bit weird:
[PATCHv1 0/8] qcom: Add cpuidle to some platforms

No need to specify reroll count if it is the first version,
and there is usually a space between PATCH and reroll count.

git format-patch [(--reroll-count|-v) <n>]
it should take care of this for you.

Please also add all that is on either to: or cc: in any patch in the series as
cc: for the cover letter.


Kind regards,
Niklas


>
>
> Amit Kucheria (6):
>   arm64: dts: Fix various entry-method properties to reflect
>     documentation
>   Documentation: arm: Link idle-states binding to code
>   arm64: dts: qcom: msm8916: Add entry-method property for the
>     idle-states node
>   arm64: dts: qcom: msm8916: Use more generic idle state names
>   arm64: dts: qcom: msm8996: Add PSCI cpuidle low power states
>   arm64: dts: qcom: msm8998: Add PSCI cpuidle low power states
>
> Niklas Cassel (1):
>   arm64: dts: qcom: qcs404: Add PSCI cpuidle low power states
>
> Raju P.L.S.S.S.N (1):
>   arm64: dts: qcom: sdm845: Add PSCI cpuidle low power states
>
>  .../devicetree/bindings/arm/idle-states.txt   |  7 +++
>  .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  2 +-
>  arch/arm64/boot/dts/qcom/msm8916.dtsi         | 13 ++--
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         | 28 +++++++++
>  arch/arm64/boot/dts/qcom/msm8998.dtsi         | 32 ++++++++++
>  arch/arm64/boot/dts/qcom/qcs404.dtsi          | 18 ++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 62 +++++++++++++++++++
>  7 files changed, 156 insertions(+), 6 deletions(-)
>
> --
> 2.17.1
>
