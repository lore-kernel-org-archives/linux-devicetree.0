From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Remove unnecessary setting of UART0
 SCLK rate on veyron
Date: Wed, 10 Apr 2019 16:53:28 -0700
Message-ID: <CAD=FV=Xa446sRq0P=jNRHu-eqhPVpB1A-0LDoqokLi3+SYXxgg@mail.gmail.com>
References: <20190410183010.21307-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190410183010.21307-1-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Apr 10, 2019 at 11:30 AM Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> Some veyron devices have a Bluetooth controller connected on UART0.
> The UART needs to operate at a high speed, however setting the clock
> rate at initialization has no practical effect. During initialization
> user space adjusts the UART baudrate multiple times, which ends up
> changing the SCLK rate. After a successful initiatalization the clk
> is running at the desired speed (48MHz).
>
> Remove the unnecessary clock rate configuration from the DT.
>
> Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288-veyron.dtsi | 4 ----
>  1 file changed, 4 deletions(-)

Nice.  Looks like this hasn't been needed for a while.  Back in 3.14
when I first added this it was important because "8250_dw.c" didn't
have a clk_set_rate() in it, but seems like it's been there forever
now.

Reviewed-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
