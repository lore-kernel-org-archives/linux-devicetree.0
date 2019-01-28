From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCHv4 1/4] arm64: dts: qcom: sdm845: Add Coresight support
Date: Mon, 28 Jan 2019 10:15:08 -0700
Message-ID: <CANLsYkxkTTfTMNNZZ1tmS=cjakcfveMDrW6wxXPXie8M9_VDOg@mail.gmail.com>
References: <cover.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <ad16cfb9b6f5efb85149458d5f5a1abf43fa027c.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <1bd39862-0725-70ce-6535-fdb59569f683@arm.com> <75ed74af-6946-b86d-092e-42dc16e55308@codeaurora.org>
 <91a90daa-9e14-2d2e-e633-2ddfdc0955bf@arm.com> <3906faf1-abbd-9c28-ad55-ed3800f06352@codeaurora.org>
 <c03b63bf-aca8-ea46-70ad-ee4558f0319e@arm.com> <5b54c6e0-7d22-ecee-486f-31333f49f84a@codeaurora.org>
 <18b70426-60fe-4871-6388-6e09fd5feb37@arm.com> <de6e021a-4f9a-8e2e-dff0-1e7c61ad8b2b@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <de6e021a-4f9a-8e2e-dff0-1e7c61ad8b2b@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, John Horley <John.Horley@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, 24 Jan 2019 at 11:21, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Suzuki,
>
> On 1/24/2019 4:49 PM, Suzuki K Poulose wrote:
> > Hi Sai,
> >
> >
> > That looks fine with me. But as Mathieu said, this needs to be a separate
> > patch. But before all that please could you provide me the PIDR4 value for
> > the Kryo A75 and A55 please ?
> >
>
> Sure.
>
> PIDR4 value is 0x4.
>
> I get it now. So we are looking for JEP106 identification(PIDR1[7:4] and
> PIDR2[2:0]) and continuation code(PIDR4[3:0]).
>
>  From ARM Coresight Spec:
>
> DES_0, PIDR1 bits[7:4] JEP106 identification code bits[3:0].
> DES_1, PIDR2 bits[2:0] JEP106 identification code bits[6:4].
> DES_2, PIDR4 bits[3:0] JEP106 continuation code.
>
> For SDM845(A75 based):
>
> *0xB_B8_03* does indicate that the JEP106 identification
> code is 0x3B and continuation code is 0x4 which is of ARM and not
> QCOM(JEP106 ID is 0x70) which is expected.
>
> And the other values of PIDR0[0:7] and PIDR1[3:0] are *Implementation
> defined part numbers* and can be different from ARM A75/A55.
>
> I think this clears up case for SDM845.
>
> As for MSM8996, it is not based on any ARM derivative and hence the
> JEP106 ID is of QCOM(0x70) from the value of pid = *0xF_02_11*
> based on PIDR1[7:4] and PIDR2[2:0]. This clears this as well.
>
> Please correct me if I am wrong and also let me know if I can
> continue with PID addition to table.

Please proceed.

>
> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
