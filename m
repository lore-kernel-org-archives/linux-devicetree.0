From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: rockchip: rock2: Setup usb vbus-supply
Date: Fri, 07 Apr 2017 00:23:39 +0200
Message-ID: <2204588.mS7ruK0rnT@phil>
References: <20170405140613.4444-1-sjoerd.simons@collabora.co.uk> <20170405140613.4444-3-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170405140613.4444-3-sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 5. April 2017, 16:06:11 CEST schrieb Sjoerd Simons:
> Now that the rockchip usb phy has a vbus-supply property use that to
> control the vbus regulator on rock2.
> 
> Signed-off-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

I've queued this for 4.13 .

Not eligible for 4.12, as the patch alone (when testing my tree or armsoc)
would regress the sata-bridge, due to the regulator-always-on going away.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
