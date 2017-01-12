From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
Date: Thu, 12 Jan 2017 08:47:50 +0100
Message-ID: <20170112074750.GB23943@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170112002910.3650-4-cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2017 at 11:29:09AM +1100, Cyril Bur wrote:
> +static ssize_t lpc_ctrl_read(struct file *file, char __user *buf,
> +				size_t count, loff_t *ppos)
> +{
> +	if (!access_ok(VERIFY_WRITE, buf, count))
> +		return -EFAULT;
> +
> +	return -EPERM;
> +}
> +
> +static ssize_t lpc_ctrl_write(struct file *file, const char __user *buf,
> +				size_t count, loff_t *ppos)
> +{
> +	if (!access_ok(VERIFY_READ, buf, count))
> +		return -EFAULT;
> +
> +	return -EPERM;
> +}

Those functions don't actually do anything, so why even include them?

And don't call access_ok(), it's racy and no driver should ever do that.

> +static long lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
> +		unsigned long param)
> +{
> +	long rc;
> +	struct lpc_mapping map;
> +	struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
> +	void __user *p = (void __user *)param;
> +
> +	switch (cmd) {
> +	case LPC_CTRL_IOCTL_SIZE:
> +		return copy_to_user(p, &lpc_ctrl->size,
> +			sizeof(lpc_ctrl->size)) ? -EFAULT : 0;
> +	case LPC_CTRL_IOCTL_MAP:
> +		if (copy_from_user(&map, p, sizeof(map)))
> +			return -EFAULT;
> +
> +
> +		/*
> +		 * The top half of HICR7 is the MSB of the BMC address of the
> +		 * mapping.
> +		 * The bottom half of HICR7 is the MSB of the HOST LPC
> +		 * firmware space address of the mapping.
> +		 *
> +		 * The 1 bits in the top of half of HICR8 represent the bits
> +		 * (in the requested address) that should be ignored and
> +		 * replaced with those from the top half of HICR7.
> +		 * The 1 bits in the bottom half of HICR8 represent the bits
> +		 * (in the requested address) that should be kept and pass
> +		 * into the BMC address space.
> +		 */
> +
> +		rc = regmap_write(lpc_ctrl->regmap, HICR7,
> +				(lpc_ctrl->base | (map.hostaddr >> 16)));
> +		if (rc)
> +			return rc;
> +
> +		rc = regmap_write(lpc_ctrl->regmap, HICR8,
> +			(~(map.size - 1)) | ((map.size >> 16) - 1));

Look Ma, a kernel exploit!

{sigh}

Your assignment is to go find a whiteboard/blackboard/whatever and write
on it 100 times:
	All input is evil.

I want to see the picture of that before you send any more kernel patches.

> +static int lpc_ctrl_release(struct inode *inode, struct file *file)
> +{
> +	atomic_dec(&lpc_ctrl_open_count);

Totally unneeded and unnecessary, why do you care?

Again, use UIO, it will save you from yourself...

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
