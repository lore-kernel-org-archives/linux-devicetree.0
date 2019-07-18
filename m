From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCHv8 3/5] arm64: dts: qcom: msm8996: Add Coresight support
Date: Thu, 18 Jul 2019 09:31:00 -0600
Message-ID: <CANLsYkx9X36OJmczNK1255y8fKJfkyVq1zyQUDihqMewcU6Kxw@mail.gmail.com>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <2fa725fbc09306f1a95befc62715a708b4c0fad0.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <20190717170050.GB4271@xps15> <f28d9c8f-017c-c990-2f00-0ef5a62f3b40@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f28d9c8f-017c-c990-2f00-0ef5a62f3b40@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>
List-Id: devicetree@vger.kernel.org

On Wed, 17 Jul 2019 at 23:47, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Mathieu,
>
> On 7/17/2019 10:30 PM, Mathieu Poirier wrote:
> > On Fri, Jul 12, 2019 at 07:46:25PM +0530, Sai Prakash Ranjan wrote:
> >> From: Vivek Gautam <vivek.gautam@codeaurora.org>
> >>
> >> Enable coresight support by adding device nodes for the
> >> available source, sinks and channel blocks on msm8996.
> >>
> >> This also adds coresight cpu debug nodes.
> >>
> >> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> >> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> Acked-By: Suzuki K Poulose <suzuki.poulose@arm.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 434 ++++++++++++++++++++++++++
> >>   1 file changed, 434 insertions(+)
> >>
> >
> > We've gone trhough 8 iteration of this set and I'm still finding checkpatch
> > problems, and I'm not referring to lines over 80 characters.
> >
>
> I only get below 2 checkpatch warnings:
>
> If you are talking about the below one, then it was not added manually.
> It was taken automatically when I pulled in the v7. Should I be
> resending this patch for this?

That depends if you want David and Andy to pickup your patches - I am
sure they'll point out exactly the same thing.

>
> $ ./scripts/checkpatch.pl -g 2fa725fbc09306f1a95befc62715a708b4c0fad0
> WARNING: 'Acked-by:' is the preferred signature form
> #14:
> Acked-By: Suzuki K Poulose <suzuki.poulose@arm.com>
>
> WARNING: line over 80 characters
> #154: FILE: arch/arm64/boot/dts/qcom/msm8996.dtsi:763:
> +                       compatible = "arm,coresight-dynamic-replicator",
> "arm,primecell";
>
> total: 0 errors, 2 warnings, 440 lines checked
>
>
> -Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
