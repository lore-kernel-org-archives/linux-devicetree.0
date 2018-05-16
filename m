From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 4/4] rtc: ds1307: add frequency_test_enable sysfs
 attribute to check tick on m41txx
Date: Wed, 16 May 2018 23:22:24 +0300
Message-ID: <CAHp75VdC74jW+Vox2ogDVzG17Z3kD0Vg-1du4SeK30WajT7N-Q@mail.gmail.com>
References: <20180516103251.74707-1-giulio.benetti@micronovasrl.com> <20180516103251.74707-4-giulio.benetti@micronovasrl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180516103251.74707-4-giulio.benetti@micronovasrl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Giulio Benetti <giulio.benetti@micronovasrl.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, alexandre.belloni@bootlin.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 16, 2018 at 1:32 PM, Giulio Benetti
<giulio.benetti@micronovasrl.com> wrote:
> On m41txx you can enable open-drain OUT pin to check if offset is ok.
> Enabling OUT pin with frequency_test_enable attribute, OUT pin will tick
> 512 times faster than 1s tick base.
>
> Enable or Disable FT bit on CONTROL register if freq_test is 1 or 0.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

> +static ssize_t frequency_test_enable_store(struct device *dev,
> +                                          struct device_attribute *attr,
> +                                          const char *buf, size_t count)
> +{
> +       struct ds1307 *ds1307 = dev_get_drvdata(dev);
> +       unsigned long freq_test = 0;
> +       int retval;
> +
> +       retval = kstrtoul(buf, 10, &freq_test);
> +       if ((retval < 0) || (retval > 1)) {

kstrtobool() then?

> +               dev_err(dev, "Failed to store RTC Frequency Test attribute\n");

> +               return -EINVAL;

...and do not shadow actual error code.

> +       }
> +
> +       regmap_update_bits(ds1307->regmap, M41TXX_REG_CONTROL, M41TXX_BIT_FT,
> +                          freq_test ? M41TXX_BIT_FT : 0);
> +

> +       return retval ? retval : count;

Does the condition make any sense?

> +}

> +static ssize_t frequency_test_enable_show(struct device *dev,
> +                                         struct device_attribute *attr,
> +                                         char *buf)
> +{

> +       int freq_test_en = 0;

> +       if (ctrl_reg & M41TXX_BIT_FT)
> +               freq_test_en = true;
> +       else
> +               freq_test_en = false;
> +
> +       return sprintf(buf, "%d\n", freq_test_en);

So, is it boolean or integer? This code makes it confusing a lot.

> +}

-- 
With Best Regards,
Andy Shevchenko
