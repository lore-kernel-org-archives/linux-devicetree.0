From: David Daney <ddaney.cavm@gmail.com>
Subject: Re: [PATCH 2/2] gpio/MIPS/OCTEON: Add a driver for OCTEON's on-chip
 GPIO pins.
Date: Fri, 13 Apr 2012 09:17:09 -0700
Message-ID: <4F885185.3070005@gmail.com>
References: <1334275820-7791-1-git-send-email-ddaney.cavm@gmail.com> <1334275820-7791-3-git-send-email-ddaney.cavm@gmail.com> <4F87F868.1080804@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F87F868.1080804@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <florian@openwrt.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, ralf@linux-mips.org, linux-mips@linux-mips.org, Linus Walleij <linus.walleij@stericsson.com>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/13/2012 02:56 AM, Florian Fainelli wrote:
> Hi David,
>
[...]
>> +/*
>> + * The address offset of the GPIO configuration register for a given
>> + * line.
>> + */
>> +static unsigned int bit_cfg_reg(unsigned int gpio)
>> +{
>> + if (gpio< 16)
>> + return 8 * gpio;
>> + else
>> + return 8 * (gpio - 16) + 0x100;
>> +}
>
> You could explicitely inline this one, though the compiler will
> certainly do it by itself.
>

I always let the compiler decide.


[...]
>> +
>> + if (OCTEON_IS_MODEL(OCTEON_CN66XX) ||
>> + OCTEON_IS_MODEL(OCTEON_CN61XX) ||
>> + OCTEON_IS_MODEL(OCTEON_CNF71XX))
>> + chip->ngpio = 20;
>> + else
>> + chip->ngpio = 16;
>
> What about getting the number of gpios from platform_data and/or device
> tree?
>

Actually I am thinking about just setting it to 20 unconditionally. 
Anything requesting a non-present GPIO pin is buggy to begin with.

>> +
>> + chip->direction_input = octeon_gpio_dir_in;
>> + chip->get = octeon_gpio_get;
>> + chip->direction_output = octeon_gpio_dir_out;
>> + chip->set = octeon_gpio_set;
>> + err = gpiochip_add(chip);
>> + if (err)
>> + goto out;
>> +
>> + dev_info(&pdev->dev, "version: " DRV_VERSION "\n");
>> +out:
>> + return err;
>> +}
>> +
>> +static int __exit octeon_gpio_remove(struct platform_device *pdev)
>> +{
>> + struct gpio_chip *chip = pdev->dev.platform_data;
>> + return gpiochip_remove(chip);
>> +}
>> +
>> +static struct of_device_id octeon_gpio_match[] = {
>> + {
>> + .compatible = "cavium,octeon-3860-gpio",
>> + },
>> + {},
>> +};
>> +MODULE_DEVICE_TABLE(of, octeon_mgmt_match);
>
> You are using linux/of.h definitions here but you did not include it.
> Also, there is a typo, you want octeon_gpio_match instead.
>

Good catch.  I will fix that.  There is also a section mismatch I need 
to fix.
