From: Martin Cerveny <martin-TMGNAR36iXmlVyrhU4qvOw@public.gmane.org>
Subject: Re: [2/9] phy: add Rockchip Innosilicon hdmi phy
Date: Mon, 5 Feb 2018 22:32:08 +0100 (CET)
Message-ID: <alpine.GSO.2.00.1802052159530.23549@dmz.c-home.cz>
References: <20180205143435.4723-3-heiko@sntech.de>
Reply-To: Martin Cerveny <M.Cerveny-bdq14YP6qtRg9hUCZPvPmw@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180205143435.4723-3-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
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
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, algea.cao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On Mon, 5 Feb 2018, Heiko Stuebner wrote:
> From: Zheng Yang <zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> Add a driver for the Innosilicon hdmi phy used on rk3228/rk3229
> and rk3328 socs from Rockchip.
>
> Signed-off-by: Zheng Yang <zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
> +static u32 inno_hdmi_phy_get_tmdsclk(struct inno_hdmi_phy *inno, int rate)
> +{
> +	int bus_width = phy_get_bus_width(inno->phy);
> +	u32 tmdsclk;
> +
> +	switch (bus_width) {
> +	case 4:
> +		tmdsclk = rate / 2;
> +		break;
> +	case 5:
> +		tmdsclk = rate * 5 / 8;
> +		break;
> +	case 6:
> +		tmdsclk = rate * 3 / 4;
> +		break;
> +	case 10:
> +		tmdsclk = rate * 5 / 4;
> +		break;
> +	case 12:
> +		tmdsclk = rate * 3 / 2;
> +		break;
> +	case 16:
> +		tmdsclk = rate * 2;
> +		break;
> +	default:
> +		tmdsclk = rate;
> +	}
> +
> +	return tmdsclk;
> +}

Please corrects integer overflow 
like https://github.com/mcerveny/rockchip-linux/commit/b4bc703f2dca4e5115b22155920d2277671a9f00

M.C>
