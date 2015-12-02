From: Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH 2/2] reset: bcm63xx: Add support for the BCM63xx
 soft-reset controller
Date: Wed, 2 Dec 2015 20:43:49 +0000
Message-ID: <565F5805.6010506@simon.arlott.org.uk>
References: <565CB83B.7010000@simon.arlott.org.uk>
 <565CB86F.4040303@simon.arlott.org.uk>
 <CAGVrzcbjdsbGLuH6T6DSoC5SGN5WDFdM1h1xB5nQyX8wm-Esow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGVrzcbjdsbGLuH6T6DSoC5SGN5WDFdM1h1xB5nQyX8wm-Esow@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Cernekee <cernekee@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, MIPS Mailing List <linux-mips@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: devicetree@vger.kernel.org

On 02/12/15 18:03, Florian Fainelli wrote:
> 2015-11-30 12:58 GMT-08:00 Simon Arlott <simon@fire.lp0.eu>:
>> The BCM63xx contains a soft-reset controller activated by setting
>> a bit (that must previously have cleared).
>>
>> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
>> ---
>>  MAINTAINERS                   |   1 +
>>  drivers/reset/Kconfig         |   9 +++
>>  drivers/reset/Makefile        |   1 +
>>  drivers/reset/reset-bcm63xx.c | 134 ++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 145 insertions(+)
>>  create mode 100644 drivers/reset/reset-bcm63xx.c
> 
> 
> Could you create a bcm directory and then add your reset-bcm63xx.c
> file there? I have a pending submission for the BCM63138 reset
> controller which is not at all using the same structure and will share
> nothing with your driver.
> 

Ok, I'll call it reset-bcm6345.c to avoid confusion.

> 
>> +static int bcm63xx_reset_xlate(struct reset_controller_dev *rcdev,
>> +       const struct of_phandle_args *reset_spec)
>> +{
>> +       struct bcm63xx_reset_priv *priv = to_bcm63xx_reset_priv(rcdev);
>> +
>> +       if (WARN_ON(reset_spec->args_count != rcdev->of_reset_n_cells))
>> +               return -EINVAL;
>> +
>> +       if (reset_spec->args[0] >= rcdev->nr_resets)
>> +               return -EINVAL;
> 
> Should not these two things be moved to the core reset controller code
> based on the #reset-cells value?
> 

This has already been removed from the next version of the patch.

> 
>> +       if (of_property_read_u32(np, "offset", &priv->offset))
>> +               return -EINVAL;
>> +
>> +       /* valid reset bits */
>> +       if (of_property_read_u32(np, "mask", &priv->mask))
>> +               priv->mask = 0xffffffff;
>> +
>> +       priv->rcdev.owner = THIS_MODULE;
>> +       priv->rcdev.ops = &bcm63xx_reset_ops;
>> +       priv->rcdev.nr_resets = 32;
> 
> Should not that come from Device Tree, or be computed based on the
> mask property, like hweight_long() or something along these lines?

The "mask" property has been removed. It will assume 32 resets and rely
on the rest of the DT to only refer to valid bits.

-- 
Simon Arlott
