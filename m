From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH] rtc: add mxc driver for i.MX53
Date: Thu, 30 Nov 2017 15:00:09 +0100
Message-ID: <CAOFm3uHAXKr7KiFeyvYb77jot8M_4rH-cqt2Ze3AbnOiZ_wiwg@mail.gmail.com>
References: <20171128073927.12035-1-linux-kernel-dev@beckhoff.com>
 <20171129221114.GV21126@piout.net> <CAOFm3uFb8Jo9detD2CziuYt_DH_ohYD9P=uvqHugKDxpN+xvAQ@mail.gmail.com>
 <3BB206AB2B1BD448954845CE6FF69A8E01CB531330@NT-Mail07.beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3BB206AB2B1BD448954845CE6FF69A8E01CB531330-vUij6NSodOcSOXk/eDA+lhuDmiLEvxRJ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Patrick_Br=C3=BCnn?= <P.Bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-dev <linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Juergen Borleis <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, moderated list:ARM/FREESCALE IMX / MXC ARM ARCHIT
List-Id: devicetree@vger.kernel.org

On Thu, Nov 30, 2017 at 2:36 PM, Patrick Br=C3=BCnn <P.Bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>=
 wrote:
>>From: Philippe Ombredanne [mailto:pombredanne-od1rfyK75/E@public.gmane.org]
>>Sent: Donnerstag, 30. November 2017 09:18
>>>
>>>> +/*
>>>> + * Copyright (C) 2004-2011 Freescale Semiconductor, Inc. All Rights
>>Reserved.
>>>> + */
>>>> +
>>>> +/*
>>>> + * The code contained herein is licensed under the GNU General Public
>>>> + * License. You may obtain a copy of the GNU General Public License
>>>> + * Version 2 or later at the following locations:
>>>> + *
>>>> + * http://www.opensource.org/licenses/gpl-license.html
>>>> + * http://www.gnu.org/copyleft/gpl.html
>>>> + */
>>
>>Exactly!
>>And while you are it , you could replace the boilerplate license text
>>with the SPDX id.
>>--
>
> How would a perfect header look like?
> Looking at :
> git show b24413180f5600bcb3bb70fbed5cf186b60864bd -- drivers/
> and:
> git grep SPDX -- Documentation/
>
> it could be:
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2004-2011 Freescale Semiconductor, Inc. All Rights
> + */
> or:
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2004-2011 Freescale Semiconductor, Inc. All Rights
> + */
>
> Personally I would prefer:
> +/*
> + * Copyright (C) 2004-2011 Freescale Semiconductor, Inc. All Rights
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */
>
> So, is there any guideline?
>
> To be clear: I don't want to waste anyone's time on this. But as SPDX
> was intended for automation, I think it might be good to try having
> some common pattern here.
> I don't want to start a discussion, so in case there is no guideline I wi=
ll
> just take the /* SPDX */ in firstline version.

Patrick:

There are several threads on the topic explaining why: Linus made it
clear that he wants this, and on the first line:

> +// SPDX-License-Identifier: GPL-2.0


Thomas:
I tend to prefer as Linus pointed the // style throughout when there
is only a license and copyright involved. Here this would mean:

> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2004-2011 Freescale Semiconductor, Inc. All Rights Rese=
rved.

What's you take since you wrote the doc for this? And is there still
some updates needed for this since your last patch set?


Patrick:
Side note a trailing  "All Rights Reserved." in a copyright statement
is never needed, even though customarily cargo culted by everyone,
including me.
Started in 1910, it become fully obsolete in 2000 thanks to Nicaragua
[1] signing the Berne convention.

[1] https://en.wikipedia.org/wiki/All_rights_reserved
--=20
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
