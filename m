From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: cygnus defconfig : Initial defconfig for Broadcom Cygnus SoC
Date: Wed, 08 Oct 2014 09:58:12 +0200
Message-ID: <1996601.jhvNxNYxnl@wuerfel>
References: <1412746025-11998-5-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412746025-11998-5-git-send-email-sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 07 October 2014 22:27:03 Scott Branden wrote:
> From: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> 
> Tested-by: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: JD (Jiandong) Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Do you actually need a separate defconfig?

If possible, just add your drivers to multi_v7_defconfig, otherwise
include a justification in the patch changelog why your platform
should have its own defconfig file.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
