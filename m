From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v7 3/7] arm64: dts: msm8996: thermal: Initialise via DT
 and add second controller
Date: Thu, 12 Jul 2018 10:14:32 -0700
Message-ID: <CAD=FV=W-7CfChV0wn29uR-OH7mH65kmO=0yQUWUbksmb6qL=GQ@mail.gmail.com>
References: <cover.1531384019.git.amit.kucheria@linaro.org> <f6cb99e6b805b0850b039e4f5d469e761d84f6d0.1531384019.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f6cb99e6b805b0850b039e4f5d469e761d84f6d0.1531384019.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, smohanad@codeaurora.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Matthias Kaehlcke <mka@chromium.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Jul 12, 2018 at 1:39 AM, Amit Kucheria <amit.kucheria@linaro.org> wrote:
> We also split up the regmap address space into two, for the TM and SROT
> registers. This was required to deal with different address offsets for the
> TM and SROT registers across different SoC families.
>
> 8996 has two TSENS IP blocks, initialise the second one too.
>
> Since tsens-common.c/init_common() currently only registers one address
> space, the order is important (TM before SROT). This is OK since the code
> doesn't really use the SROT functionality yet.
>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Tested-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
