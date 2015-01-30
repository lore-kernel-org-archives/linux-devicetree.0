From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: gcc-msm8960: add child devices support.
Date: Fri, 30 Jan 2015 14:03:50 -0800
Message-ID: <54CBFFC6.9080302@codeaurora.org>
References: <1422613004-29802-1-git-send-email-srinivas.kandagatla@linaro.org>	<1422613060-29886-1-git-send-email-srinivas.kandagatla@linaro.org>	<CAJAp7Oi_nxEyBZ0bTaQr6d-8sy8M4dFLJxOWCrniX6Pd9+_AGQ@mail.gmail.com>	<54CBC82D.2050003@linaro.org>	<54CBF4B4.6080208@codeaurora.org> <CAJAp7Og5eJkKVoaizNd4MxY9SK3kAg8=4rxS3Gm0iYeQKk8vUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAJAp7Og5eJkKVoaizNd4MxY9SK3kAg8=4rxS3Gm0iYeQKk8vUA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Mike Turquette <mturquette@linaro.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>, nrajan@codeaurora.com, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 01/30/15 14:00, Bjorn Andersson wrote:
> On Fri, Jan 30, 2015 at 1:16 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> On 01/30/15 10:06, Srinivas Kandagatla wrote:
> [..]
>>> Stephen Any comments?
>> I don't understand any of this. We should be making a specific tsens
>> device directly in the gcc driver probe and not doing any sort of
>> of_platform_populate(). This is what I had, but it probably could be
>> done better so that we can assign the struct device's of_node pointer
>> before registering on the platform bus.
>>
>>         platform_device_register_data(&pdev->dev, "tsens8960-tm", -1,
>>                         &pdev->dev.of_node, sizeof(&pdev->dev.of_node));
>>
>> Then if we need to add any properties like #sensor-cells or coefficients
>> the tsens driver can use the same of_node that gcc is using.
>>
> That makes sense and the dt will describe the hardware nicely, but how
> do you get access to the register space from the tsens driver?
>
> Will dev_get_regmap(pdev->dev.parent, NULL); find the mmio regmap of
> gcc perhaps?
>

Yes that's the plan. We'll have to do slightly different stuff for 8974
where tsens is split out from gcc into its own space. That should still
be easy enough though by checking the of_node against some compatible
string.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
