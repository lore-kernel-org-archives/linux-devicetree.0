From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH v16 0/5] ZII RAVE platform driver
Date: Wed, 20 Dec 2017 22:51:12 +0100
Message-ID: <CAOFm3uHLT5R6SLYpRApFOOh4_=qrhc234EKfk1n-_3AGzgN9RA@mail.gmail.com>
References: <20171220204517.28313-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220204517.28313-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Andrey,

On Wed, Dec 20, 2017 at 9:45 PM, Andrey Smirnov
<andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Everyone:
>
> This patch series is v16 of the driver for supervisory processor found
> on RAVE series of devices from ZII. Supervisory processor is a PIC
> microcontroller connected to various electrical subsystems on RAVE
> devices whose firmware implements protocol to command/qery them.
>
> NOTE:
>
>  * This driver dependends on crc_ccitt_false(), added by
>    2da9378d531f8cc6670c7497f20d936b706ab80b in 'linux-next', the patch
>    was pulled in by Andrew Morton and is currently avaiting users, so
>    this series might have to go in through Andrew's tree
>
> Changes since [v15]:
>
>     - Adopted SPDX tags for licensing information per Philippe's
>       request

Thank you for using the SPDX tags: you have my cheerful ack for the
SPDX tags for the whole patch set

There is one minor problem though: your comment style for the SPDX tag
lines. Check Thomas doc patches and Linus comments on this topic: you
should use // C++ style commnent in .c files and /* */ C-style
comments in .h files.

e.g. do not use this for a .c file:

> +++ b/drivers/watchdog/rave-sp-wdt.c
> @@ -0,0 +1,337 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

But this instead:

> +++ b/drivers/watchdog/rave-sp-wdt.c
> @@ -0,0 +1,337 @@
> +// SPDX-License-Identifier: GPL-2.0+


Acked-by: Philippe Ombredanne <pombredanne-kIH2VFuay/A@public.gmane.org>

-- 
Cordially
Philippe
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
