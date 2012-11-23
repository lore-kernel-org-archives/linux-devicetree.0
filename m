From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH 2/7] mfd: max8925: fix mfd device register failure
Date: Fri, 23 Nov 2012 16:41:56 +0800
Message-ID: <CAN1soZyGVaASo2zakxr9EgMdSqVvQyVt0bLDOmFNmN9+NhXWUg@mail.gmail.com>
References: <1352187498-9754-1-git-send-email-qingx@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1352187498-9754-1-git-send-email-qingx@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qing Xu <qingx@marvell.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, cxie4@marvell.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 6, 2012 at 3:38 PM, Qing Xu <qingx@marvell.com> wrote:
> From: Qing Xu <qingx@marvell.com>
>
> we encounter rtc/power/touch driver registry failure, root cause
> it is resources confilict in insert_resouce, solved by changing
> mfd_add_devices 5th parameter to NULL
>
Since resources are not used in power/rtc driver and touch driver
isn't implemented,
it's OK to avoid use resources. Please remove those resources in
max8925-core.c also.


> Signed-off-by: Qing Xu <qingx@marvell.com>
> ---
>  drivers/mfd/max8925-core.c |   22 ++++++++++------------
>  1 files changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mfd/max8925-core.c b/drivers/mfd/max8925-core.c
> index dcc218a..b1eacae 100644
> --- a/drivers/mfd/max8925-core.c
> +++ b/drivers/mfd/max8925-core.c
> @@ -873,7 +873,7 @@ int __devinit max8925_device_init(struct max8925_chip *chip,
>
>         ret = mfd_add_devices(chip->dev, 0, &rtc_devs[0],
>                               ARRAY_SIZE(rtc_devs),
> -                             &rtc_resources[0], chip->irq_base, NULL);
> +                             NULL, chip->irq_base, NULL);
>         if (ret < 0) {
>                 dev_err(chip->dev, "Failed to add rtc subdev\n");
>                 goto out;
> @@ -881,7 +881,7 @@ int __devinit max8925_device_init(struct max8925_chip *chip,
>
>         ret = mfd_add_devices(chip->dev, 0, &onkey_devs[0],
>                               ARRAY_SIZE(onkey_devs),
> -                             &onkey_resources[0], 0, NULL);
> +                             NULL, 0, NULL);
>         if (ret < 0) {
>                 dev_err(chip->dev, "Failed to add onkey subdev\n");
>                 goto out_dev;
> @@ -900,21 +900,19 @@ int __devinit max8925_device_init(struct max8925_chip *chip,
>                 goto out_dev;
>         }
>
> -       if (pdata && pdata->power) {
> -               ret = mfd_add_devices(chip->dev, 0, &power_devs[0],
> -                                       ARRAY_SIZE(power_devs),
> -                                       &power_supply_resources[0], 0, NULL);
> -               if (ret < 0) {
> -                       dev_err(chip->dev, "Failed to add power supply "
> -                               "subdev\n");
> -                       goto out_dev;
> -               }
> +       ret = mfd_add_devices(chip->dev, 0, &power_devs[0],
> +                               ARRAY_SIZE(power_devs),
> +                               NULL, 0, NULL);
> +       if (ret < 0) {
> +               dev_err(chip->dev, "Failed to add power supply "
> +                       "subdev, err = %d\n", ret);
> +               goto out_dev;
>         }
>
>         if (pdata && pdata->touch) {
>                 ret = mfd_add_devices(chip->dev, 0, &touch_devs[0],
>                                       ARRAY_SIZE(touch_devs),
> -                                     &touch_resources[0], 0, NULL);
> +                                     NULL, chip->tsc_irq_base, NULL);
>                 if (ret < 0) {
>                         dev_err(chip->dev, "Failed to add touch subdev\n");
>                         goto out_dev;
> --
> 1.7.0.4
>
