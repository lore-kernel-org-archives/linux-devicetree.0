From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [Patch v4 2/8] media: i2c: ov2659: Fix sensor detection to
 actually fail when device is not present
Date: Fri, 27 Sep 2019 21:35:25 +0100
Message-ID: <CA+V-a8vOLaD74i2tNZVE9-+=1AfDBmhix6Lo-q1LcDN0jSDOuw@mail.gmail.com>
References: <20190927184722.31989-1-bparrot@ti.com> <20190927184722.31989-3-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927184722.31989-3-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 7:47 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Make sure that if the expected sensor device id register
> is not recognized properly the failure is propagated
> up so devices are not left partially initialized.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  drivers/media/i2c/ov2659.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 17573257097d..efbe6dc720e2 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1330,11 +1330,12 @@ static int ov2659_detect(struct v4l2_subdev *sd)
>                 unsigned short id;
>
>                 id = OV265X_ID(pid, ver);
> -               if (id != OV2659_ID)
> +               if (id != OV2659_ID) {
>                         dev_err(&client->dev,
>                                 "Sensor detection failed (%04X, %d)\n",
>                                 id, ret);
> -               else {
> +                       ret = -ENODEV;
> +               } else {
>                         dev_info(&client->dev, "Found OV%04X sensor\n", id);
>                         ret = ov2659_init(sd, 0);
>                 }
> --
> 2.17.1
>
