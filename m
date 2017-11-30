From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH RFC 2/2] arm64: allwinner: a64: Add Brava Keller initial support
Date: Thu, 30 Nov 2017 22:36:55 +0100
Message-ID: <CAOFm3uEdsj=qxUf3O0S0vDqgXgosvBYG6BGbf6cYn3aNreTPaQ@mail.gmail.com>
References: <1512067334-12761-1-git-send-email-jagan@amarulasolutions.com> <1512067334-12761-2-git-send-email-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512067334-12761-2-git-send-email-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagannadh.teki@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Janoff <mark@bravahome.com>, Stuart Westerman <stu@bravahome.com>, linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Jagan,

On Thu, Nov 30, 2017 at 7:42 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
[]
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-brava-keller.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-brava-keller.dts
> new file mode 100644
> index 0000000..f5303a3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-brava-keller.dts
> @@ -0,0 +1,244 @@
> +/*
> + * Copyright (C) 2017 Jagan Teki <jagan@amarulasolutions.com>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This library is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This library is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */

Rather than this long boilerplate, you might want to use the SPDX ids,
as started by Greg and documented by Thomas.
Noe that Linus wants the // comment style for the license line, and
since there is only two line left here I suggest using it for both
lines.
You can check also the recent doc patch posted by Thomas (tglx) and
comments from Linus and Greg.

So I guess you could use this:

> +// Copyright (C) 2017 Jagan Teki <jagan@amarulasolutions.com>
> +// SPDX-License-Indentifier: (GPL-2.0+ OR MIT)

NB: what you call X11 is has the MIT license id in the SPDX license list.

So you could replace 32 lines by only two lines :) it'[s neat right?

And this would also help as we have tagged already ~15K files, so it
would help to use this for new files so the amount of cleanup work
still left does not increase. Thank you for your kind consideration!

-- 
Cordially
Philippe Ombredanne
