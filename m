From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: shmobile: silk: initial device tree
Date: Tue, 03 Feb 2015 13:48:41 +0300
Message-ID: <54D0A789.5070707@cogentembedded.com>
References: <201404250239.39150.sergei.shtylyov@cogentembedded.com> <1608366.HtA9yBksdO@wasted.cogentembedded.com> <20150202110557.GC7459@leverpostej> <54CFE4CE.5090406@cogentembedded.com> <20150203003610.GA17629@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150203003610.GA17629-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 2/3/2015 3:36 AM, Simon Horman wrote:

>>>> Add the initial device tree for the R8A7794 SoC based SILK low cost board.
>>>> SCIF2 serial port support is included, so that the serial console can work.

>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

>> [...]

>>>> Index: renesas/arch/arm/boot/dts/r8a7794-silk.dts
>>>> ===================================================================
>>>> --- /dev/null
>>>> +++ renesas/arch/arm/boot/dts/r8a7794-silk.dts
>>>> @@ -0,0 +1,41 @@
>>>> +/*
>>>> + * Device Tree Source for the SILK board
>>>> + *
>>>> + * Copyright (C) 2014 Renesas Electronics Corporation
>>>> + * Copyright (C) 2014-2015 Renesas Solutions Corp.
>>>> + * Copyright (C) 2014-2015 Cogent Embedded, Inc.
>>>> + *
>>>> + * This file is licensed under the terms of the GNU General Public License
>>>> + * version 2.  This program is licensed "as is" without any warranty of any
>>>> + * kind, whether express or implied.
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +#include "r8a7794.dtsi"
>>>> +
>>>> +/ {
>>>> +	model = "SILK";

>>> Shouldn't that have a "Renesas" prefix or something like that?

>>     Historically. no SH-Mobile .dts has used the vendor name in the "model"
>> prop. I defer the decision to Simon but I think we should be at least
>> consistent.

> They are also my thoughts (except the bit about deferring to myself).

> If there is a good motivation for a Renesas prefix then that is fine by me.
> But in that case it seems that it would be appropriate to update
> the existing renesas boards too.

> The only thing that stood out to me about "SILK" was that unlike
> other renesas boards names in .dtsi files it is all-capitals.
> Its not a bit deal but as we are on the topic: is that intentional?

    Yes, it is all uppercase. See e.g. http://www.elinux.org/R-Car/Boards/SILK.

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
