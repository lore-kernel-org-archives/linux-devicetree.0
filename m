From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: mvebu: Added dts defintion for Lenovo Iomega
 ix4-300d NAS
Date: Thu, 24 Jul 2014 00:58:41 +0200
Message-ID: <20140723225841.GD28485@lunn.ch>
References: <1406154923-13612-1-git-send-email-yahoo@perenite.com>
 <1406154923-13612-2-git-send-email-yahoo@perenite.com>
 <20140723224236.GC28485@lunn.ch>
 <94F87063-D717-435B-B7C5-EDAC9B26742C@perenite.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <94F87063-D717-435B-B7C5-EDAC9B26742C-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Masson <benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
List-Id: devicetree@vger.kernel.org

> For the marvell,mv78230-a0-i2c unfortunately i've spend 3 hours
> trying to understand this but it only works with this on the
> ix4-300d :(. There was multiple patch around this and maybe one
> broke the auto-detect part of this, I've tried compiling with some
> 3.10 or lower kernel but no luck here I still have to put this a0
> option.

Lets first confirm you have an a0 SoC.

At boot time, it should print:

pr_info("MVEBU SoC ID=0x%X, Rev=0x%X\n", soc_dev_id, soc_rev);

What revision do you have?

If the auto detect code really is broken, Gregory will likely take a
look.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
