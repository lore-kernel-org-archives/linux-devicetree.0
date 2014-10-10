From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V4 5/7] ARM: dts: Enable Broadcom Cygnus SoC
Date: Fri, 10 Oct 2014 12:11:37 -0700
Message-ID: <54382F69.3060607@broadcom.com>
References: <1412894671-5921-6-git-send-email-sbranden@broadcom.com> <6003834.vKPhBNUdsz@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6003834.vKPhBNUdsz@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 14-10-10 03:08 AM, Arnd Bergmann wrote:
> On Thursday 09 October 2014 15:44:29 Scott Branden wrote:
>> +
>> +               lcpll: lcpll@0301d02c {
>> +                       #clock-cells = <0>;
>> +                       compatible = "brcm,cygnus-lcpll-clk";
>> +                       reg = <0x0301d02c 0x1c>;
>> +                       clocks = <&osc>;
>> +               };
>> +
>> +               genpll: genpll@0301d000 {
>> +                       #clock-cells = <0>;
>> +                       compatible = "brcm,cygnus-genpll-clk";
>> +                       reg = <0x0301d000 0x2c>,
>> +                                 <0x180AA024 0x4>,
>> +                                 <0x0301C020 0x4>;
>> +                       clocks = <&osc>;
>> +               };
>> +
>
> To be honest, I'm not too happy about the way you specify a single
> register for each clock as a global 'reg' property.
I'm not happy with this either.  Will rework.
>
> Presumably each of these registers is part of an IP block that does
> multiple things, so it would be better to start out with a binding
> for each IP block. How many of these blocks are used for clocks, and
> what do they do?
Clocks are a little scattered in the chip and don't make a lot of sense 
for easy software programming.  Will look at how to change bindings so 
they are flexible to work on other generations.
>
> 	Arnd
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
