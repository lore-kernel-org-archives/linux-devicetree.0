From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] iio: mma8452: support either of the available
 interrupt pins
Date: Wed, 14 Oct 2015 12:28:55 +0100
Message-ID: <20151014112854.GB32715@leverpostej>
References: <1444816349-25103-1-git-send-email-martink@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444816349-25103-1-git-send-email-martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 14, 2015 at 11:52:29AM +0200, Martin Kepplinger wrote:
> This change is important in order for everyone to be easily able to use the
> driver for one of the supported accelerometer chips!
> 
> Until now, the driver blindly assumed that the INT1 interrupt line is wired
> on a user's board. But these devices have 2 interrupt lines and can route
> their different interrupt sources to one of them. Since only their motion
> detection interrupt source is implemented as IIO events, users just use
> either one of the pins.
> 
> Of course, this also falls back to assuming INT1, so for existing users
> nothing will break. The new functionality is described in the bindings doc.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
> ---
> changelog:
> v2: don't warn but normally handle if both pins are described in dts
>     thanks Mark Rutland
> v1: initial post
> 
> 
>  .../devicetree/bindings/iio/accel/mma8452.txt      |  7 +++++++
>  drivers/iio/accel/mma8452.c                        | 22 ++++++++++++++++------
>  2 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/mma8452.txt b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
> index e3c3746..f06ed87 100644
> --- a/Documentation/devicetree/bindings/iio/accel/mma8452.txt
> +++ b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
> @@ -7,13 +7,19 @@ Required properties:
>      * "fsl,mma8453"
>      * "fsl,mma8652"
>      * "fsl,mma8653"
> +
>    - reg: the I2C address of the chip
>  
>  Optional properties:
>  
>    - interrupt-parent: should be the phandle for the interrupt controller
> +
>    - interrupts: interrupt mapping for GPIO IRQ
>  
> +  - interrupt-names: should contain "INT1" and/or "INT2", the accelerometer's
> +		     interrupt line in use. If only "INT2" is present, INT2 is
> +		     used; otherwise INT1.

The last sentence should go, as it's a description of the OS behaviour
rather than the hardware.

With that removed, the binding looks fine to me.

> +
>  Example:
>  
>  	mma8453fc@1d {
> @@ -21,4 +27,5 @@ Example:
>  		reg = <0x1d>;
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <5 0>;
> +		interrupt-names = "INT2";
>  	};
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 1eccc2d..4d69c3d 100644
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
> @@ -1130,13 +1131,22 @@ static int mma8452_probe(struct i2c_client *client,
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
> +		/* if INT2 is found, use it. Otherwise INT1 */
> +		if (!(irq2 > 0 && irq1 < 0)) {
> +			ret = i2c_smbus_write_byte_data(client,
> +							MMA8452_CTRL_REG5,
> +							supported_interrupts);
> +			if (ret < 0)
> +				return ret;
> +			dev_info(&client->dev, "using interrupt line INT1\n");
> +		} else {
> +			dev_info(&client->dev, "using interrupt line INT2\n");
> +		}

Is this correct? As far as I can see you request client->irq regardless
(and I assume that's just the first interrupt in the DT).

Does this work for both

	interrupt-names = "IRQ2", "IRQ1";
	interrupts = <2>, <1>;

or
	interrupt-names = "IRQ1", "IRQ2";
	interrupts = <1>, <2>;

?

You might need to override client->irq.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
