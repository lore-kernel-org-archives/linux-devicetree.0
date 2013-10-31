From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: gpio: dwapb: Synopsys Designware GPIO
Date: Thu, 31 Oct 2013 09:22:26 +0100
Message-ID: <20131031082226.GZ28790@pengutronix.de>
References: <52718C28.5030803@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52718C28.5030803-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Dinh,

On Wed, Oct 30, 2013 at 05:46:00PM -0500, Dinh Nguyen wrote:
> Hi Jamie,
> 
> The socfpga platform is making use of the Synopsys Designware APB GPIO
> module.
> We found your patches to support them, but I could not figure out why
> they weren't
> merged upstream.
> 
> http://thread.gmane.org/gmane.linux.kernel/1234331
> 
> We made a few changes for the IRQs to work, and was wondering if you
> want to continue
> to take it upstream or we can?
> 

I figured those patches were lost behind and started just yesterday to
revitalize Jamies work. Although, I think the bank stuff doesn't seem
necessary as the core knows all that stuff by itself AFAIK.
But, I don't have access to the Synopsys datasheet and must go by what
I can make out of the hps.html (which is really inconvenient to use if you
ask me).

Do you have that updated driver somewhere to look at? Maybe I can then just
do something else. The gpio-dw.c from rocketboards/socfpga-3.11 doesn't look
like it is based on Jamies work.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
