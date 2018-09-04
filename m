From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: Add reg-names for all tsens nodes
Date: Tue, 4 Sep 2018 16:42:31 -0700
Message-ID: <CAD=FV=WoQnSLj0RvrKfjgJCKkDKrEnKG2F5XQxQjFaJbhH1gjQ@mail.gmail.com>
References: <cover.1535462942.git.amit.kucheria@linaro.org>
 <c49d9f13b3d6849604ae3eb00a92b80948ef1534.1535462942.git.amit.kucheria@linaro.org>
 <20180903203405.GT3456@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903203405.GT3456@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>, Siddartha Mohanadoss <smohanad@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Matthias Kaehlcke <mka@chromium.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Sep 3, 2018 at 1:34 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Tue 28 Aug 06:38 PDT 2018, Amit Kucheria wrote:
>
>> Instead of showing up as thermal-sensor@<addr>, the nodes will show up as
>> tsens0_tm, tsen1_tm, tsens1_srot, etc. in /proc/iomem making it easier to
>> read.
>>
>> IOW,
>>
>> 0c222000-0c2221fe : thermal-sensor@c263000
>> 0c223000-0c2231fe : thermal-sensor@c265000
>> 0c263000-0c2631fe : thermal-sensor@c263000
>> 0c265000-0c2651fe : thermal-sensor@c265000
>>
>> becomes
>>
>> 0c222000-0c2221fe : tsens0_srot
>> 0c223000-0c2231fe : tsens1_srot
>> 0c263000-0c2631fe : tsens0_tm
>> 0c265000-0c2651fe : tsens1_tm
>>
>> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>>  arch/arm/boot/dts/qcom-msm8974.dtsi   | 1 +
>>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
>>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 ++
>>  arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 ++
>>  4 files changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
>> index 3c4b81c29798..64c9f81ddd90 100644
>> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
>> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
>> @@ -431,6 +431,7 @@
>>                       compatible = "qcom,msm8974-tsens";
>>                       reg = <0xfc4a9000 0x1000>, /* TM */
>>                             <0xfc4a8000 0x1000>; /* SROT */
>> +                     reg-names = "tsens_tm", "tsens_srot";
>
> While the iomem output seems more convenient this way, these register
> names are a contract between the DT binding and the particular tsens
> instance.
>
> As such this is a good idea, but with the names should not include the
> instance information. They should be "tm", "srot".

Rob Herring doesn't seem to think so.  As per
<http://lkml.kernel.org/r/CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com>

I said:

> From what you're saying the _only_ reason you'd ever want to use
> reg-names is if there is an optional register range.  Is that right?

Rob said:

> IMO, yes.

It sounds like Rob won't NAK a change that adds reg-names if there is
more than one reg, but in general he's not a fan.  I'd vote to keep
things consistent with Rob's worldview and just drop this change.


-Doug
