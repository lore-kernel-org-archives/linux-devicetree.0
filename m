From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 6/8] Documentation: bindings: add compatible specific
 to legacy SCPI protocol
Date: Thu, 10 Nov 2016 10:26:50 +0000
Message-ID: <14e563ae-36c5-4bf9-0d51-3b07830de3db@arm.com>
References: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
 <1478148731-11712-7-git-send-email-sudeep.holla@arm.com>
 <20161110012249.ed56ik6kdffoikym@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161110012249.ed56ik6kdffoikym@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10/11/16 01:22, Rob Herring wrote:
> On Wed, Nov 02, 2016 at 10:52:09PM -0600, Sudeep Holla wrote:
>> This patch adds specific compatible to support legacy SCPI protocol.
>>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/arm,scpi.txt | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
>> index d1882c4540d0..ebd03fc93135 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,scpi.txt
>> +++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
>> @@ -7,7 +7,9 @@ by Linux to initiate various system control and power operations.
>>
>>  Required properties:
>>
>> -- compatible : should be "arm,scpi"
>> +- compatible : should be
>> +	* "arm,scpi" : For implementations complying to SCPI v1.0 or above
>> +	* "arm,legacy-scpi" : For implementations complying pre SCPI v1.0
>
> I'd prefer that we explicitly enumerate the old versions. Are there
> many?
>

I understand your concern, but this legacy SCPI protocol was not
officially released. It was just WIP which vendors picked up from very
early releases. Since they are not numbered, it's hard to have specific
compatibles with different versions until v1.0. That's one of the reason
to retain platform specific compatible so that we can add any quirks
based on them if needed.

I will probably add these information in the commit log so that it's
clear why we can't do version based compatible.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
