From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 0/8] ARM: dts: rockchip: add Utgard Mali nodes for some socs
Date: Fri, 22 Sep 2017 11:23:27 +0200
Message-ID: <3670729.UWqOD6MBPG@phil>
References: <20170915091812.13368-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915091812.13368-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 15. September 2017, 11:18:04 CEST schrieb Heiko Stuebner:
> This adds a mali-supply similar to the Midgard binding, the
> compatibles for 3 Rockchip socs and the nodes for these.
> 
> The rk3036 and rk3188 gpus were tested, on the boards that
> get their gpus enabled, using the current Lima resurrection
> project and were able to probe the gpus sucessfully and draw
> a nice red-triangle in an off-screen application.
> 
> The only special thing Rockchip Malis do, is that all MMUs have
> a shared interrupt and all PPs also have a shared interrupt, but
> that works out well with the current binding.

applied all 8 for 4.15 with Rob's Acks for the binding changes.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
