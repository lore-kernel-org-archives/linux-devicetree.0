From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH RESEND 1/4] dt-bindings: add SMP enable-method for
 Broadcom NSP
Date: Thu, 5 Nov 2015 12:57:15 -0800
Message-ID: <563BC2AB.6030204@broadcom.com>
References: <1446702681-45339-1-git-send-email-kapilh@broadcom.com>
 <1446702681-45339-2-git-send-email-kapilh@broadcom.com>
 <20151105204825.GA19314@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151105204825.GA19314@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 15-11-05 12:48 PM, Rob Herring wrote:
> On Thu, Nov 05, 2015 at 12:51:18AM -0500, Kapil Hali wrote:
>> Add a compatible string "brcm,bcm-nsp-smp" for Broadcom's
>> Northstar Plus CPU to the 32-bit ARM CPU device tree binding
>> documentation file and create a new binding documentation for
>> Northstar Plus CPU pen-release mechanism.
>>
>> Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>   .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 36 ++++++++++++++++++++++
>>   Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>>   2 files changed, 37 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>> new file mode 100644
>> index 0000000..8506da7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>> @@ -0,0 +1,36 @@
>> +Broadcom Northstar Plus SoC CPU Enable Method
>> +---------------------------------------------
>> +This binding defines the enable method used for starting secondary
>> +CPUs in the following Broadcom SoCs:
>> +  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM88312
>> +
>> +The enable method is specified by defining the following required
>> +properties in the "cpus" device tree node:
>> +  - enable-method = "brcm,bcm-nsp-smp";
>
> This is supposed to be per core.
>
>> +  - secondary-boot-reg = <...>;
>
> What happens with more than 2 cores?
>
I'm pretty sure nothing - all of these SoCs have 1 or 2 cores.

Regards,
Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
