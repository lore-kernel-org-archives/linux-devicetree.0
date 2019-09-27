From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [Patch v4 7/8] media: i2c: ov2659: Fix missing 720p register config
Date: Fri, 27 Sep 2019 21:36:41 +0100
Message-ID: <CA+V-a8vY8pV8L2_JHM-AE=3h03arEtmxVhW_vh6r17pb2X3obA@mail.gmail.com>
References: <20190927184722.31989-1-bparrot@ti.com> <20190927184722.31989-8-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927184722.31989-8-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 7:47 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> The initial registers sequence is only loaded at probe
> time. Afterward only the resolution and format specific
> register are modified. Care must be taken to make sure
> registers modified by one resolution setting are reverted
> back when another resolution is programmed.
>
> This was not done properly for the 720p case.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/ov2659.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 7d0baa386644..720310e0725d 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -412,10 +412,14 @@ static struct sensor_register ov2659_720p[] = {
>         { REG_TIMING_YINC, 0x11 },
>         { REG_TIMING_VERT_FORMAT, 0x80 },
>         { REG_TIMING_HORIZ_FORMAT, 0x00 },
> +       { 0x370a, 0x12 },
>         { 0x3a03, 0xe8 },
>         { 0x3a09, 0x6f },
>         { 0x3a0b, 0x5d },
>         { 0x3a15, 0x9a },
> +       { REG_VFIFO_READ_START_H, 0x00 },
> +       { REG_VFIFO_READ_START_L, 0x80 },
> +       { REG_ISP_CTRL02, 0x00 },
>         { REG_NULL, 0x00 },
>  };
>
> --
> 2.17.1
>
