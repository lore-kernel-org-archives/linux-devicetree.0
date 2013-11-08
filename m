From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] Documentation/mfd: Fix typos in s2mps11.txt
Date: Fri, 8 Nov 2013 16:50:09 +0530
Message-ID: <CAK9yfHwOPrMn-OTOBP8Efdw6sMFaoU8yQpQqV3o1+=Ffdryv=g@mail.gmail.com>
References: <1383634640-26869-1-git-send-email-sachin.kamat@linaro.org>
	<20131108102853.GV30901@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131108102853.GV30901@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8 November 2013 15:58, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> As this is only a trivial patch, I'll take it out the hands of the
> already overloaded DT maintainers.
>
>> Fixed trivial typos to improve readability.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/s2mps11.txt |    9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
>> index c9332c6..0ff4e65 100644
>> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
>> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
>> @@ -1,10 +1,10 @@
>>
>>  * Samsung S2MPS11 Voltage and Current Regulator
>>
>> -The Samsung S2MP211 is a multi-function device which includes voltage and
>> +The Samsung S2MPS11 is a multi-function device which includes voltage and
>
> Nice catch eagle-eye!

:)

>
>>  current regulators, RTC, charger controller and other sub-blocks. It is
>> -interfaced to the host controller using a I2C interface. Each sub-block is
>> -addressed by the host system using different I2C slave address.
>> +interfaced to the host controller using an I2C interface. Each sub-block is
>> +addressed by the host system using different I2C slave addresses.
>>
>>  Required properties:
>>  - compatible: Should be "samsung,s2mps11-pmic".
>> @@ -43,7 +43,8 @@ sub-node should be of the format as listed below.
>>
>>   BUCK[2/3/4/6] supports disabling ramp delay on hardware, so explictly
>>   regulator-ramp-delay = <0> can be used for them to disable ramp delay.
>> - In absence of regulator-ramp-delay property, default ramp delay will be used.
>> + In the absence of regulator-ramp-delay property, default ramp delay will
>> + be used.
>
> So if we're being pertinacity here, your correction isn't much better.
>
> s/of regulator-ramp-delay property,/of {the,an} regulator-ramp-delay property, the

I like this one :)
>
> or
>
> s/of regulator-ramp-delay property,/of regulator-ramp-delay, the

-- 
With warm regards,
Sachin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
