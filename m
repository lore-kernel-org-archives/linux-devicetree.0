From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH 2/2] gpio/MIPS/OCTEON: Add a driver for OCTEON's on-chip
 GPIO pins.
Date: Sun, 15 Apr 2012 17:21:05 +0200
Message-ID: <4F8AE761.6000205@openwrt.org>
References: <1334275820-7791-1-git-send-email-ddaney.cavm@gmail.com> <1334275820-7791-3-git-send-email-ddaney.cavm@gmail.com> <4F87F868.1080804@openwrt.org> <4F885185.3070005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F885185.3070005@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, ralf@linux-mips.org, linux-mips@linux-mips.org, Linus Walleij <linus.walleij@stericsson.com>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 13/04/2012 18:17, David Daney a =C3=A9crit :
> On 04/13/2012 02:56 AM, Florian Fainelli wrote:
>> Hi David,
>>
> [...]
>>> +/*
>>> + * The address offset of the GPIO configuration register for a giv=
en
>>> + * line.
>>> + */
>>> +static unsigned int bit_cfg_reg(unsigned int gpio)
>>> +{
>>> + if (gpio< 16)
>>> + return 8 * gpio;
>>> + else
>>> + return 8 * (gpio - 16) + 0x100;
>>> +}
>>
>> You could explicitely inline this one, though the compiler will
>> certainly do it by itself.
>>
>
> I always let the compiler decide.
>
>
> [...]
>>> +
>>> + if (OCTEON_IS_MODEL(OCTEON_CN66XX) ||
>>> + OCTEON_IS_MODEL(OCTEON_CN61XX) ||
>>> + OCTEON_IS_MODEL(OCTEON_CNF71XX))
>>> + chip->ngpio =3D 20;
>>> + else
>>> + chip->ngpio =3D 16;
>>
>> What about getting the number of gpios from platform_data and/or dev=
ice
>> tree?
>>
>
> Actually I am thinking about just setting it to 20 unconditionally.
> Anything requesting a non-present GPIO pin is buggy to begin with.

Since it is exposed by the sysfs entry ngpio, you can consider it being=
=20
part of the ABI, and it can be used by an user to query the number of=20
gpios available, and will also serve as the maximum number of gpios for=
=20
gpiolib internally, it is certainly best to make it match what the=20
hardware can actually do.

>
>>> +
>>> + chip->direction_input =3D octeon_gpio_dir_in;
>>> + chip->get =3D octeon_gpio_get;
>>> + chip->direction_output =3D octeon_gpio_dir_out;
>>> + chip->set =3D octeon_gpio_set;
>>> + err =3D gpiochip_add(chip);
>>> + if (err)
>>> + goto out;
>>> +
>>> + dev_info(&pdev->dev, "version: " DRV_VERSION "\n");
>>> +out:
>>> + return err;
>>> +}
>>> +
>>> +static int __exit octeon_gpio_remove(struct platform_device *pdev)
>>> +{
>>> + struct gpio_chip *chip =3D pdev->dev.platform_data;
>>> + return gpiochip_remove(chip);
>>> +}
>>> +
>>> +static struct of_device_id octeon_gpio_match[] =3D {
>>> + {
>>> + .compatible =3D "cavium,octeon-3860-gpio",
>>> + },
>>> + {},
>>> +};
>>> +MODULE_DEVICE_TABLE(of, octeon_mgmt_match);
>>
>> You are using linux/of.h definitions here but you did not include it=
=2E
>> Also, there is a typo, you want octeon_gpio_match instead.
>>
>
> Good catch. I will fix that. There is also a section mismatch I need =
to
> fix.
