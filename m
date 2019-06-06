From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V4 04/12] misc: xilinx_sdfec: Add open, close and ioctl
Date: Thu, 6 Jun 2019 15:28:42 +0200
Message-ID: <20190606132842.GC7943@kroah.com>
References: <1558784245-108751-1-git-send-email-dragan.cvetic@xilinx.com>
 <1558784245-108751-5-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558784245-108751-5-git-send-email-dragan.cvetic@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: arnd@arndb.de, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Sat, May 25, 2019 at 12:37:17PM +0100, Dragan Cvetic wrote:
> +static int xsdfec_dev_open(struct inode *iptr, struct file *fptr)
> +{
> +	return 0;
> +}
> +
> +static int xsdfec_dev_release(struct inode *iptr, struct file *fptr)
> +{
> +	return 0;
> +}

empty open/close functions are never needed, just drop them.

> +
> +static long xsdfec_dev_ioctl(struct file *fptr, unsigned int cmd,
> +			     unsigned long data)
> +{
> +	struct xsdfec_dev *xsdfec;
> +	void __user *arg = NULL;
> +	int rval = -EINVAL;
> +
> +	xsdfec = container_of(fptr->private_data, struct xsdfec_dev, miscdev);
> +	if (!xsdfec)
> +		return rval;

It is impossible for container_of() to return NULL, unless something
very magical and rare just happened.  It's just doing pointer math, you
can never check the return value of it.

> +
> +	if (_IOC_TYPE(cmd) != XSDFEC_MAGIC)
> +		return -ENOTTY;

How can this happen?

> +
> +	/* check if ioctl argument is present and valid */
> +	if (_IOC_DIR(cmd) != _IOC_NONE) {
> +		arg = (void __user *)data;
> +		if (!arg)
> +			return rval;
> +	}
> +
> +	switch (cmd) {
> +	default:
> +		/* Should not get here */
> +		dev_warn(xsdfec->dev, "Undefined SDFEC IOCTL");

Nice that userspace has a way to fill up the kernel log :(

Just return the correct error here, don't log it.

thanks,

greg k-h
