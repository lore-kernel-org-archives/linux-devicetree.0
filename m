From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: dts: rockchip: add BQ Edison 2 QC devicetree
Date: Tue, 4 Dec 2018 14:21:17 -0600
Message-ID: <20181204202117.GA24452@bogus>
References: <20181113130559.31221-1-heiko@sntech.de>
 <20181113130559.31221-7-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20181113130559.31221-7-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 13 Nov 2018 14:05:59 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
> 
> The Edison 2 Quad-Core was a Tablet device released in 2013 by MundoReader
> using a rk3188 soc. Add a devicetree for it.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
> ---
>  .../devicetree/bindings/arm/rockchip.txt      |   4 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/rk3188-bqedison2qc.dts      | 711 ++++++++++++++++++
>  3 files changed, 716 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rk3188-bqedison2qc.dts
> 

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
