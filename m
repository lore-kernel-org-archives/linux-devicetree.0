From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH v3 2/2] regulator: add QCOM RPMh regulator driver
Date: Thu, 17 May 2018 17:16:18 -0700
Message-ID: <8847014e-4d27-b47a-8dc1-5b4a35123ce6@codeaurora.org>
References: <cover.1526088081.git.collinsd@codeaurora.org>
 <3a4195365ab0d252fdf064d2300f45b9b777991c.1526088081.git.collinsd@codeaurora.org>
 <CAD=FV=UiZEFTAtO9C0UbRO=ow5=dv6zNG-XMqhHm1Fmp2GwVcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=UiZEFTAtO9C0UbRO=ow5=dv6zNG-XMqhHm1Fmp2GwVcA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>
List-Id: devicetree@vger.kernel.org

On 05/17/2018 02:23 PM, Doug Anderson wrote:
> On Fri, May 11, 2018 at 7:28 PM, David Collins <collinsd@codeaurora.org> wrote:
>> +                       /*
>> +                        * Default the voltage selector to an error value in the
>> +                        * case that qcom,regulator-initial-microvolt is not
>> +                        * specified in device tree since the true voltage is
>> +                        * not known.  Note that this value causes
>> +                        * devm_regulator_register() to fail in the case that
>> +                        * regulator-min-microvolt and regulator-max-microvolt
>> +                        * are specified in device tree due to
>> +                        * machine_constraints_voltage() bailing when the
>> +                        * get_voltage_sel() callback returns this error value.
>> +                        */
>> +                       vreg->voltage_selector = -EINVAL;
> 
> As per comments in other threads, adjust this comment and use
> -ENOTRECOVERABLE now.

I'll make this change.

Take care,
David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
