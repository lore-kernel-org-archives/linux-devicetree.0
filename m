From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arch: arm: Show the serial number from devicetree
 in cpuinfo
Date: Tue, 28 Apr 2015 17:09:11 +0100
Message-ID: <20150428160910.GE12732@n2100.arm.linux.org.uk>
References: <1429351135-11842-1-git-send-email-contact@paulk.fr>
 <1429351135-11842-2-git-send-email-contact@paulk.fr>
 <CAL_JsqKkw7n5p1ZH345BeKkyU=GKDrhaLef__0ET7t90Cm0Eog@mail.gmail.com>
 <1430145747.3081.5.camel@collins>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430145747.3081.5.camel@collins>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 27, 2015 at 04:42:27PM +0200, Paul Kocialkowski wrote:
> Well, of_property_read_string is only defined when CONFIG_OF is set
> (base.c is always built in drivers/of but the directory is only included
> when CONFIG_OF is set).
> 
> Of course, on ARM, we now expect that it is the case, but it seems like
> good practice to check for it, since it could theoretically be disabled.

That is _not_ "is the case" - there are a number of non-OF platforms...
including some which will probably never be converted.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
