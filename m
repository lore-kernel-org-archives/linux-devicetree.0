From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: bcm5301x: Add BCM SVK DT files
Date: Tue, 13 Oct 2015 15:43:20 -0700
Message-ID: <561D8908.2060803@broadcom.com>
References: <1443824564-17291-1-git-send-email-jonmason@broadcom.com>
 <56192304.1050500@hauke-m.de> <20151013213818.GM12512@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151013213818.GM12512-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 10/13/2015 2:38 PM, Jon Mason wrote:
> On Sat, Oct 10, 2015 at 04:39:00PM +0200, Hauke Mehrtens wrote:
>> On 10/03/2015 12:22 AM, Jon Mason wrote:
>>> Add device tree files for Broadcom Northstar based SVKs.  Since the
>>> bcm5301x.dtsi already exists, all that is necessary is the dts files to
>>> enable the UARTs (and specify the RAM size for the 4708/9).  With these
>>> files, the SVKs are able to boot to shell.
>>>
>>> Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/Makefile       |  5 +++-
>>>  arch/arm/boot/dts/bcm94708.dts   | 52 +++++++++++++++++++++++++++++++++++
>>>  arch/arm/boot/dts/bcm94709.dts   | 52 +++++++++++++++++++++++++++++++++++
>>>  arch/arm/boot/dts/bcm953012k.dts | 59 ++++++++++++++++++++++++++++++++++++++++
>>>  4 files changed, 167 insertions(+), 1 deletion(-)
>>>  create mode 100644 arch/arm/boot/dts/bcm94708.dts
>>>  create mode 100644 arch/arm/boot/dts/bcm94709.dts
>>>  create mode 100644 arch/arm/boot/dts/bcm953012k.dts
>>>

>>> +&uart0 {
>>> +	clock-frequency = <62499840>;
>>
>> Just out of curiosity on what does this clock frequency depend? I saw
>> your patch adding a real clock driver which should make this obsolete.
>  
> Better to add this now, as the device tree part might be out of sync
> for a time.

Sure, this can potentially be a reason to not using the real clock node
and just use a hardcoded clock frequency for now, until the other clock
change is merged, then you can submit another patch to use it.

Also, is it not better to make the UARTs a static clock
> and not dependent on the clk driver?
> 

I disagree. You should always use the real clock driver for querying the
clock frequency, in the case when the clock driver is available.

Today one can change the core clock for UART in the bootloader for
various reasons (and we saw that happening a lot in the past), which in
this case will make your kernel not seeing any console output.

By always querying the clock rate based on real registers instead of a
hardcoded value, you don't have that issue and your kernel is less
dependent on any changes in the bootloader.

> Thanks,
> Jon
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
