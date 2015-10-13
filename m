From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: Add new boards to bcm4708 DT bindings
Date: Tue, 13 Oct 2015 15:37:49 -0700
Message-ID: <561D87BD.5030405@gmail.com>
References: <1443824564-17291-1-git-send-email-jonmason@broadcom.com> <1443824564-17291-2-git-send-email-jonmason@broadcom.com> <561923BC.5040906@hauke-m.de> <20151013214051.GN12512@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151013214051.GN12512-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13/10/15 14:40, Jon Mason wrote:
> On Sat, Oct 10, 2015 at 04:42:04PM +0200, Hauke Mehrtens wrote:
>> On 10/03/2015 12:22 AM, Jon Mason wrote:
>>> Add the 4708, 4709, and 953012k SVKs to the the documentation for the
>>> Broadcom Northstar device tree bindings.
>>>
>>> Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
>>> index 6b0f49f..bdf4c06 100644
>>> --- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
>>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
>>
>> What should be documented in this file? This is more a question to the
>> guys more familiar with arm in Linux. Currently the Linux kernel only
>> supports brcm,bcm4708 and all goes back to that one.
> 
> I was under the impression that all boards should be added to these
> files.  We have been doing so for Cygnus and NSP.

Tracking exactly which boards are supported by the brcm,bcm4708
compatible string might be tedious, I tend to agree with just listing
the supported SoCs, and leaving the specific board compatibles to the
individual DTS files instead.

> 
> Thanks,
> Jon
> 
>>
>>> @@ -5,4 +5,11 @@ Boards with the BCM4708 SoC shall have the following properties:
>>>  
>>>  Required root node property:
>>>  
>>> +bcm94709
>>>  compatible = "brcm,bcm4708";
>>> +
>>> +bcm94709
>>> +compatible = "brcm,bcm4709", "brcm,bcm4708";
>>> +
>>> +bcm953012k
>>> +compatible = "brcm,bcm5301k", "brcm,bcm4708";
>>>
>>


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
