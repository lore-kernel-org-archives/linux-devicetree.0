From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] iio: mma8452: support either of the available interrupt
 pins
Date: Tue, 13 Oct 2015 17:33:26 +0100
Message-ID: <20151013163326.GE24353@leverpostej>
References: <1444751908-18242-1-git-send-email-martink@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444751908-18242-1-git-send-email-martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 13, 2015 at 05:58:28PM +0200, Martin Kepplinger wrote:
> This change is important in order for everyone to be easily able to use the
> driver for one of the supported accelerometer chips!
> 
> Until now, the driver blindly assumed that the INT1 interrupt line is wired
> on a user's board. But these devices have 2 interrupt lines and can route
> their different interrupt sources to one of them. Since only their motion
> detection interrupt source is implemented as IIO events, users just use
> either one of the pins.
> 
> client->irq is not changed because only one interrupt line is supported.
> The user is warned if she describes both interrupt pins in the dts.

If the hardware has both wired up, the DT should describe both.

The fact that a kernel might only use one is irrelevant to the binding.

You need to handle the case that both are wired up.

[...]

> +  - interrupt-names: should contain "INT1" or "INT2", the accelerometer's
> +		     interrupt line in use.

This "or" should be "and/or".

[...]

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 1eccc2d..dbfd0b4 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -29,6 +29,7 @@
>  #include <linux/iio/events.h>
>  #include <linux/delay.h>
>  #include <linux/of_device.h>
> +#include <linux/of_irq.h>
>  
>  #define MMA8452_STATUS				0x00
>  #define  MMA8452_STATUS_DRDY			(BIT(2) | BIT(1) | BIT(0))
> @@ -1130,13 +1131,26 @@ static int mma8452_probe(struct i2c_client *client,
>  					   MMA8452_INT_FF_MT;
>  		int enabled_interrupts = MMA8452_INT_TRANS |
>  					 MMA8452_INT_FF_MT;
> +		int irq1, irq2;
>  
> -		/* Assume wired to INT1 pin */
> -		ret = i2c_smbus_write_byte_data(client,
> -						MMA8452_CTRL_REG5,
> -						supported_interrupts);
> -		if (ret < 0)
> -			return ret;
> +		irq1 = of_irq_get_byname(client->dev.of_node, "INT1");
> +		irq2 = of_irq_get_byname(client->dev.of_node, "INT2");
> +
> +		if (irq1 > 0 && irq2 > 0)
> +			dev_warn(&client->dev,
> +				 "only one interrupt line supported\n");

	dev_info(&client->dev, "INT1 and INT2 present.");

This is a  valid case, and does not require a warning.

Thanks,
Mark.
