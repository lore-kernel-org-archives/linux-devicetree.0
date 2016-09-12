From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] misc: Add Aspeed BT IPMI host driver
Date: Mon, 12 Sep 2016 21:15:20 +0200
Message-ID: <4727554.yt7pF8chOH@wuerfel>
References: <1472664259-23933-1-git-send-email-clg@kaod.org> <c06a8afb-9143-6aef-3425-ad1e50cae35d@kaod.org> <1ce6c4b4-5938-22fc-7467-d1efc220b772@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1ce6c4b4-5938-22fc-7467-d1efc220b772-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: minyard-HInyCGIudOg@public.gmane.org
Cc: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday, September 12, 2016 1:55:40 PM CEST Corey Minyard wrote:
> On 09/02/2016 08:22 AM, Cédric Le Goater wrote:
> > Hello,
> >
> > Adding Corey in cc: . I guess I should have done that in the first place.
> 
> Yes, probably so.  I've been travelling and didn't see it on the mailing
> lists until now.
> 
> There is already a BT driver in the kernel, in drivers/char/ipmi, why
> won't that work?

The new driver is the host side (running on the BMC), the existing one
is the client (running on the PC).

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
