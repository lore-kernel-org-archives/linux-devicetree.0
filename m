From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3 04/12] misc: xilinx_sdfec: Add open, close and ioctl
Date: Thu, 2 May 2019 19:23:04 +0200
Message-ID: <20190502172304.GB1874@kroah.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-5-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556402706-176271-5-git-send-email-dragan.cvetic@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: arnd@arndb.de, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 27, 2019 at 11:04:58PM +0100, Dragan Cvetic wrote:
> +static int xsdfec_dev_open(struct inode *iptr, struct file *fptr)
> +{
> +	struct xsdfec_dev *xsdfec;
> +
> +	xsdfec = container_of(iptr->i_cdev, struct xsdfec_dev, xsdfec_cdev);
> +
> +	if (!atomic_dec_and_test(&xsdfec->open_count)) {

Why do you care about this?

And do you really think it matters?  What are you trying to protect from
here?

> +		atomic_inc(&xsdfec->open_count);
> +		return -EBUSY;
> +	}
> +
> +	fptr->private_data = xsdfec;
> +	return 0;
> +}
> +
> +static int xsdfec_dev_release(struct inode *iptr, struct file *fptr)
> +{
> +	struct xsdfec_dev *xsdfec;
> +
> +	xsdfec = container_of(iptr->i_cdev, struct xsdfec_dev, xsdfec_cdev);
> +
> +	atomic_inc(&xsdfec->open_count);

You increment a number when the device is closed?

You are trying to make it hard to maintain this code over time :)


> +	return 0;
> +}
> +
> +static long xsdfec_dev_ioctl(struct file *fptr, unsigned int cmd,
> +			     unsigned long data)
> +{
> +	struct xsdfec_dev *xsdfec = fptr->private_data;
> +	void __user *arg = NULL;
> +	int rval = -EINVAL;
> +	int err = 0;
> +
> +	if (!xsdfec)
> +		return rval;
> +
> +	if (_IOC_TYPE(cmd) != XSDFEC_MAGIC)
> +		return -ENOTTY;
> +
> +	/* check if ioctl argument is present and valid */
> +	if (_IOC_DIR(cmd) != _IOC_NONE) {
> +		arg = (void __user *)data;
> +		if (!arg) {
> +			dev_err(xsdfec->dev,
> +				"xilinx sdfec ioctl argument is NULL Pointer");

You just created a way for userspace to spam the kernel log, please do
not do that :(



> +			return rval;
> +		}
> +	}
> +
> +	if (err) {
> +		dev_err(xsdfec->dev, "Invalid xilinx sdfec ioctl argument");
> +		return -EFAULT;

Wrong error, you did not have a memory fault.

Again, you just created a way to spam the kernel log by a user :(

thanks,

greg k-h
