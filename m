From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] misc: Add Aspeed BT IPMI host driver
Date: Wed, 31 Aug 2016 21:57:31 +0200
Message-ID: <8157811.GypLEN0R9B@wuerfel>
References: <1472664259-23933-1-git-send-email-clg@kaod.org> <1472664259-23933-2-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472664259-23933-2-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, August 31, 2016 7:24:17 PM CEST Cédric Le Goater wrote:
> From: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
> 
> This patch adds a simple device driver to expose the iBT interface on
> Aspeed chips as a character device (/dev/bt).
> 
> The iBT interface is used to perform in-band IPMI communication from a
> BMC to the host.
> 
> Signed-off-by: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
> Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> [clg: checkpatch fixes
>       devicetree binding documentation]
> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
> ---
>  .../devicetree/bindings/misc/aspeed,bt-host.txt    |  19 +
>  drivers/misc/Kconfig                               |   5 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/bt-host.c                             | 433 +++++++++++++++++++++
>  include/uapi/linux/Kbuild                          |   1 +
>  include/uapi/linux/bt-host.h                       |  18 +
>  6 files changed, 477 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/aspeed,bt-host.txt
>  create mode 100644 drivers/misc/bt-host.c
>  create mode 100644 include/uapi/linux/bt-host.h
> 
> diff --git a/Documentation/devicetree/bindings/misc/aspeed,bt-host.txt b/Documentation/devicetree/bindings/misc/aspeed,bt-host.txt
> new file mode 100644
> index 000000000000..938c5998c331
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/aspeed,bt-host.txt

"misc" seems like a bad category here. Does this fit nowhere else?

> @@ -0,0 +1,19 @@
> +* Aspeed BT IPMI interface

What does "BT" stand for? IPMI is a more commonly known acronym,
but maybe list both with their full name as well.

> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 7410c6d9a34d..71a7b9feb0f0 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -57,6 +57,7 @@ obj-$(CONFIG_ECHO)		+= echo/
>  obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
>  obj-$(CONFIG_CXL_BASE)		+= cxl/
>  obj-$(CONFIG_PANEL)             += panel.o
> +obj-$(CONFIG_ASPEED_BT_IPMI_HOST)	+= bt-host.o
>  
>  lkdtm-$(CONFIG_LKDTM)		+= lkdtm_core.o
>  lkdtm-$(CONFIG_LKDTM)		+= lkdtm_bugs.o

Maybe put this in a subdirectory of drivers/char/ipmi?
I understand that this is the other end of the protocol,
but they are closely related after all.

> +#define DEVICE_NAME	"bt-host"

here maybe "ipmi/bt-host" or "ipmi-bt-host"?

> +static ssize_t bt_host_read(struct file *file, char __user *buf,
> +				size_t count, loff_t *ppos)
> +{
> +	struct bt_host *bt_host = file_bt_host(file);
> +	char __user *p = buf;
> +	u8 len;
> +
> +	if (!access_ok(VERIFY_WRITE, buf, count))
> +		return -EFAULT;
> +
> +	WARN_ON(*ppos);
> +
> +	if (wait_event_interruptible(bt_host->queue,
> +				bt_inb(bt_host, BT_CTRL) & BT_CTRL_H2B_ATN))
> +		return -ERESTARTSYS;
> +
> +	set_b_busy(bt_host);
> +	clr_h2b_atn(bt_host);
> +	clr_rd_ptr(bt_host);
> +
> +	len = bt_read(bt_host);
> +	__put_user(len, p++);
> +
> +	/* We pass the length back as well */
> +	if (len + 1 > count)
> +		len = count - 1;
> +
> +	while (len) {
> +		if (__put_user(bt_read(bt_host), p))
> +			return -EFAULT;
> +		len--; p++;
> +	}

If there are larger chunks of data to be transferred,
using a temporary buffer with copy_from_user/copy_to_user
would be more efficient. Since the size appears to
be limited to 256 bytes anyway, that easily fits on the stack.

> +
> +	clr_b_busy(bt_host);
> +
> +	return p - buf;
> +}

What is the motivation for only allowing complete messages
to be transferred or truncated for short buffers?

Have you considered reading the message into a device specific
buffer and allowing continued reads?

I don't see an obvious reason one way or another, and I suppose
you had an idea of what you were doing, so maybe explain it
in a comment.

> +static long bt_host_ioctl(struct file *file, unsigned int cmd,
> +		unsigned long param)
> +{
> +	struct bt_host *bt_host = file_bt_host(file);
> +
> +	switch (cmd) {
> +	case BT_HOST_IOCTL_SMS_ATN:
> +		set_sms_atn(bt_host);
> +		return 0;
> +	}
> +	return -EINVAL;
> +}

Is this ioctl interface defined in a way that makes sense on
any IPMI host hardware, or did you just do it like this because
it is the easiest way on the hardware. I think it's important
for the user interface to be extensible to other implementations
if we ever add any.

> +static int bt_host_config_irq(struct bt_host *bt_host,
> +		struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	uint32_t reg;
> +	int rc;
> +
> +	bt_host->irq = irq_of_parse_and_map(dev->of_node, 0);
> +	if (!bt_host->irq)
> +		return -ENODEV;

I think platform_get_irq() is the preferred interface here.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
