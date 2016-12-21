From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [v4, 3/3] ARM: dts: vf610-zii-dev-rev-b: Remove 'fixed-link'
 from DSA ports
Date: Wed, 21 Dec 2016 16:22:30 +0100
Message-ID: <20161221152230.GK30952@lunn.ch>
References: <1482131877-6097-3-git-send-email-andrew.smirnov@gmail.com>
 <1482325125-15725-1-git-send-email-nikita.yoush@cogentembedded.com>
 <20161221132519.bkkqyfk3beow7nc5@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161221132519.bkkqyfk3beow7nc5-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 21, 2016 at 02:25:19PM +0100, Uwe Kleine-König wrote:
> On Wed, Dec 21, 2016 at 03:58:45PM +0300, Nikita Yushchenko wrote:
> > > Remove 'fixed-link' nodes from DSA ports since they are not needed (they
> > > are not limiting link's speed and the ports will be configured to their
> > > maximux speed as a default)
> > >
> > > Suggested-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> > > Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > With this patch, ports connected to revB's second switch stop working.
> 
> This is probably because without a fixed-link node the phy-mode setting
> isn't applied by the driver.

Yep, bad suggestion from me. If the phy-mode was not needed, then you
can drop the fixed-link. With the phy-mode, you also need the fixed
link.

Sorry for the wasted time,

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
