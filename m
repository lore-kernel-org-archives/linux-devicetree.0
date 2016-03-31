From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 1/8] arm64: dts: rockchip: Clean up /memory nodes
Date: Thu, 31 Mar 2016 19:15:43 +0200
Message-ID: <1776429.KtRq374vTa@phil>
References: <1458136727-32075-1-git-send-email-afaerber@suse.de>
 <1458136727-32075-2-git-send-email-afaerber@suse.de>
 <2027561.JLzKLXOoFO@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <2027561.JLzKLXOoFO@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 19. M=E4rz 2016, 09:04:08 schrieb Heiko Stuebner:
> Am Mittwoch, 16. M=E4rz 2016, 14:58:39 schrieb Andreas F=E4rber:
> > A dtc update results in warnings for nodes with reg property but without
> > unit address in the node name, so rename /memory to /memory@0.
> > =

> > Signed-off-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> =

> applied to a dts64-fixes branch for 4.6, after changing the commit message
> to ----
> A dtc update results in warnings for nodes with reg property but without
> unit address in the node name, so rename /memory to /memory@startaddress
> (memory starts at 0 in the case of the rk3368).
> ----
> =

> To clarify that the @0 is not arbitary chosen.

This dtc update in question hasn't landed in v4.6-rc1 and from what I =

gathered will need some changes. The patch is obviously still correct, but =
I =

have now moved it from v4.6-fixes to the regular v4.7 64bit dts changes.


Heiko
