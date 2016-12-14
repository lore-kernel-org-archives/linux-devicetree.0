From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH linux v1 2/4] drivers: misc: Character device driver for
 seven segment display
Date: Wed, 14 Dec 2016 12:32:33 +0000
Message-ID: <20161214123233.GF14217@n2100.armlinux.org.uk>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <1481702104-8617-3-git-send-email-jaghu@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481702104-8617-3-git-send-email-jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 13, 2016 at 11:55:02PM -0800, Jaghathiswari Rankappagounder Natarajan wrote:
> +int seven_seg_setup_cdev(struct seven_seg_disp_dev *disp_dev,
> +	void (*update_disp_data)(struct device *, u16 data))
> +{
> +	struct device *dev;
> +	int err;
> +
> +	dev = device_create(seven_seg_disp_class, &disp_dev->parent,
> +			seven_seg_devno,
> +			NULL, "seven_seg_disp_val");
> +	if (dev == NULL)
> +		return -1;

Do not use return -1 in kernel code.

> +	disp_dev->dev = dev;
> +	disp_dev->update_seven_seg_data = update_disp_data;
> +	disp_dev->disp_data_valid = false;
> +
> +	cdev_init(&disp_dev->cdev, &seven_seg_disp_fops);
> +	err = cdev_add(&disp_dev->cdev, seven_seg_devno, 1);
> +	if (err)
> +		device_destroy(seven_seg_disp_class, seven_seg_devno);
> +	return err;
> +}
> +
> +static int __init seven_seg_disp_init(void)
> +{
> +	if (alloc_chrdev_region(&seven_seg_devno, 0, 1, "disp_state") < 0)
> +		return -1;

Do not use return -1 in kernel code.

> +
> +	seven_seg_disp_class = class_create(THIS_MODULE, "disp_state");
> +	if (seven_seg_disp_class == NULL)
> +		goto unreg_chrdev;
> +
> +unreg_chrdev:
> +	unregister_chrdev_region(seven_seg_devno, 1);
> +	return -1;

Do not use return -1 in kernel code.

(Look up what an errno value of '1' means.  Negative values returned from
functions are interpreted as negated errno values.)

Always propagate error codes, or select an appropriate errno value to
return.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
