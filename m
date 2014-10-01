From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] tty/serial: Add Spreadtrum's serial earlycon
Date: Wed, 1 Oct 2014 08:55:39 -0500
Message-ID: <CAL_JsqK78usBOE0UxSjyzN3VMrkP43uOuYz=yZM_wsaS2YDarA@mail.gmail.com>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com>
 <1411992293-7729-6-git-send-email-zhang.lyra@gmail.com> <3038755.G9Y3LOUCHH@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3038755.G9Y3LOUCHH@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "chunyan.zhang" <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 29, 2014 at 8:36 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 29 September 2014 20:04:52 zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: "chunyan.zhang" <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>>
>> Adds earlycon support for the Spreadtrum's serial.
>>
>> Signed-off-by: chunyan.zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>> ---
>>  drivers/tty/serial/Kconfig             |   12 ++++++
>>  drivers/tty/serial/Makefile            |    1 +
>>  drivers/tty/serial/serial_sprd_early.c |   64 ++++++++++++++++++++++++++++++++
>>  3 files changed, 77 insertions(+)
>>  create mode 100644 drivers/tty/serial/serial_sprd_early.c
>>
>> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
>> index 26cec64..ede16e6 100644
>> --- a/drivers/tty/serial/Kconfig
>> +++ b/drivers/tty/serial/Kconfig
>> @@ -85,6 +85,18 @@ config SERIAL_EARLYCON_ARM_SEMIHOST
>>         with "earlycon=smh" on the kernel command line. The console is
>>         enabled when early_param is processed.
>>
>> +config SERIAL_EARLYCON_SPRD
>> +     bool "Early console using SPRD serial"
>> +     depends on ARM64
>> +     select SERIAL_CORE
>> +     select SERIAL_CORE_CONSOLE
>> +     select SERIAL_EARLYCON
>> +     help
>
> I assume you will later want to have a proper device driver for
> this hardware, so it would be better to make the Kconfig symbol
> and the file name what you are going to use in the long run, but
> for now only have the earlycon support included.
>
>
>> +static int __init serial_sprd_early_console_setup(
>> +                             struct earlycon_device *device,
>> +                             const char *opt)
>> +{
>> +     if (!device->port.membase)
>> +             return -ENODEV;
>> +
>> +     device->con->write = serial_sprd_early_write;
>> +     return 0;
>> +}
>> +EARLYCON_DECLARE(serial_sprd, serial_sprd_early_console_setup);
>> +OF_EARLYCON_DECLARE(serial_sprd, "sprd,serial",
>> +                 serial_sprd_early_console_setup);
>>
>
> I think you should drop the EARLYCON_DECLARE() line, using
> OF_EARLYCON_DECLARE should be enough.

No, I've been telling people to put both in. The reason is you may
have a bootloader or boot files (e.g PXELINUX) that only allows
changing changing the command line or you want to override/extend the
command line in the kernel.

I'm thinking the declaration should be combined into one to do both
since I'm getting tired of making this comment.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
