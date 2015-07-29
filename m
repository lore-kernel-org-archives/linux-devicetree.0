From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 02/10] usb: chipidea: define stream mode disable for both
 roles
Date: Wed, 29 Jul 2015 12:41:29 +0800
Message-ID: <20150729044128.GB27605@shlinux2>
References: <1438137734-27311-1-git-send-email-peter.chen@freescale.com>
 <1438137734-27311-3-git-send-email-peter.chen@freescale.com>
 <20150729051016.GB5502@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150729051016.GB5502-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 28, 2015 at 10:10:16PM -0700, Greg KH wrote:
> On Wed, Jul 29, 2015 at 10:42:06AM +0800, Peter Chen wrote:
> > @@ -20,7 +20,6 @@ struct ci_hdrc_platform_data {
> >  	unsigned long	 flags;
> >  #define CI_HDRC_REGS_SHARED		BIT(0)
> >  #define CI_HDRC_SUPPORTS_RUNTIME_PM	BIT(2)
> > -#define CI_HDRC_DISABLE_STREAMING	BIT(3)
> 
> Why not just rename this one, now you have a "hole" in your bit field
> that people aren't going to know if they can use or not.
> 

I will change it, thanks.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
