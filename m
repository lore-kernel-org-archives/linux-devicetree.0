From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] phy: usbphy: Add dt documentation for Broadcom Cygnus USB PHY driver
Date: Wed, 11 Mar 2015 22:47:30 +0100
Message-ID: <3142298.YeoA7WAayD@wuerfel>
References: <1424200821-16368-1-git-send-email-arun.ramamurthy@broadcom.com> <2079271.sEacVGN4vm@wuerfel> <5500B5B6.50609@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5500B5B6.50609-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 11 March 2015 14:37:58 Arun Ramamurthy wrote:
> On 15-03-10 01:27 PM, Arnd Bergmann wrote:
> > On Wednesday 25 February 2015 16:24:06 Arun Ramamurthy wrote:
> >>>>> Should I run this by Alan Stern?
> >>>>
> >>>> I've added him to Cc here. He clearly didn't know the background about
> >>>> the DT binding change, and should not need to, but he may have an opinion
> >>>> on what names we should use.
> >>>>
> >>>
> >> Arnd, should I re patch the ehci-platform driver to avoid phy-names
> >> entirely? Alan, if not do you have an opinion on what the usb phy names
> >> should be? The current patch uses "usbp" + port number such as "usbp0" ,
> >> "usbp1" etc
> >
> > I think avoiding the phy names would be best here, but it requires a
> > kernel API change first, because we do not have a way to get a phy
> > by index as we do for other subsystems (e.g. clocks or gpios).
> >
> Arnd , there is an existing api _of_phy_get that gets a phy by index. 
> However it is not exported and is called from of_phy_get which is in 
> turn called from devm_of_phy_get.
> 
> My plan is to create a new function maybe devm_of_phy_get_by_index that 
> calls _of_phy_get directly? What are your thoughts?

Sounds good to me.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
