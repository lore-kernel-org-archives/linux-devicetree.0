From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH v2 1/1] clk: npcm7xx: add clock controler. fixed clock at DT
Date: Fri, 16 Feb 2018 13:27:44 +0100
Message-ID: <CAOFm3uHCkv893H_y-fJthNiW0=wO23ddCkZKBdfeiOOF0GAE_Q@mail.gmail.com>
References: <1518701454-22697-1-git-send-email-tali.perry1@gmail.com> <1518701454-22697-2-git-send-email-tali.perry1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518701454-22697-2-git-send-email-tali.perry1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tali Perry <tali.perry1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Tali,

On Thu, Feb 15, 2018 at 2:30 PM, Tali Perry <tali.perry1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> --- /dev/null
> +++ b/drivers/clk/clk-npcm7xx.c
> @@ -0,0 +1,759 @@
> +/*
> + * Nuvoton NPCM7xx Clock Generator
> + * All the clocks are initialized by the bootloader, so this driver allow only
> + * reading of current settings directly from the hardware.
> + *
> + * Copyright (C) 2018 Nuvoton Technologies tali.perry-KrzQf0k3Iz9BDgjK7y7TUQ@public.gmane.org
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + * Released under the GPLv2 only.
> + */

Thank you for using the SPDX tags! but this can be streamlined a bit per [1]

The correct way would come out as this: (note the tag placement and
comment style and the removal of the now redundant unstructured
notice)

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NPCM7xx Clock Generator
> + * All the clocks are initialized by the bootloader, so this driver allow only
> + * reading of current settings directly from the hardware.
> + *
> + * Copyright (C) 2018 Nuvoton Technologies tali.perry-KrzQf0k3Iz9BDgjK7y7TUQ@public.gmane.org
> + */

And yes you may be surprised by the use of C++ style comment for
this... This has been discussed on list and is what Linus prefers.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/license-rules.rst
-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
