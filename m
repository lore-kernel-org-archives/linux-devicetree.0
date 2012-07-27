From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] mfd: add MAX8907 core driver
Date: Fri, 27 Jul 2012 12:06:03 +0530
Message-ID: <501236D3.3050505@nvidia.com>
References: <1343331630-27126-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1343331630-27126-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Gyungoh Yoo <jack.yoo@maxim-ic.com>, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Friday 27 July 2012 01:10 AM, Stephen Warren wrote:
> From: Gyungoh Yoo<jack.yoo@maxim-ic.com>
>

> +static int max8907_irq_set_wake(struct irq_data *data, unsigned int on)
> +{
> +       /* Everything happens in max8907_irq_sync_unlock */
> +

Probably you need to call the wake_enable of irq which goes to the cpu here.


> +       if (device_may_wakeup(chip->dev))
> +               enable_irq_wake(i2c->irq);
> +       else
> +               disable_irq(i2c->irq);

I think lets sub devices decide the wakeups rather than it is done by 
the core.


> +       max8907->i2c_rtc = i2c_new_dummy(i2c->adapter, MAX8907_RTC_I2C_ADDR);
> +       if (!max8907->i2c_rtc) {
> +               ret = -ENOMEM;
> +               goto err_dummy_rtc;
> +       }
> +       i2c_set_clientdata(max8907->i2c_rtc, max8907);
> +       max8907->regmap_rtc = devm_regmap_init_i2c(i2c,
> +&max8907_regmap_rtc_config);
the argiment should be  max8907->i2c_rtc rather than i2c here.
