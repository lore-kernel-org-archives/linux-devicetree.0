From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/9] ARM: dts: consolidate aliases for Cygnus dt files
Date: Fri, 18 Sep 2015 14:44:54 -0700
Message-ID: <55FC85D6.7050506@broadcom.com>
References: <1442611454-16331-1-git-send-email-rjui@broadcom.com>
 <1442611454-16331-2-git-send-email-rjui@broadcom.com>
 <25764744.UdkoAR05y0@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <25764744.UdkoAR05y0@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 9/18/2015 2:27 PM, Arnd Bergmann wrote:
> On Friday 18 September 2015 14:24:06 Ray Jui wrote:
>> Move aliases into bcm-cygnus.dtsi to avoid duplications in Cygnus dts
>> files
>>
> 
> We generally recommend keeping them separate:
> 
>> diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
>> index e1ac07a..30903ba 100644
>> --- a/arch/arm/boot/dts/bcm-cygnus.dtsi
>> +++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
>> @@ -40,6 +40,10 @@
>>         model = "Broadcom Cygnus SoC";
>>         interrupt-parent = <&gic>;
>>  
>> +       aliases {
>> +               serial0 = &uart3;
>> +       };
>> +
> 
> The SoC has at least four uarts according to this, so it seems unlikely that
> each board really only uses only the fourth one of them and labels it '0'
> on the board. As soon as you get one board that has more than one uart wired
> up, you would need to undo this.
> 
> 	Arnd
> 

I think Scott might have explained this in the past. uart3 is going to
be used on all Cygnus boards (including all future boards) because the
bootrom was designed to use uart3 as console and that won't change.

Let me know if you still think I need to move this back to the dts.

Thanks,

Ray
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
