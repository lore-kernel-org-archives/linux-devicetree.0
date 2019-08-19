From: Richard Tresidder <rtresidd@electromag.com.au>
Subject: Re: [PATCH 1/1] dt-bindings: power/supply/sbs_sbs-battery: Addition
 of force_load binding Add device tree binding documentation for addition of
 force_load boolean value to allow loading a battery during boot even if not
 present at that time.
Date: Mon, 19 Aug 2019 11:33:03 +0800
Message-ID: <1baa2fe9-7649-f70a-9076-5b49464ae1cd@electromag.com.au>
References: <1564037445-22936-1-git-send-email-rtresidd@electromag.com.au>
 <20190816211430.GA8175@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190816211430.GA8175@bogus>
Content-Language: en-AU
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: sre@kernel.org, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There is a force load option when loading the driver as a module.
This adds the equivalent methodology for the binding path.
Though I suppose you could in fact just force load if the gpio detect 
isn't present.
Thats a good idea, just wasn't the existing driver flow. I can't think 
of any reason why we couldn't do that though.

I'll update the patch and resubmit V3
Will add a note about it in the docs

Please note I'd submitted this incorrectly when using our patch script 
last time, it's now correctly part of the combined patch

Regards
   Richard Tresidder
Richard Tresidder


**
On 17/08/2019 5:14 am, Rob Herring wrote:
> On Thu, Jul 25, 2019 at 02:50:45PM +0800, Richard Tresidder wrote:
>> Signed-off-by: Richard Tresidder <rtresidd@electromag.com.au>
>> ---
>>
>> Notes:
>>      Add device tree binding documentation for addition of force_load
>>      boolean value to allow loading a battery during boot even if not
>>      present at that time.
>>      Accompanying patch to drivers/power/supply/sbs-battery.c submitted to linux-pm@vger.kernel.org
>>
>>   Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt b/Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt
>> index 4e78e51..187d7bb 100644
>> --- a/Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt
>> +++ b/Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt
>> @@ -15,7 +15,8 @@ Optional properties :
>>      after an external change notification.
>>    - sbs,battery-detect-gpios : The gpio which signals battery detection and
>>      a flag specifying its polarity.
>> -
>> + - sbs,force-load : Allow loading of a hot-pluggable battery when there is no
>> +   GPIO detect available and the module is statically built.
> What's a module? That's Linux specific and nothing to do with the
> binding.
>
> Can't you just force load if sbs,battery-detect-gpios is not present?
>
> Rob
>
>
