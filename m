From: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/1] npcm750: add fixed clocks (moved from drivers/clk/clk-npcm7xx.c)
Date: Thu, 15 Feb 2018 14:50:26 -0800
Message-ID: <CAFd5g44BZjZtCoOurtvwn6TuPzYPt6hN4+8CaSfdmU1E3qAXBw@mail.gmail.com>
References: <1518702115-22990-1-git-send-email-tali.perry1@gmail.com> <1518702115-22990-2-git-send-email-tali.perry1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518702115-22990-2-git-send-email-tali.perry1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tali Perry <tali.perry1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Nancy Yuen <yuenn-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 15, 2018 at 5:41 AM, Tali Perry <tali.perry1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Signed-off-by: Tali Perry <tali.perry1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>

First off, this patchset should probably be combined with "[PATCH v2 0/1] clk:
npcm: add NPCM7xx clock driver":
https://www.spinics.net/lists/devicetree/msg215082.html

> ---
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi | 1223 ++++++++++++++++++++++++++++++++
>  1 file changed, 1223 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> new file mode 100644
> index 000000000000..107d901c06f2
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi

This file is already added in "[PATCH v10 2/3] arm: dts: add Nuvoton NPCM750
device tree": https://www.spinics.net/lists/arm-kernel/msg634281.html . You
should base this patchset on that patchset since this depends on it.

> @@ -0,0 +1,1223 @@
> +/*
> + * DTSi file for the NPCM750 SoC
> + *
> + * Copyright (c) 2014-2017 Nuvoton Technology corporation.
> + *
> + * Released under the GPLv2 only.
> + * SPDX-License-Identifier: GPL-2.0
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
<snip>

Cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
