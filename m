From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v4 3/5] tee: generic TEE subsystem
Date: Wed, 8 Jul 2015 17:16:12 -0600
Message-ID: <20150708231612.GB20068@obsidianresearch.com>
References: <1436350592-7732-1-git-send-email-jens.wiklander@linaro.org>
 <1436350592-7732-4-git-send-email-jens.wiklander@linaro.org>
 <20150708171026.GA11740@obsidianresearch.com>
 <20150708211129.GA29824@kroah.com>
 <20150708222649.GA20068@obsidianresearch.com>
 <20150708223325.GA5843@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150708223325.GA5843-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 08, 2015 at 03:33:25PM -0700, Greg Kroah-Hartman wrote:
> > The basic issue is that cdev_del doesn't seem to be synchronizing.
> > 
> > The use after free race is then something like:
> > 
> >    struct tpm_chip {
> >  	struct device dev;
> > 	struct cdev cdev;
> 
> Oops, right there's your problem.  You can't have two reference counted
> objects trying to manage the memory of a single structure.  No matter
> what you do, it's going to be a pain to deal with this, so don't :)

Sure, generally, yes, but that isn't done for no reason, it is to make
open straightforward:

static int tpm_open(struct inode *inode, struct file *file)
{
	struct tpm_chip *chip =
		container_of(inode->i_cdev, struct tpm_chip, cdev);

We need to recover the tpm_chip associated with the char device
node, in a way that is holding a kref on it, without racing with
cdev_del/etc

This scheme does mean that if we have a struct file we have a kref on
the cdev, and if we have cdev then we have a kref on the tpm_chip,
which is really easy to use properly.

> > Ie we need cdev to hold a ref on tpm_chip->dev until cdev_put is
> > called.
> 
> No, separate them, make the cdev a pointer and all should be fine.

Okay, cdev_alloc takes care of the cdev lifetime.

Do you have a simple solution to replace container_of as well?

What would you think about something like:

 cdev_alloc(&chip->dev.kref)

?

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
