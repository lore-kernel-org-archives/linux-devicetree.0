From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] i.MX6-SabreAuto: DTS: use gpio-hog to enable
 WEIM-NOR at boot
Date: Mon, 27 Apr 2015 07:53:38 +0200
Message-ID: <20150427055338.GE4946@pengutronix.de>
References: <20150116072716.GD18220@pengutronix.de>
 <1429477343-11076-1-git-send-email-alison_chaiken@mentor.com>
 <1429477343-11076-2-git-send-email-alison_chaiken@mentor.com>
 <20150423063127.GJ6325@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150423063127.GJ6325-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alison-hh6fLRYtCEIS+FvcfC7Uqw@public.gmane.org
Cc: bparrot-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 23, 2015 at 08:31:27AM +0200, Sascha Hauer wrote:
> On Sun, Apr 19, 2015 at 02:02:23PM -0700, alison-hh6fLRYtCEIS+FvcfC7Uqw@public.gmane.org wrote:
> > +&i2c3 {
> > +	status = "disabled";
> > +};
> > +
> > +&uart3 {
> > +	status = "disabled";
> > +};
> 
> i2c3 and uart3 are not enabled for this board, why do you have to
> disable them here?
> 
> > +
> > +&ecspi1 {
> > +	status = "disabled";
> > +};
> > +
> > +&usdhc3 {
> > +	status = "disabled";
> > +};
> 
> usdhc3 uses other pins than the weim controller. Why do you have to
> disable it?


Please read the whole mail.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
