From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [Patch v3 0/5] Introduce keystone reset driver
Date: Tue, 20 May 2014 21:27:48 +0200
Message-ID: <10992709.10WgsOixXr@wuerfel>
References: <1400495155-11136-1-git-send-email-ivan.khoronzhuk@ti.com> <537B5D5D.8030106@ti.com> <537BA06B.5060200@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537BA06B.5060200-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, w-kwok2-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 20 May 2014 21:35:23 Ivan Khoronzhuk wrote:
> Thank for the note.
> 
> Ok.
> 
> Memory map:
> [00 02310000 - 00 023101FF] size=512 PLL Controller
> [00 02620000 - 00 02620FFF] size=4K device state control registers
> 
> I'll define in DT two new syscon compatible nodes like:
> 
>          pllctrl: pll_controller {
>              compatible = "syscon";
>              reg = <0x2310000 0x200>;
>          };
> 
>          devctrl: device_state_control {
>              compatible = "syscon";
>              reg = <0x2620000 0x1000>;
>          };

Please add a well-defined compatible-string in addition to "syscon" as
well.

> then correct reset-controller node like:
> 
>          rstctrl: reset-controller {
>              compatible = "ti,keystone-reset";
>              reg = <0xE4 0x10>, <0x328 0x10>;
>              reg-names = "pllregs", "muxregs";
>              syscon1 = <&pllctrl>;
>              syscon2 = <&devctrl>;
>              ti,wdt_list = <0>;
>          };

You can't really use the "reg" property to refer to syscon
registers, but you can make up your own property for that,
or put the register numbers into the syscon1/2 properties,
or just hardcode the offsets in the driver.

> And correct reset-controller code to get regmap by phandle,
> then access registers by regmap.
> 
> Also I'll post two separate patches that add syscon nodes in question.

Sounds good, thanks!

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
