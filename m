From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-cheza: add initial cheza dt
Date: Fri, 17 May 2019 11:34:59 -0700
Message-ID: <CAD=FV=XWz9iigg-GWrKZdsYePhH7==d3hZ9kZDXKeEuwLXOhaw@mail.gmail.com>
References: <20190517015305.23194-1-robdclark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190517015305.23194-1-robdclark@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@chromium.org>, Sibi Sankar <sibis@codeaurora.org>, Evan Green <evgreen@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>, Brian Norris <briannorris@chromium.org>, Venkat Gopalakrishnan <venkatg@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, May 16, 2019 at 6:53 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This is essentialy a squash of a bunch of history of cheza dt updates
> from chromium kernel, some of which were themselves squashes of history
> from older chromium kernels.
>
> I don't claim any credit other than wanting to more easily boot upstream
> kernel on cheza to have an easier way to test upstream driver work ;-)
>
> I've added below in Cc tags all the original actual authors (apologies
> if I missed any).
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sibi Sankar <sibis@codeaurora.org>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Brian Norris <briannorris@chromium.org>
> Cc: Venkat Gopalakrishnan <venkatg@codeaurora.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Updated from review comments and squashed.  I left out the the patch
> related to deleting gpu_mem/zap_shader nodes as the corresponding
> patch that adds them in sdm845.dtsi hasn't landed yet, but once it
> has we will need to revisit that patch for cheza.
>
>  arch/arm64/boot/dts/qcom/Makefile            |    3 +
>  arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts |  238 ++++
>  arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts |  238 ++++
>  arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts |  174 +++
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi   | 1326 ++++++++++++++++++
>  5 files changed, 1979 insertions(+)

Looks sane to me.  Thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
