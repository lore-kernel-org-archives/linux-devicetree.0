From: Damian Kos <dkos-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v3 0/5] drm: add support for Cadence MHDP DPI/DP bridge.
Date: Tue, 18 Sep 2018 13:18:07 +0000
Message-ID: <CO2PR07MB255198B0CC8CD7DEA742C556CD1D0@CO2PR07MB2551.namprd07.prod.outlook.com>
References: <1535451894-2518-1-git-send-email-dkos@cadence.com>
 <11916444.D1tlAhbW8U@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <11916444.D1tlAhbW8U@phil>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Quentin Schulz <quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Artur Jedrysek <jartur-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Przemyslaw Gaj <pgaj-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Telford <stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Lukasz Tyrala <ltyrala-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWOunwaRDDq4rA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Got it.

-depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
+depends on DRM_ROCKCHIP=m
+select EXTCON

Damian
-----Original Message-----
From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> 
Sent: Thursday, September 13, 2018 14:32
To: Damian Kos <dkos-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>; Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>; Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>; Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>; Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>; Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>; Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>; Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>; Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>; Quentin Schulz <quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>; dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Przemyslaw Gaj <pgaj-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>; Lukasz Tyrala <ltyrala-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>; Scott Telford <stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>; Artur Jedrysek <jartur-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>; Piotr Sroka <piotrs-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 0/5] drm: add support for Cadence MHDP DPI/DP bridge.

EXTERNAL MAIL


Am Dienstag, 28. August 2018, 12:24:43 CEST schrieb Damian Kos:
> Hello!
> 
> This is the series of patches that will add support for the Cadence's 
> DPI/DP bridge. Please note that this is a preliminary version of the 
> driver and there will be more patches in the future with updates, fixes and improvements.
> Please keep that in mind when looking at FIXME/TODO/XXX comments.
> 
> Initially, MHDP driver was developed as a DRM bridge driver and was 
> planed to be placed in drivers/gpu/drm/bridge/mhdp.c.  However, there 
> was already a driver for Cadence's DP controller developed by 
> RockChip, but that driver uses the different DRM framework and looks like a part of a bigger system.
> Both controllers (including firmware) are quite different internally 
> (MST/FEC/DSC support, link training done by driver, additional 
> commands, IRQ's
> etc.) but they have similar register map, except for Framer/Streamer 
> (which is noticeably different), so they appear similar.
> 
> The following patches contain:
> - Moving common code to drivers/gpu/drm/bridge/cdns-mhdp-common.* and
>   modifying it a bit (mostly new prefixes for functions and data types) so it
>   can be used by two, higher level, drivers.
> - Modifying existing RockChip's DP driver to use the common code after changes
>   made to it (use the new cdns_mhdp_device structure and new function names).
> - Modifying DRM helpers a bit. Some are required for new driver, some are
>   updates from DP 1.2 to 1.3 or 1.4.
> - Adding documentation for device tree bindings.
> - Adding preliminary Cadence DPI/DP bridge driver.
> 
> Some of the things that will be added later on include (but are not 
> limited
> to):
> - Support for Cadence SD0801 PHY (PHY's driver should be on the way by 
> now)
> - MST support
> - DSC support
> - FEC support
> - HDCP support

with te Kconfig issue in patch5 fixed, this series tested on
rk3288 (analogix-dp) and rk3399 (analogix-dp + cadence-dp) Everything seems to work that worked before.

Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
