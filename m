Return-Path: <SRS0=mSv1=PQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35565 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbfAHPkq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 8 Jan 2019 10:40:46 -0500
MIME-Version: 1.0
References: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com> <1546959110-19445-9-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1546959110-19445-9-git-send-email-akinobu.mita@gmail.com>
From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Wed, 9 Jan 2019 00:40:33 +0900
Message-ID: <CAC5umyhkAQdKY9PHiZR61UKUu8a8J2V4SrVZ0hu8LC3JeZQjeA@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] media: mt9m001: remove remaining soc_camera
 specific code
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

2019=E5=B9=B41=E6=9C=888=E6=97=A5(=E7=81=AB) 23:52 Akinobu Mita <akinobu.mi=
ta@gmail.com>:
>
> Remove remaining soc_camera specific code and drop soc_camera dependency
> from this driver.
>
> Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
> * No changes from v1
>
>  drivers/media/i2c/Kconfig   |  2 +-
>  drivers/media/i2c/mt9m001.c | 84 ++++++++-------------------------------=
------
>  2 files changed, 15 insertions(+), 71 deletions(-)
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index ee3ef1b..bc248d9 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -859,7 +859,7 @@ config VIDEO_VS6624
>
>  config VIDEO_MT9M001
>         tristate "mt9m001 support"
> -       depends on SOC_CAMERA && I2C
> +       depends on I2C && VIDEO_V4L2
>         help
>           This driver supports MT9M001 cameras from Micron, monochrome
>           and colour models.
> diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> index 1619c8c..0f5e3f9 100644
> --- a/drivers/media/i2c/mt9m001.c
> +++ b/drivers/media/i2c/mt9m001.c
> @@ -15,15 +15,12 @@
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
>
> -#include <media/drv-intf/soc_mediabus.h>
> -#include <media/soc_camera.h>
>  #include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
>  #include <media/v4l2-subdev.h>
>
>  /*
>   * mt9m001 i2c address 0x5d
> - * The platform has to define struct i2c_board_info objects and link to =
them
> - * from struct soc_camera_host_desc
>   */
>
>  /* mt9m001 selected register addresses */
> @@ -276,11 +273,15 @@ static int mt9m001_set_selection(struct v4l2_subdev=
 *sd,
>         rect.width =3D ALIGN(rect.width, 2);
>         rect.left =3D ALIGN(rect.left, 2);
>
> -       soc_camera_limit_side(&rect.left, &rect.width,
> -                    MT9M001_COLUMN_SKIP, MT9M001_MIN_WIDTH, MT9M001_MAX_=
WIDTH);
> +       rect.width =3D clamp_t(u32, rect.width, MT9M001_MIN_WIDTH,
> +                       MT9M001_MAX_WIDTH);
> +       rect.left =3D clamp_t(u32, rect.left, MT9M001_COLUMN_SKIP,
> +                       MT9M001_COLUMN_SKIP + MT9M001_MAX_WIDTH - rect.wi=
dth);
>
> -       soc_camera_limit_side(&rect.top, &rect.height,
> -                    MT9M001_ROW_SKIP, MT9M001_MIN_HEIGHT, MT9M001_MAX_HE=
IGHT);
> +       rect.height =3D clamp_t(u32, rect.height, MT9M001_MIN_HEIGHT,
> +                       MT9M001_MAX_HEIGHT);
> +       rect.top =3D clamp_t(u32, rect.top, MT9M001_ROW_SKIP,
> +                       MT9M001_ROW_SKIP + MT9M001_MAX_HEIGHT - rect.widt=
h);

Oops.  This line isn't correct. s/rect.width/rect.height/
