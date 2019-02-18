Return-Path: <SRS0=4nWU=QZ=gmail.com=dmitry.torokhov@kernel.org>
Date: Sun, 17 Feb 2019 22:40:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v6 2/2] input: touchscreen: Add support for Azoteq
 IQS550/572/525
Message-ID: <20190218064054.GA242714@dtor-ws>
References: <1549838394-3852-1-git-send-email-jeff@labundy.com>
 <1549838394-3852-2-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1549838394-3852-2-git-send-email-jeff@labundy.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: devicetree@vger.kernel.org, linux-input@vger.kernel.org, rydberg@bitmath.org, robh+dt@kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

Hi Jeff,

On Sun, Feb 10, 2019 at 04:39:54PM -0600, Jeff LaBundy wrote:
> This patch adds support for the Azoteq IQS550/572/525 family of
> trackpad/touchscreen controllers.
> 
> The driver has been tested with an IQS550EV02 evaluation board. A
> demonstration of the driver's capabilities is available here:
> 
> https://youtu.be/sRNNx4XZBts

A few comments:

- we have request_ihex_firmware that requests and validates biary
  representation of ihex into the kernel. There is not really a good
  reason to parse text ihex in kernel.
  There is idex2bin in ./firmware to convert it.

- I would recommend against doing this whole business of automatic
  uprevving and updating firmware on probe. The controller mees to have
  persistent firmware, so just check whether the device comes up in
  bootloader or normal mode, and if it is in bootloader mode simply
  forego creating and registering input device and wait for the
  userspace to update firmware ad fix it up.
  Not having to deal with firmware on probe will also allow compiling
  the driver into the kernel (vs being a module) as firmware loading is
  not normally available until after root filesystem is mounted.

- firmware update is usually keyed off device model, not DT name.

> +static int iqs5xx_read_burst(struct i2c_client *client,
> +				u16 reg, u8 *val8, u8 len)

If you make val8 void * you won't need to cast.

> +
> +static int iqs5xx_write_burst(struct i2c_client *client,
> +				u16 reg, u8 *val8, u8 len)

const void *.

> +	error = devm_request_threaded_irq(&client->dev, client->irq,
> +			NULL, iqs5xx_irq,
> +			IRQF_ONESHOT | IRQF_TRIGGER_RISING,

Please do not specify IRQ trigger, let it come from device tree, so only
use IRQF_ONESHOT.

By the way, I'd recommend using level interrupts so you never miss the
edge.

Thanks.

-- 
Dmitry
