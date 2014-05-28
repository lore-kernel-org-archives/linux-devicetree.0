From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] DT early console initialization
Date: Wed, 28 May 2014 11:30:04 -0500
Message-ID: <CAL_JsqK9nifPWW5jnzYifsMuvRjhD9wTT+YbE0sPM6N4xaj1yA@mail.gmail.com>
References: <1399587823-17701-1-git-send-email-robherring2@gmail.com>
	<20140514142644.1C922C4153D@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140514142644.1C922C4153D-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 14, 2014 at 9:26 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu,  8 May 2014 17:23:37 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> This series adds support for early serial console initialization using
>> DT. This enables determining the serial port type and address using the
>> FDT and allows enabling the console before platform specific
>> initialization runs. I've tested this on arm64. ARM support is dependent
>> on adding fixmap support.
>>
>> Currently, the earlycon is only enabled if "earlycon" is present on the
>> kernel command line. The FDT needs to have /chosen/stdout-path set to
>> the path of the serial port.
>>
>> This series is dependent on generic earlycon[1], libfdt support[2], and
>> vmlinux.lds.h clean-ups[3]. The first 2 are in linux-next already. A git
>> branch is available here:
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git earlycon-dt
>
> Nice. For the whole series:
>
> Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> I haven't tested it though.
>>
>> Rob
>>
>> [1] https://lkml.org/lkml/2014/4/18/573
>> [2] https://lkml.org/lkml/2014/4/22/1202
>> [3] https://lkml.org/lkml/2014/3/27/285
>>
>> Rob Herring (6):
>>   of: align RESERVEDMEM_OF_DECLARE function callbacks to other callbacks
>>   of: consolidate linker section OF match table declarations
>>   serial: earlycon: add DT support
>>   of/fdt: add FDT address translation support
>>   of/fdt: add FDT serial scanning for earlycon
>>   tty/serial: pl011: add DT based earlycon support

Greg, I plan to take this series thru the DT tree for 3.16 unless you
have any objections. It has dependencies on both the tty-next and the
DT trees.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
