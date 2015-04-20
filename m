From: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 2/2] tee: add OP-TEE driver
Date: Mon, 20 Apr 2015 08:42:27 +0200
Message-ID: <20150420064227.GA25054@ermac>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org>
 <1429257057-7935-3-git-send-email-jens.wiklander@linaro.org>
 <20150418085747.GC29858@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150418085747.GC29858-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 18, 2015 at 10:57:47AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 17, 2015 at 09:50:57AM +0200, Jens Wiklander wrote:
> > Adds mostly stubbed OP-TEE driver which also can be compiled as a
> > loadable module.
> 
> Please provide a "real" driver, so that we can see how this is all going
> to work.  Otherwise it's not really that useful to create some framework
> that nothing in-kernel is going to use.
OK, I'll provide that in the next round.

Regards,
Jens
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
