From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [Patch v4 3/8] media: i2c: ov2659: Cleanup include file list
Date: Fri, 27 Sep 2019 21:35:51 +0100
Message-ID: <CA+V-a8tYwWfgngkTKnpA85byqMkxERFrG7_w+pbzTDvKVpPf-g@mail.gmail.com>
References: <20190927184722.31989-1-bparrot@ti.com> <20190927184722.31989-4-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927184722.31989-4-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 7:47 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Several of include files listed are not explicitly needed.
> If they are need then they are implicitly included.
>
> Reduce the list of includes to an easier to manage list.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/ov2659.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index efbe6dc720e2..f77320e8a60d 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -22,29 +22,15 @@
>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> -#include <linux/err.h>
> -#include <linux/init.h>
> -#include <linux/interrupt.h>
> -#include <linux/io.h>
>  #include <linux/i2c.h>
> -#include <linux/kernel.h>
> -#include <linux/media.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
>  #include <linux/of_graph.h>
> -#include <linux/slab.h>
> -#include <linux/uaccess.h>
> -#include <linux/videodev2.h>
>
> -#include <media/media-entity.h>
>  #include <media/i2c/ov2659.h>
> -#include <media/v4l2-common.h>
>  #include <media/v4l2-ctrls.h>
> -#include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-image-sizes.h>
> -#include <media/v4l2-mediabus.h>
>  #include <media/v4l2-subdev.h>
>
>  #define DRIVER_NAME "ov2659"
> --
> 2.17.1
>
