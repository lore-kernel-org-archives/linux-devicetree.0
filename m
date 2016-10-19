From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [RFC V3 PATCH] dt-bindings: qcom: Add msm899(2/4) bindings
Date: Tue, 18 Oct 2016 18:13:47 -0700
Message-ID: <7cb31205-009c-d833-b26c-7438af417021@codeaurora.org>
References: <20161009012847.GG18158@rob-hp-laptop>
 <1476147156-4474-1-git-send-email-jeremymc@redhat.com>
 <20161011164207.GT7509@tuxbot>
 <ab018442-c929-e328-11a3-6e7fd21e56b8@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <ab018442-c929-e328-11a3-6e7fd21e56b8@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeremy McNicoll <jmcnicol@redhat.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

On 10/11/2016 02:25 PM, Jeremy McNicoll wrote:
> On 2016-10-11 9:42 AM, Bjorn Andersson wrote:
>> On Mon 10 Oct 17:52 PDT 2016, Jeremy McNicoll wrote:
>>
>>> From: Jeremy McNicoll <jmcnicol@redhat.com>
>>>
>>> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
>>> ---
>>> V2->V3:
>>>    Added 8994 and 8994v2
>>>
>>>
>>>  Documentation/devicetree/bindings/arm/qcom.txt | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.txt
>>> b/Documentation/devicetree/bindings/arm/qcom.txt
>>> index 3e24518..a473989 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.txt
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.txt
>>> @@ -22,6 +22,9 @@ The 'SoC' element must be one of the following
>>> strings:
>>>      msm8916
>>>      msm8974
>>>      msm8996
>>> +    msm8992
>>> +    msm8994
>>
>> Please keep these sorted.
>>
>>> +    msm8994v2
>>
>> What's different with v2? Why do we list it here?
>>
>
> I'll have to defer to QC folks on this one.

I don't think we need to put versions in here. Just plain SoC numbers
please.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
