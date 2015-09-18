From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: Put Cygnus core components under core
 bus
Date: Fri, 18 Sep 2015 14:57:15 -0700
Message-ID: <55FC88BB.2000608@broadcom.com>
References: <1442611454-16331-1-git-send-email-rjui@broadcom.com>
 <1442611454-16331-5-git-send-email-rjui@broadcom.com>
 <1472876.fGCm1r9KFG@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472876.fGCm1r9KFG@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 9/18/2015 2:30 PM, Arnd Bergmann wrote:
> On Friday 18 September 2015 14:24:09 Ray Jui wrote:
>>
>> +       core {
>> +               compatible = "simple-bus";
>> +               ranges;
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +
>> +               timer@19020200 {
>> +                       compatible = "arm,cortex-a9-global-timer";
>> +                       reg = <0x19020200 0x100>;
>> +                       interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks = <&periph_clk>;
>> +               };
>> +
>> +               gic: interrupt-controller@19021000 {
>>
> 
> Could it be that all 'core' components are in the 0x19xxxxxx address range?
> If so, please set up an appropriate ranges property for the bus. Also
> add the address field for the bus according to which addresses are routed
> to it.
> 
> 	Arnd
> 

Yes all 'core' components are in the 0x19xxxxx address range for Cygnus.
It's fine and makes sense to set up proper ranges for this bus. But I
might have some issues with the 'soc' components and the 'soc' bus,
which I'll explain and discuss on the next email.

Ray
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
