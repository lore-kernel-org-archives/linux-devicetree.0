From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] tee: generic TEE subsystem
Date: Sat, 18 Apr 2015 10:04:20 +0100
Message-ID: <20150418090420.GG12732@n2100.arm.linux.org.uk>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org>
 <1429257057-7935-2-git-send-email-jens.wiklander@linaro.org>
 <20150418085712.GB29858@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150418085712.GB29858-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 18, 2015 at 10:57:12AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 17, 2015 at 09:50:56AM +0200, Jens Wiklander wrote:
> > +struct tee_device {
> > +	char name[TEE_MAX_DEV_NAME_LEN];
> > +	const struct tee_desc *desc;
> > +	struct device *dev;
> 
> No, please embed the device in your structure, don't have a pointer to
> it.

Greg, "dev" here is not a locally allocated device, but the parent device.
It's actually the same as struct tee_device.miscdev.parent, which could be
used instead and this member deleted.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
