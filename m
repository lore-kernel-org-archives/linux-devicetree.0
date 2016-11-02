From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] ipmi/bt-bmc: change compatible node to 'aspeed,ast2400-ibt-bmc'
Date: Wed, 2 Nov 2016 14:15:50 +0100
Message-ID: <201611021415.51081.arnd@arndb.de>
References: <1478073426-3714-1-git-send-email-clg@kaod.org> <1478073426-3714-2-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478073426-3714-2-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 02 November 2016, Cédric Le Goater wrote:
> The Aspeed SoCs have two BT interfaces : one is IPMI compliant and the
> other is H8S/2168 compliant.
> 
> The current ipmi/bt-bmc driver implements the IPMI version and we
> should reflect its nature in the compatible node name using
> 'aspeed,ast2400-ibt-bmc' instead of 'aspeed,ast2400-bt-bmc'. The
> latter should be used for a H8S interface driver if it is implemented
> one day.
> 
> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>

We generally try to avoid changing the compatible strings after the
fact, but it's probably ok in this case.

I don't understand who decides which of the two interfaces is used:
is it the same register set that can be driven by either one or the
other driver, or do you expect to have two drivers that can both
be active in the same system and talk to different hardware once
you get there?

If the first one of these is true, it seems a little awkward to
use the DT compatible string to decide which driver to use rather
than making the decision in the OS.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
