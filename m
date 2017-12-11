From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH v2 2/2] drm/tinydrm: add driver for ST7735R panels
Date: Mon, 11 Dec 2017 10:06:50 +0100
Message-ID: <CAOFm3uFbumvd8rPBochjdeG3zzyshq9HiprgRHcDOLokhTcHwA@mail.gmail.com>
References: <1512943833-31352-1-git-send-email-david@lechnology.com> <1512943833-31352-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512943833-31352-3-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, limor@ladyada.net, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

David,

On Sun, Dec 10, 2017 at 11:10 PM, David Lechner <david@lechnology.com> wrote:
> This adds a new driver for Sitronix ST7735R display panels.
>
> This has been tested using an Adafruit 1.8" TFT.
>
> Signed-off-by: David Lechner <david@lechnology.com>
> --- /dev/null
> +++ b/drivers/gpu/drm/tinydrm/st7735r.c
> @@ -0,0 +1,219 @@
> +/*
> + * DRM driver for Sitronix ST7735R panels
> + *
> + * Copyright 2017 David Lechner <david@lechnology.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */

Have you considered using the new SPDX ids? Check the doc patches from
Thomas for details.

This could come out this way if you are using the C++ comment style
all the way, a style that you should at least use for the license id
as requested and commented by Linus:

> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2017 David Lechner <david@lechnology.com>
> +// DRM driver for Sitronix ST7735R panels

-- 
Cordially
Philippe Ombredanne
