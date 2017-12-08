From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH v8 2/2] media: i2c: Add the ov7740 image sensor driver
Date: Fri, 8 Dec 2017 14:14:44 +0100
Message-ID: <CAOFm3uFASPpuMtGSetcYME0pQEmuzoLqY=Yhv5aaFu5AzJwaew@mail.gmail.com>
References: <20171208015542.15444-1-wenyou.yang@microchip.com> <20171208015542.15444-3-wenyou.yang@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171208015542.15444-3-wenyou.yang@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wenyou Yang <wenyou.yang@microchip.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, LKML <linux-kernel@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, Jonathan Corbet <corbet@lwn.net>, Hans Verkuil <hverkuil@xs4all.nl>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Songjun Wu <songjun.wu@microchip.com>
List-Id: devicetree@vger.kernel.org

Wenyou,

On Fri, Dec 8, 2017 at 2:55 AM, Wenyou Yang <wenyou.yang@microchip.com> wrote:
> The ov7740 (color) image sensor is a high performance VGA CMOS
> image snesor, which supports for output formats: RAW RGB and YUV
> and image sizes: VGA, and QVGA, CIF and any size smaller.
>
> Signed-off-by: Songjun Wu <songjun.wu@microchip.com>
> Signed-off-by: Wenyou Yang <wenyou.yang@microchip.com>
[]
> --- /dev/null
> +++ b/drivers/media/i2c/ov7740.c
> @@ -0,0 +1,1226 @@
> +/*
> + * Copyright (c) 2017 Microchip Corporation.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License version
> + * 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + */

Have you considered using the new SPDX ids instead of this fine legalese?
e.g.:

// SPDX-License-Identifier: GPL-2.0
// Copyright (c) 2017 Microchip Corporation.

Short and neat! Check also Thomas doc patches and Linus comments on
why he prefers the C++ comment style for these.

-- 
Cordially
Philippe Ombredanne
