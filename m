From: Lyra Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] arm64: Add DTS support for Spreadtrum's Shark64 SoC
Date: Wed, 15 Oct 2014 11:17:07 +0800
Message-ID: <CAAfSe-tPynLarYRzsTw3vncp8CB0EnoaR_Z6tPQNA7DEV7+w9Q@mail.gmail.com>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com>
	<1411992293-7729-3-git-send-email-zhang.lyra@gmail.com>
	<4004425.NZAxCnE0qr@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4004425.NZAxCnE0qr@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Ramkumar Ramachandra <artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Orson Zhai <orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, "zhizhou.zhang" <zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "chunyan.zhang" <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Arnd

2014-09-29 21:47 GMT+08:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Monday 29 September 2014 20:04:49 zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> +
>> +/memreserve/ 0x80000000 0x00010000;
>
> Maybe add a comment explaining why it is reserved?
>
>> +     chosen {
>> +             bootargs = "earlycon=serial_sprd,0x70000000";
>> +      };
>
> Just remove this for now, the command line should really be set by the
> boot loader, not hardcoded in the dts file.
>
> IIRC, the earlycon=... syntax is not recommended on DT based systems,
> better use the "stdout-path" syntax instead.
>

I have tried to use  "stdout-path" instead of "bootargs= "earlycon=
..." like below :

/ {
     ...

     chosen {
             stdout-path = "/serial@70000000";
      };

     uart0: serial@70000000 {
             status="okay";
     };
      ...
};

But then there is nothing output information on serial console.(I have
been testing in Fast Model)


I saw the below code in init/main.c

/* Check for early params. */
static int __init do_early_param(char *param, char *val, const char *unused)
{
const struct obs_kernel_param *p;

for (p = __setup_start; p < __setup_end; p++) {
if ((p->early && parameq(param, p->str)) ||
   (strcmp(param, "console") == 0 &&
    strcmp(p->str, "earlycon") == 0)
) {
if (p->setup_func(val) != 0)
pr_warn("Malformed early option '%s'\n", param);
}
}
/* We accept everything at this stage. */
return 0;
}

And I saw a patch from Grant Likely, he had a comment in it :
"If the devicetree specifies a serial port as a stdout device, then the
kernel can use it as the default console if nothing else was selected on
the command line. For any serial port that uses the uart_add_one_port()
feature, the uart_add_one_port() has all the information needed to
automatically enable the console device, which is what this patch does."

So, I guess that the reason why I can't see any output information on
console after using "stdout-path" instead of "earlycon" is that I
haven't a driver of Spreadtrum's serial, and dose not use  the
uart_add_one_port() feature.

I don't know is correct what I guess.

Could you give me some suggestions to solve this problem?

Thanks,
Chunyan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
