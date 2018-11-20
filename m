From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [RFC PATCH] dt-bindings: opp: Extend qcom-opp bindings with
 properties needed for CPR
Date: Tue, 20 Nov 2018 09:42:05 +0530
Message-ID: <eab94dd1-1d8f-4306-cced-1e34171ef1e7@codeaurora.org>
References: <20180627045234.27403-3-rnayak@codeaurora.org>
 <20181015124749.27276-1-niklas.cassel@linaro.org>
 <20181105231745.GA25883@bogus> <20181109163917.GA6673@centauri.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109163917.GA6673@centauri.lan>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh@kernel.org>
Cc: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 11/9/2018 10:09 PM, Niklas Cassel wrote:
> On Mon, Nov 05, 2018 at 05:17:45PM -0600, Rob Herring wrote:
>> On Mon, Oct 15, 2018 at 02:47:49PM +0200, Niklas Cassel wrote:
>>> Extend qcom-opp bindings with properties needed for Core Power Reduction
>>> (CPR).
>>>
>>> CPR is included in a great variety of Qualcomm SoC, e.g. msm8916 and
>>> msm8996, and was first introduced in msm8974.
>>>
>>> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
>>> ---
>>> Hello Rob, Rajendra,
>>>
>>> Sorry for not replying sooner.
>>> Since Rob wanted the binding to be complete before merging,
>>> this is my proposal to extend the OPP binding with properties
>>> needed to support CPR (both for msm8916 and msm8996).
>>> I've discussed the proposal with Viresh, and this proposal
>>> seems better than what I previously suggested here:
>>> https://lore.kernel.org/lkml/20181005204424.GA29500@centauri.lan/
>>>
>>>   .../devicetree/bindings/opp/qcom-opp.txt      | 19 +++++++++++++++++++
>>>   1 file changed, 19 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/opp/qcom-opp.txt b/Documentation/devicetree/bindings/opp/qcom-opp.txt
>>> index db4d970c7ec7..3ab5dd84de86 100644
>>> --- a/Documentation/devicetree/bindings/opp/qcom-opp.txt
>>> +++ b/Documentation/devicetree/bindings/opp/qcom-opp.txt
>>> @@ -23,3 +23,22 @@ Required properties:
>>>   representing a corner/level that's communicated with a remote microprocessor
>>>   (usually called the RPM) which then translates it into a certain voltage on
>>>   a voltage rail.
>>
>> I've lost the context here. Please send this all together.
> 
> Will do, as soon as I've gotten your feedback on this mail.

Niklas, are you still waiting for feedback on this mail from Rob?
