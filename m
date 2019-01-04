From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v8 01/10] dt-bindings: opp: Introduce qcom-opp bindings
Date: Fri, 4 Jan 2019 11:03:09 +0530
Message-ID: <5696a7ff-86ef-d751-525e-ff5e296b9b60@codeaurora.org>
References: <20181221085622.25573-1-rnayak@codeaurora.org>
 <20181221085622.25573-2-rnayak@codeaurora.org>
 <CAL_Jsq+d=38WZ90i=HbUAQvNFvH-qLJEvw_H-g8kQegdw75FZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+d=38WZ90i=HbUAQvNFvH-qLJEvw_H-g8kQegdw75FZA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, David Collins <collinsd@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 1/4/2019 12:13 AM, Rob Herring wrote:
> On Fri, Dec 21, 2018 at 2:56 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> On Qualcomm Technologies, Inc. platforms, an OPP node needs
>> to describe an additional level/corner value that is then communicated
>> to a remote microprocessor by the CPU, which then takes some
>> actions (like adjusting voltage values across various rails)
>> based on the value passed.
>>
>> Describe these bindings in the qcom-opp bindings document.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> And rescinded...
> 
> [...]
> 
>> +Required properties:
>> +- qcom,level: On Qualcomm platforms an OPP node can describe a positive value
>> +representing a corner/level that's communicated with a remote microprocessor
>> +(usually called the RPM) which then translates it into a certain voltage on
>> +a voltage rail.
> 
> Now we have Mediatek adding mtk,level...[1]
> 
> Create something common. Just 'opp-level' perhaps.

Sure Rob, I will resubmit with something more generic so it can
be used across SoC vendors.
