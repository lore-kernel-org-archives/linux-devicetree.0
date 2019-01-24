From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCHv4 1/4] arm64: dts: qcom: sdm845: Add Coresight support
Date: Thu, 24 Jan 2019 09:07:45 -0700
Message-ID: <CANLsYkyeG4mZTJbFPnAsTNpt_2OBy5JYP6g80rbmZv-F8KTrUA@mail.gmail.com>
References: <cover.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <ad16cfb9b6f5efb85149458d5f5a1abf43fa027c.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <1bd39862-0725-70ce-6535-fdb59569f683@arm.com> <75ed74af-6946-b86d-092e-42dc16e55308@codeaurora.org>
 <91a90daa-9e14-2d2e-e633-2ddfdc0955bf@arm.com> <3906faf1-abbd-9c28-ad55-ed3800f06352@codeaurora.org>
 <c03b63bf-aca8-ea46-70ad-ee4558f0319e@arm.com> <5b54c6e0-7d22-ecee-486f-31333f49f84a@codeaurora.org>
 <CANLsYkxLJS-N0V4eOHM5rfe8MXMZHQApZFsDQns+DAS7xhGCoQ@mail.gmail.com> <71ae9f41-50ff-742b-3e12-ca2ce84e0d3c@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <71ae9f41-50ff-742b-3e12-ca2ce84e0d3c@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, John Horley <john.horley@arm.com>
List-Id: devicetree@vger.kernel.org

Good day Sai,

On Wed, 23 Jan 2019 at 13:18, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Mathieu,
>
> On 1/24/2019 12:44 AM, Mathieu Poirier wrote:
> > On Wed, 23 Jan 2019 at 05:12, Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> >
> > That depends on whether the ETMs have been modified at all, something
> > Suzuki has asked to be clarified.  If ETMs have been modified then we
> > need to understand how they differ from the driver's implementation.
>
> We had asked hardware team for clarification regarding this. Let me
> poke them again. As for the driver, downstream implementation also
> uses the same driver, so I am not sure what do you mean by differing
> from the driver's implementation.

The driver has been implemented in accordance to ARM's coresight
technical reference manual and expects the HW to behave in accordance
to that specification.  Here we want to make sure the IP on your board
is conformant to the same specification.  If not then the driver needs
to be made flexible to handle both kind IPs.

>
> > If the implementations are the same:
> >
> >>
> >> @@ -1079,6 +1079,10 @@ static const struct amba_id etm4_ids[] = {
> >>           ETM4x_AMBA_ID(0x000bb95a),              /* Cortex-A72 */
> >>           ETM4x_AMBA_ID(0x000bb959),              /* Cortex-A73 */
> >>           ETM4x_AMBA_ID(0x000bb9da),              /* Cortex-A35 */
> >> +       ETM4x_AMBA_ID(0x000f0211),              /* Qualcomm Kryo */
> >> +       ETM4x_AMBA_ID(0x000f0205),              /* Qualcomm Kryo */
> >
> > What version of the Kryo CPU?  And the above will need to be in a
> > separate patch with the modifications to address the problem you
> > mentionned below.
> >
>
> There is no Kryo version for MSM8996 (its only given as Kryo), MSM8998
> onwards we have Kryo versions like Kryo 280 and so on. Hence I skipped
> for this one and added the version for SDM845.

Very well.

Mathieu

>
> >> +       ETM4x_AMBA_ID(0x000bb803),              /* Qualcomm Kryo 385
> >> Cortex-A75 */
> >> +       ETM4x_AMBA_ID(0x000bb802),              /* Qualcomm Kryo 385
> >> Cortex-A55 */
> >
> > Please add them in chronological order.
> >
>
> Sure, will do it.
>
> >>           {},
> >>    };
> >>
> >> For msm8996, cpu debug module pid returned is same as ETM
> >> which is causing the probe failure for cpu debug coresight module
> >> as shown in below logs.
> >> For this case, I tried adding these ids to cpu debug driver, but it
> >> splits some errors (coresight-cpu-debug: probe of 3840000.etm failed
> >> with error -16) since the ids are same. Can we override for this case
> >> or there is something else we can do here?
> >
> > That is another problem.  See this patchset [1] from Mike Leach for a
> > description of the problem and how to fix it.
> >
> > [1]. https://lkml.org/lkml/2018/12/7/784
> >
>
> Thanks a lot for this link. I will check this out.
>
> - Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
