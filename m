From: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] media: rc: add driver for Amlogic Meson IR remote
 receiver
Date: Tue, 11 Nov 2014 12:18:39 +0100
Message-ID: <20141111111839.GA17620@gmail.com>
References: <1415521928-25251-1-git-send-email-b.galvani@gmail.com>
 <1415521928-25251-3-git-send-email-b.galvani@gmail.com>
 <20141109203608.GA837@gofer.mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141109203608.GA837-3XSxi2G4b3iXFJAUJl40Xg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Cc: Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 09, 2014 at 08:36:09PM +0000, Sean Young wrote:
> > [...]
> > +	dev_info(dev, "receiver initialized\n");
> > +
> > +	return 0;
> > +out_unreg:
> > +	rc_unregister_device(ir->rc);
> 
> rc_unregister_device() already calls rc_free_device().

Right, I will fix this.

Thanks,
Beniamino
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
