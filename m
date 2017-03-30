From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] nvmem: imx-ocotp: add write support
Date: Thu, 30 Mar 2017 08:16:43 +0200
Message-ID: <20170330061643.mxk3regx6col4zt7@pengutronix.de>
References: <1490621491-28247-1-git-send-email-richard.leitner@skidata.com>
 <1490621491-28247-2-git-send-email-richard.leitner@skidata.com>
 <CAOMZO5DV+80np5qsq9JdKwmKFL1AkeqJ09S3o0XjQzAqYw0rYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5DV+80np5qsq9JdKwmKFL1AkeqJ09S3o0XjQzAqYw0rYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 27, 2017 at 10:42:06AM -0300, Fabio Estevam wrote:
> [Adding Pengutronix folks and Shawn on Cc]
> 
> On Mon, Mar 27, 2017 at 10:31 AM, Richard Leitner
> <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org> wrote:
> > Implement write routine for OCOTP controller found in i.MX6 SoC's.
> > Furthermore add locking to the read function to prevent race conditions.
> > The write routine code is based on the fsl_otp driver from Freescale.
> >
> > Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
> 
> Do we really want to have write support in the driver?

Why not? The fuses must be written somewhere and some like to do it
under Linux.

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
