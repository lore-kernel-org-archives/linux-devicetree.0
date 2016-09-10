From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 0/8] ARM: dts: rockchip: Remove skeleton.dtsi usage and fix memory node DTC warnings
Date: Sat, 10 Sep 2016 23:51:36 +0200
Message-ID: <3454871.4xYDbdxxdl@phil>
References: <1473429669-6185-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473429669-6185-1-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Javier,

Am Freitag, 9. September 2016, 10:01:01 CEST schrieb Javier Martinez Canillas:
> This series removes the inclusion of the skeleton.dtsi in all the Rockchip
> dts, which allows to get rid of the DTC warnings about a mismatch between
> the memory nodes' unit names and reg properties.
> 
> Patches are pretty trivial and shouldn't cause functional changes AFAIK,
> but were only built tested and dtbs compared with scripts/dtc/dtx_diff.

applied all 8 to my dts branch (for 4.9 but might get delayed to 4.10 ... not 
sure yet)


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
