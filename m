From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
Date: Thu, 12 Jan 2017 11:30:38 +0100
Message-ID: <20170112103038.GA19239@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
 <20170112074750.GB23943@kroah.com>
 <1484216163.11416.8.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484216163.11416.8.camel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2017 at 09:16:03PM +1100, Cyril Bur wrote:
> On Thu, 2017-01-12 at 08:47 +0100, Greg KH wrote:
> > On Thu, Jan 12, 2017 at 11:29:09AM +1100, Cyril Bur wrote:
> > > +static ssize_t lpc_ctrl_read(struct file *file, char __user *buf,
> > > +				size_t count, loff_t *ppos)
> > > +{
> > > +	if (!access_ok(VERIFY_WRITE, buf, count))
> > > +		return -EFAULT;
> > > +
> > > +	return -EPERM;
> > > +}
> > > +
> > > +static ssize_t lpc_ctrl_write(struct file *file, const char __user *buf,
> > > +				size_t count, loff_t *ppos)
> > > +{
> > > +	if (!access_ok(VERIFY_READ, buf, count))
> > > +		return -EFAULT;
> > > +
> > > +	return -EPERM;
> > > +}
> > 
> 
> Hello Greg,
> 
> > Those functions don't actually do anything, so why even include them?
> > 
> 
> Apologies, I should be more careful with what I send.

Hm, that implies you never tested what you sent, nor intended for us to
merge it, an odd thing for you to do :)

> > And don't call access_ok(), it's racy and no driver should ever do that.
> > 
> 
> Oh, duly noted. I'll be sure to check out how and why. Perhaps it
> would be wise that no driver actually do that, I'm quite sure I used
> other drivers as examples of best practice.

You did?  Please point me at that code so we can fix them up properly.
Cargo-cult coding is not a good thing, but it happens, so if we can at
least provide clean code to fixate on, it's good overall for everyone.

> > > +static long lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
> > > +		unsigned long param)
> > > +{
> > > +	long rc;
> > > +	struct lpc_mapping map;
> > > +	struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
> > > +	void __user *p = (void __user *)param;
> > > +
> > > +	switch (cmd) {
> > > +	case LPC_CTRL_IOCTL_SIZE:
> > > +		return copy_to_user(p, &lpc_ctrl->size,
> > > +			sizeof(lpc_ctrl->size)) ? -EFAULT : 0;
> > > +	case LPC_CTRL_IOCTL_MAP:
> > > +		if (copy_from_user(&map, p, sizeof(map)))
> > > +			return -EFAULT;
> > > +
> > > +
> > > +		/*
> > > +		 * The top half of HICR7 is the MSB of the BMC address of the
> > > +		 * mapping.
> > > +		 * The bottom half of HICR7 is the MSB of the HOST LPC
> > > +		 * firmware space address of the mapping.
> > > +		 *
> > > +		 * The 1 bits in the top of half of HICR8 represent the bits
> > > +		 * (in the requested address) that should be ignored and
> > > +		 * replaced with those from the top half of HICR7.
> > > +		 * The 1 bits in the bottom half of HICR8 represent the bits
> > > +		 * (in the requested address) that should be kept and pass
> > > +		 * into the BMC address space.
> > > +		 */
> > > +
> > > +		rc = regmap_write(lpc_ctrl->regmap, HICR7,
> > > +				(lpc_ctrl->base | (map.hostaddr >> 16)));
> > > +		if (rc)
> > > +			return rc;
> > > +
> > > +		rc = regmap_write(lpc_ctrl->regmap, HICR8,
> > > +			(~(map.size - 1)) | ((map.size >> 16) - 1));
> > 
> > Look Ma, a kernel exploit!
> > 
> 
> So 'evil' input here could allow the host to control the bmc,
> personally I file that under 'stupid' input. Also, stupid but not
> accidental, I don't believe one could accidentally come up with such
> input, although you never know what silly things human beings sometimes
> do. For what its worth, I'm not even sure that can happen but I'll
> grant you the benifit of the doubt.

I think you didn't get the main point here, again:

> > {sigh}
> > 
> > Your assignment is to go find a whiteboard/blackboard/whatever and write
> > on it 100 times:
> > 	All input is evil.

You can NEVER trust any input values sent to the kernel, you have to
ALWAYS verify they are within certain safe ranges.


> > I want to see the picture of that before you send any more kernel patches.
> > 
> > > +static int lpc_ctrl_release(struct inode *inode, struct file *file)
> > > +{
> > > +	atomic_dec(&lpc_ctrl_open_count);
> > 
> > Totally unneeded and unnecessary, why do you care?
> > 
> 
> My aim here was to only have one process playing with the LPC mapping
> registers at a time.

Why?  Who cares?  You don't have internal state being kept by the
driver, so it shouldn't matter.

And again, don't treat an atomic variable as a lock, use a real lock for
the task, it works better, and is the correct thing to do.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
