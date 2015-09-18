From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: clean up Cygnus DT files
Date: Thu, 17 Sep 2015 18:20:36 -0700
Message-ID: <55FB66E4.8010006@broadcom.com>
References: <1442534282-21356-1-git-send-email-rjui@broadcom.com>
 <1442534282-21356-2-git-send-email-rjui@broadcom.com>
 <55FB65E0.50407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55FB65E0.50407-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 9/17/2015 6:16 PM, Florian Fainelli wrote:
> On 17/09/15 16:57, Ray Jui wrote:
>> This patch cleans up Cygnus DT files and makes the format consistent
>> with the rest of Broadcom iProc based SoCs.
>>
>> Changes include:
>>     - Put core components into "core" node of type "simple-bus"
>>     - Put all other peripherals into "soc" node of type "simple-bus"
>>     - Move aliases into bcm-cygnus.dtsi to avoid duplications in all dts
>>       files
>>     - Ordered all device nodes under buses based on their base register
>>       addresses
>>     - Remove unused PCI I/O resource
>>     - Use label instead of full path to reference device nodes in dts
>>       files
> 
> I am fine with the changes per-se, but the review is made largely more
> difficult because you mix multiple changes at the same time, this really
> ought to be separate patches to ease the review process. Sorry for not
> picking that up earlier.

Sure! I'll break them up into individual patches as follows:
- Put core components into "core" node of type "simple-bus"
- Put all other peripherals into "soc" node of type "simple-bus"
- Move aliases into bcm-cygnus.dtsi to avoid duplications in all dts files
- Ordered all device nodes under buses based on their base register
addresses
- Remove unused PCI I/O resources
- Use label instead of full path to reference device nodes in dts files

Thanks!

Ray
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
