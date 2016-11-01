From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: dts: imx6qdl-sabrelite: add missing USB PHY
 reset control
Date: Tue, 1 Nov 2016 22:17:08 +0800
Message-ID: <20161101141707.GD9807@dragon>
References: <20161025211955.5345-1-gary.bisson@boundarydevices.com>
 <20161025211955.5345-4-gary.bisson@boundarydevices.com>
 <CAOMZO5Aok5w=Di0hZpr7E6PZr6rJ1Xg-xkWcB+u=7xKCT5uWvA@mail.gmail.com>
 <CAAMH-yu1oC8qaAtVwSxJxKxSmXMzMJkUeu4cUu3OB2yhDV8GBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAMH-yu1oC8qaAtVwSxJxKxSmXMzMJkUeu4cUu3OB2yhDV8GBg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 11:53:40PM +0200, Gary Bisson wrote:
> Hi Fabio,
> 
> On Tue, Oct 25, 2016 at 11:28 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi Gary,
> >
> > On Tue, Oct 25, 2016 at 7:19 PM, Gary Bisson
> > <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
> >> Declared as a regulator since the driver doesn't have a reset-gpios
> >> property for this.
> >
> > Peter Chen is working on adding USB reset-gpio property this. Please
> > check his series:
> > https://www.spinics.net/lists/arm-kernel/msg536105.html
> 
> Thanks, I wasn't aware of this series. Indeed if this power sequence
> code gets upstream soon I guess we can drop both patches about the USB
> PHY reset.

Let's wait then instead of adding something that will be removed later.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
