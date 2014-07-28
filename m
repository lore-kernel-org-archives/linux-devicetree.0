From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 2/2] V4 ARM: mvebu: Added dts defintion for Lenovo
 Iomega ix4-300d NAS
Date: Mon, 28 Jul 2014 10:30:42 -0400
Message-ID: <20140728143042.GS23220@titan.lakedaemon.net>
References: <1406503839-4662-1-git-send-email-yahoo@perenite.com>
 <20140728140805.GQ23220@titan.lakedaemon.net>
 <02CE8576-5CD8-4AA5-971E-85CBC8CE05D3@perenite.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <02CE8576-5CD8-4AA5-971E-85CBC8CE05D3-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Masson <benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Cc: Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Benoit,

On Mon, Jul 28, 2014 at 04:13:59PM +0200, Benoit Masson wrote:
> Just one question is how would you link this patch to the quirk a0
> patch since this patch can't work without it ...

Even though both patches are needed to boot successfully, there is no
dependency between them in order to compile.  So, they will live in
separate branches until those branches get merged together in a final
release.

The code changes will be applied as a fix to v3.16, and the dts change
will, hopefully, make it in to v3.17.  Where v3.17 will already contain
the code fixes.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
