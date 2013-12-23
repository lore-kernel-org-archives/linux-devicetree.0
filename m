From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v8 3/9] usb: gadget: s3c-hsotg: enable build for other
 platforms
Date: Mon, 23 Dec 2013 17:30:41 +0100
Message-ID: <1831289.ILfyABDFji@amdc1227>
References: <1387462990-12039-1-git-send-email-mporter@linaro.org>
 <1387462990-12039-4-git-send-email-mporter@linaro.org>
 <20131223162557.GC28679@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20131223162557.GC28679-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 23 of December 2013 10:25:57 Felipe Balbi wrote:
> On Thu, Dec 19, 2013 at 09:23:04AM -0500, Matt Porter wrote:
> > Remove unused Samsung-specific machine include and Kconfig
> > dependency on S3C.
> > 
> > Signed-off-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Reviewed-by: Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Reviewed-by: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/usb/gadget/Kconfig     | 7 +++----
> >  drivers/usb/gadget/s3c-hsotg.c | 2 --
> >  2 files changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
> > index a91e642..181e760 100644
> > --- a/drivers/usb/gadget/Kconfig
> > +++ b/drivers/usb/gadget/Kconfig
> > @@ -294,11 +294,10 @@ config USB_PXA27X
> >  	   gadget drivers to also be dynamically linked.
> >  
> >  config USB_S3C_HSOTG
> > -	tristate "S3C HS/OtG USB Device controller"
> > -	depends on S3C_DEV_USB_HSOTG
> > +	tristate "Designware/S3C HS/OtG USB Device controller"
> 
> causes build failure in x86. Sorry dropping from my queue.

Maybe depends on ARM would be a good enough stepping stone?

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
