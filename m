From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [tpmdd-devel] [RFC PATCH 1/2] tee: generic TEE subsystem
Date: Sat, 18 Apr 2015 10:01:47 +0100
Message-ID: <20150418090147.GF12732@n2100.arm.linux.org.uk>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org>
 <1429257057-7935-2-git-send-email-jens.wiklander@linaro.org>
 <20150417163054.GA28241@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150417163054.GA28241-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 17, 2015 at 10:30:54AM -0600, Jason Gunthorpe wrote:
> On Fri, Apr 17, 2015 at 09:50:56AM +0200, Jens Wiklander wrote:
> > +	teedev = devm_kzalloc(dev, sizeof(*teedev), GFP_KERNEL);
> [..]
> > +	rc = misc_register(&teedev->miscdev);
> [..]
> > +void tee_unregister(struct tee_device *teedev)
> > +{
> [..]
> > +	misc_deregister(&teedev->miscdev);
> > +}
> [..]
> >+static int optee_remove(struct platform_device *pdev)
> >+{
> >+       tee_unregister(optee->teedev);
> 
> Isn't that a potential use after free? AFAIK misc_deregister does not
> guarentee the miscdev will no longer be accessed after it returns, and
> the devm will free it after optee_remove returns.
> 
> Memory backing a stuct device needs to be freed via the release
> function.

Out of interest, which struct device are you talking about here?

struct tee_device contains two things - a struct device _pointer_ to the
device passed into the registration function, and a miscdev.

A miscdev contains two struct device _pointers_ - a pointer to the parent
device, and a pointer to the char class device.  As both of these are
pointers, freeing struct tee_device does not free the memory underlying
any device structure.

What does need to be taken care of is that unbinding the parent device
may cause an already-open user of the userspace interface to dereference
the memory which was freed.  Tying this to the lifetime of a struct
device doesn't seem right.

I would suggest adding a kref to struct tee_device and use that to manage
the lifetime of that structure - incrementing the refcount on fops->open
and dropping it at fops->release time, so that the struct is automatically
freed when the last user closes the miscdev after the device has been
unbound.  You should probably also have a flag to indicate that the device
is no longer present too to prevent further userspace IO.

It would be nice if miscdev provided help with this...

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
