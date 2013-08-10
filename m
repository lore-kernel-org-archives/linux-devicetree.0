Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:45215 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754335Ab3HJTMV (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 10 Aug 2013 15:12:21 -0400
Received: by mail-lb0-f175.google.com with SMTP id 13so3957588lba.34
        for <devicetree@vger.kernel.org>; Sat, 10 Aug 2013 12:12:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0A09DA0F-86B4-4961-88E2-64FA0A4D380D@codeaurora.org>
References: <1375128719-23642-1-git-send-email-galak@codeaurora.org>
 <E9700EA7-7154-46C5-9258-03F030DF69F6@codeaurora.org> <20130729214035.GC8868@codeaurora.org>
 <9EB1A821-7137-4812-B58A-20F669BCA7DD@codeaurora.org> <0A09DA0F-86B4-4961-88E2-64FA0A4D380D@codeaurora.org>
From: Ohad Ben-Cohen <ohad@wizery.com>
Date: Sat, 10 Aug 2013 22:11:56 +0300
Message-ID: <CAK=WgbZSJmMz_U56ZsppBrB64XvTHBqJM4L+uFY1kKxhMCCtMQ@mail.gmail.com>
Subject: Re: [PATCH] hwspinlock/msm: Add support for Qualcomm MSM HW Mutex block
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@secretlab.ca>
Cc: "linux-kernel@vger.kernel.org list" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Eric Holmberg <eholmber@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

+ Grant

On Thu, Aug 1, 2013 at 5:10 PM, Kumar Gala <galak@codeaurora.org> wrote:
>> On Jul 29, 2013, at 4:40 PM, Stephen Boyd wrote:
>>> On 07/29, Kumar Gala wrote:
>>>>> diff --git a/Documentation/devicetree/bindings/arm/msm/tcsr-mutex.txt b/Documentation/devicetree/bindings/arm/msm/tcsr-mutex.txt
>>>>> new file mode 100644
>>>>> index 0000000..ddd6889
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/arm/msm/tcsr-mutex.txt
>>>
>>> Maybe this should go under a new hwspinlock directory?
>>
>> Will look for Ohad to comment on this.
>>
>>>
>>>>> @@ -0,0 +1,20 @@
>>>>> +Qualcomm MSM Hardware Mutex Block:
>>>>> +
>>>>> +The hardware block provides mutexes utilized between different processors
>>>>> +on the SoC as part of the communication protocol used by these processors.
>>>>> +
>>>>> +Required properties:
>>>>> +- compatible: should be "qcom,tcsr-mutex"
>>>>> +- reg: Should contain registers location and length of mutex registers
>>>>> +- reg-names:
>>>>> +  "mutex-base"  - string to identify mutex registers
>>>>> +- qcom,num-locks: the number of locks/mutexes supported
>>>>> +
>>>>> +Example:
>>>>> +
>>>>> +  qcom,tcsr-mutex@fd484000 {
>>>
>>> Maybe it should be hw-mutex@fd484000?
>>
>> again, will look for Ohad to make some comment on this.
>>
>>>>> +          compatible = "qcom,tcsr-mutex";
>>>>> +          reg = <0xfd484000 0x1000>;
>>>>> +          reg-names = "mutex-base";
>>>>> +          qcom,num-locks = <32>;
>>>>> +  };
>
> Ohad, ping.

I'd prefer a DT maintainer to take a look at your two open questions
above, especially if I'm to merge a new file into the devicetree
Documentation folder.

Grant, any chance you have a moment to take a look?

Otherwise, Stephen - do we have your Ack here? I was happy to see your
review but not sure what's the latest status.

Thanks,
Ohad.
