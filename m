From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: drm/msm: Update bindings for MDP5
Date: Mon, 19 Oct 2015 11:19:06 +0530
Message-ID: <56248452.6060509@codeaurora.org>
References: <1444997172-9308-1-git-send-email-architt@codeaurora.org>
 <CAJAp7OhSLFHAdg9POwfhFRU2NmYS8Oc-Zpn8-UCdLfpBWepbdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJAp7OhSLFHAdg9POwfhFRU2NmYS8Oc-Zpn8-UCdLfpBWepbdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Cc: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 10/18/2015 08:49 AM, Bjorn Andersson wrote:
> On Fri, Oct 16, 2015 at 5:06 AM, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> MDP5 has a different compatible string (which causes checkpatch warnings
>> when we try to add MDP5 device nodes). It also has different list of
>> clocks.
>>
>> Update the bindings for MDP5.
>>
>> Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/drm/msm/mdp.txt | 23 ++++++++++++++++-------
>>   1 file changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/drm/msm/mdp.txt b/Documentation/devicetree/bindings/drm/msm/mdp.txt
>> index 1a0598e..e926daa 100644
>> --- a/Documentation/devicetree/bindings/drm/msm/mdp.txt
>> +++ b/Documentation/devicetree/bindings/drm/msm/mdp.txt
>> @@ -3,18 +3,27 @@ Qualcomm adreno/snapdragon display controller
>>   Required properties:
>>   - compatible:
>>     * "qcom,mdp" - mdp4
>> +  * "qcom,mdss_mdp" - mdp5
>
> Wouldn't it be better to name these "qcom,mdp4" and "qcom,mdp5" so
> that we don't have to rely on some magic detection mechanism to
> support future versions?

My guess is that compatibility string "mdss_mdp" came from the
downstream kernels. Chips having MDP4 were supported on downstream
kernels that preceded DT.

Since we don't have any MDP DT upstream, I think we could go with the
string names you suggested. It might break things for people who might
try to use an old downstream dts file with a new kernel. But that
doesn't sound like the worst thing.

Archit

>
> Regards,
> Bjorn
>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
