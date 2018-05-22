From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: rockchip: remove deprecated gate-clk code and
 dt-binding
Date: Tue, 22 May 2018 17:33:13 -0500
Message-ID: <20180522223313.GA12580@rob-hp-laptop>
References: <20180512143038.30447-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180512143038.30447-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
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
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, May 12, 2018 at 04:30:38PM +0200, Heiko Stuebner wrote:
> Initially we tried modeling clocks via the devicetree before switching
> to clocks declared in the clock drivers and only exporting specific
> ids to the devicetree.
> 
> As the old code was in the kernel for 1-2 releases when the new mode
> of operation was added we kept it for backwards compatibility.
> 
> That deprecation notice is in the binding since july 2014, so nearly
> 4 years now and I think it's time to drop the old cruft.
> 
> Especially as at the time using the mainline kernel on Rockchip devices
> was not really possible, except for experiments on the really old socs of
> the rk3066 + rk3188 line, so there shouldn't be any devicetrees still
> around that rely on that code.
> 
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  .../devicetree/bindings/clock/rockchip.txt    | 77 ---------------
>  drivers/clk/rockchip/Makefile                 |  1 -
>  drivers/clk/rockchip/clk-rockchip.c           | 98 -------------------
>  3 files changed, 176 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/rockchip.txt
>  delete mode 100644 drivers/clk/rockchip/clk-rockchip.c

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
