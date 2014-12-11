From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] TTY: add support for "tty slave" devices.
Date: Thu, 11 Dec 2014 18:18:37 -0500
Message-ID: <548A264D.8070103@hurleysoftware.com>
References: <20141211214801.4127.93914.stgit@notabene.brown> <20141211215943.4127.24792.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141211215943.4127.24792.stgit-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/11/2014 04:59 PM, NeilBrown wrote:
> A "tty slave" is a device connected via UART.
> It may need a driver to, for example, power the device on
> when the tty is opened, and power it off when the tty
> is released.
> 
> A "tty slave" is a platform device which is declared as a
> child of the uart in device-tree:
> 
> &uart1 {
> 	bluetooth {
> 		compatible = "tty,regulator";
> 		vdd-supply = <&vaux4>;
> 	};
> };
> 
> runtime power management is used to power-up the device
> on tty_open() and  power-down on tty_release().

I have a couple of issues with this:
1) why does a child device imply power management and a platform
   device? iow, what happens when someone else wants to have a
   child device that does something different?
2) why is this tied to the tty core and not the serial core
   if this is only for UART?

Regards,
Peter Hurley

> Signed-off-by: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
> ---
>  .../devicetree/bindings/serial/of-serial.txt       |    4 ++++
>  drivers/tty/tty_io.c                               |   22 ++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/of-serial.txt b/Documentation/devicetree/bindings/serial/of-serial.txt
> index 8c4fd0332028..b59501ee2f21 100644
> --- a/Documentation/devicetree/bindings/serial/of-serial.txt
> +++ b/Documentation/devicetree/bindings/serial/of-serial.txt
> @@ -39,6 +39,10 @@ Optional properties:
>    driver is allowed to detect support for the capability even without this
>    property.
>  
> +Optional child node:
> +- a platform device listed as a child node will be probed and
> +  powered-on whenever the tty is in use (open).
> +
>  Example:
>  
>  	uart@80230000 {
> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> index 0508a1d8e4cd..7acdc6f093f4 100644
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -95,6 +95,8 @@
>  #include <linux/seq_file.h>
>  #include <linux/serial.h>
>  #include <linux/ratelimit.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/of_platform.h>
>  
>  #include <linux/uaccess.h>
>  
> @@ -1683,6 +1685,17 @@ static int tty_release_checks(struct tty_struct *tty, struct tty_struct *o_tty,
>  	return 0;
>  }
>  
> +static int open_child(struct device *dev, void *data)
> +{
> +	pm_runtime_get_sync(dev);
> +	return 0;
> +}
> +static int release_child(struct device *dev, void *data)
> +{
> +	pm_runtime_put_autosuspend(dev);
> +	return 0;
> +}
> +
>  /**
>   *	tty_release		-	vfs callback for close
>   *	@inode: inode of tty
> @@ -1712,6 +1725,8 @@ int tty_release(struct inode *inode, struct file *filp)
>  	long	timeout = 0;
>  	int	once = 1;
>  
> +	if (tty->dev)
> +		device_for_each_child(tty->dev, NULL, release_child);
>  	if (tty_paranoia_check(tty, inode, __func__))
>  		return 0;
>  
> @@ -2118,6 +2133,8 @@ retry_open:
>  		__proc_set_tty(current, tty);
>  	spin_unlock_irq(&current->sighand->siglock);
>  	tty_unlock(tty);
> +	if (tty->dev)
> +		device_for_each_child(tty->dev, NULL, open_child);
>  	mutex_unlock(&tty_mutex);
>  	return 0;
>  err_unlock:
> @@ -3207,6 +3224,11 @@ struct device *tty_register_device_attr(struct tty_driver *driver,
>  	retval = device_register(dev);
>  	if (retval)
>  		goto error;
> +	if (device && device->of_node)
> +		/* Children are platform devices and will be
> +		 * runtime_pm managed by this tty.
> +		 */
> +		of_platform_populate(device->of_node, NULL, NULL, dev);
>  
>  	return dev;


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
