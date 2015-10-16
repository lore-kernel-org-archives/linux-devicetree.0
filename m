From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add new SoCs to bcm4708 DT bindings
Date: Fri, 16 Oct 2015 15:39:11 -0700
Message-ID: <56217C8F.8090003@broadcom.com>
References: <1444947856-26246-1-git-send-email-jonmason@broadcom.com>
 <56216F39.3020400@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56216F39.3020400-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 15-10-16 02:42 PM, Hauke Mehrtens wrote:
> On 10/16/2015 12:24 AM, Jon Mason wrote:
>> Add the 4708, 4709, and 53012 SoCs to the the documentation for the
>> Broadcom Northstar device tree bindings.
>>
>> Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Acked-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Acked-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

>
>> ---
>>   Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
>> index 6b0f49f..8608a77 100644
>> --- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
>> @@ -5,4 +5,11 @@ Boards with the BCM4708 SoC shall have the following properties:
>>
>>   Required root node property:
>>
>> +bcm4708
>>   compatible = "brcm,bcm4708";
>> +
>> +bcm4709
>> +compatible = "brcm,bcm4709";
>> +
>> +bcm53012
>> +compatible = "brcm,bcm53012";
>>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
