From: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: drm/msm: Update bindings for MDP5
Date: Tue, 20 Oct 2015 14:17:47 -0400
Message-ID: <CAF6AEGsyN_FNXGO+SrM6SFQJA7jtCnVBjcCdYqVWgQ23-fH+ZQ@mail.gmail.com>
References: <1444997172-9308-1-git-send-email-architt@codeaurora.org>
	<CAJAp7OhSLFHAdg9POwfhFRU2NmYS8Oc-Zpn8-UCdLfpBWepbdw@mail.gmail.com>
	<56248452.6060509@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <56248452.6060509@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: Bjorn Andersson <bjorn@kryo.se>, Andy Gross <agross@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 19, 2015 at 1:49 AM, Archit Taneja <architt@codeaurora.org> wrote:
>
> On 10/18/2015 08:49 AM, Bjorn Andersson wrote:
>>
>> On Fri, Oct 16, 2015 at 5:06 AM, Archit Taneja <architt@codeaurora.org>
>> wrote:
>>>
>>> MDP5 has a different compatible string (which causes checkpatch warnings
>>> when we try to add MDP5 device nodes). It also has different list of
>>> clocks.
>>>
>>> Update the bindings for MDP5.
>>>
>>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>>> ---
>>>   Documentation/devicetree/bindings/drm/msm/mdp.txt | 23
>>> ++++++++++++++++-------
>>>   1 file changed, 16 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/drm/msm/mdp.txt
>>> b/Documentation/devicetree/bindings/drm/msm/mdp.txt
>>> index 1a0598e..e926daa 100644
>>> --- a/Documentation/devicetree/bindings/drm/msm/mdp.txt
>>> +++ b/Documentation/devicetree/bindings/drm/msm/mdp.txt
>>> @@ -3,18 +3,27 @@ Qualcomm adreno/snapdragon display controller
>>>   Required properties:
>>>   - compatible:
>>>     * "qcom,mdp" - mdp4
>>> +  * "qcom,mdss_mdp" - mdp5
>>
>>
>> Wouldn't it be better to name these "qcom,mdp4" and "qcom,mdp5" so
>> that we don't have to rely on some magic detection mechanism to
>> support future versions?
>
>
> My guess is that compatibility string "mdss_mdp" came from the
> downstream kernels. Chips having MDP4 were supported on downstream
> kernels that preceded DT.
>
> Since we don't have any MDP DT upstream, I think we could go with the
> string names you suggested. It might break things for people who might
> try to use an old downstream dts file with a new kernel. But that
> doesn't sound like the worst thing.

it would break things for downstream 3.10/mdp5 dt files..  but what
I'd suggest is to make the code look for both qcom,mdp5 and
qcom,mdss_mdp but only document the former

BR,
-R

> Archit
>
>>
>> Regards,
>> Bjorn
>>
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
