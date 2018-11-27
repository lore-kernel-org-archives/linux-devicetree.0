From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM: dts: rockchip: Add BQ Edison2 QuadCore tablet
Date: Tue, 27 Nov 2018 15:14:07 +0100
Message-ID: <1759618.CptkHEOS8g@phil>
References: <20181113130559.31221-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20181113130559.31221-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 13. November 2018, 14:05:53 CET schrieb Heiko Stuebner:
> Add a devicetree for the BQ Edison2 tablet from MundoReader.
> Incidentially this is the device I wanted to run mainline Linux
> on when starting the Rockchip port - thinking, "this can't take
> thaaat long" ;-) - so I've come somewhat full-circle now.
> 
> With Lima it can also use gpu acceleration for gles2.
> 
> Notable absent peripherals are the touchscreen (ft5606),
> IT66121 hdmi bridge (internal panel is working nicely) and sound.
> All areas I'm still trying to get working.
> 
> The series includes some smallish cleanups before the board
> with cleaning up the cpu-core nodes being a big part.
> 
> And there are a number of driver-side additions pending that
> should get accepted before the board itself can go in.
> (bq24196, Innolux panel, tmp108-interrupt).
> 
> 
> Heiko Stuebner (6):
>   ARM: dts: rockchip: add #sound-dai-cells to Cortex-A9 i2s
>   ARM: dts: rockchip: convert rk3188 to opp-v2
>   ARM: dts: rockchip: add cpu-core resets for rk3188
>   ARM: dts: rockchip: add phandles to secondary cpu cores
>   ARM: dts: rockchip: update cpu supplies on rk3188

applied the general cleanups from patch 1-5 for 4.21 now.


>   ARM: dts: rockchip: add BQ Edison 2 QC devicetree

this one gets a bit more time for possible dt-maintainer Review of the
small binding addition.
