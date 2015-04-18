From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] tee: generic TEE subsystem
Date: Sat, 18 Apr 2015 09:20:58 +0200
Message-ID: <1429341658.16771.123.camel@x220>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org>
	 <1429257057-7935-2-git-send-email-jens.wiklander@linaro.org>
	 <2102140.2VHBUJBHNB@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2102140.2VHBUJBHNB@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2015-04-17 at 22:07 +0200, Arnd Bergmann wrote:
> On Friday 17 April 2015 09:50:56 Jens Wiklander wrote:
> > +static const struct file_operations tee_fops = {
> > +	.owner = THIS_MODULE,
> > +	.open = tee_open,
> > +	.release = tee_release,
> > +	.unlocked_ioctl = tee_ioctl
> > +};
> 
> Add a .compat_ioctl function, to make it work on arm64 as well.
> If you got all the data structures right, you can use the same
> tee_ioctl function.
> 
> Minor nit: put a comma behind the last line in each struct initialization
> to make it easier to add another callback.

And another nit: this is built-in only code, right? So, according to
include/linux/export.h, THIS_MODULE will be basically equivalent to
NULL. So I think you can drop that line.

Thanks,


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
