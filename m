From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 1/3] usb: core: add power sequence for USB devices
Date: Thu, 3 Mar 2016 13:31:56 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1603031326310.1380-100000@iolanthe.rowland.org>
References: <1456999276-6315-2-git-send-email-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456999276-6315-2-git-send-email-peter.chen-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org, troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 3 Mar 2016, Peter Chen wrote:

> Some hard-wired USB devices need to do power sequence to let the
> device work normally, the typical power sequence like: enable USB
> PHY clock, toggle reset pin, etc. But current Linux USB driver
> lacks of such code to do it, it may cause some hard-wired USB devices
> works abnormal or can't be recognized by controller at all.
> 
> In this patch, it will do power on sequence at hub's probe for all
> devices under this hub (includes root hub) if this device is described
> at dts and there is a phandle "usb-pwrseq" for it. At hub_disconnect,
> it will do power off sequence.
> 
> Signed-off-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>


> +static int hub_of_pwrseq(struct usb_device *hdev, bool on)
> +{
> +	struct device *parent;
> +	struct device_node *node;
> +	int ret = 0;
> +
> +	if (hdev->parent)
> +		parent = &hdev->dev;
> +	else
> +		parent = bus_to_hcd(hdev->bus)->self.controller;
> +
> +	for_each_child_of_node(parent->of_node, node) {
> +		ret = on ? usb_child_pwrseq_on(node)
> +			: usb_child_pwrseq_off(node);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

If you get a failure, do you want to leave the power to all the
preceding devices turned on?  It seems to me you should either turn all 
of them back off, or else continue trying to turn on power for the 
remaining children.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
