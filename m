From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/6] arm64: dts: rockchip: Fix rk3399-roc-pc pwm2 pin
Date: Sun, 29 Sep 2019 23:21:34 +0200
Message-ID: <6797961.eJj5WIFbM9@phil>
References: <20190919052822.10403-1-jagan@amarulasolutions.com>
 <20190919052822.10403-2-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190919052822.10403-2-jagan@amarulasolutions.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Da Xue <da@lessconfused.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Akash Gajjar <akash@openedev.com>, Levin Du <djw@t-chip.com.cn>, linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jagan,

Am Donnerstag, 19. September 2019, 07:28:17 CEST schrieb Jagan Teki:
> ROC-PC is not able to boot linux console if PWM2_d is
> unattached to any pinctrl logic.
> 
> To be precise the linux boot hang with last logs as,
> ...
> .....
> [    0.003367] Console: colour dummy device 80x25
> [    0.003788] printk: console [tty0] enabled
> [    0.004178] printk: bootconsole [uart8250] disabled
> 
> In ROC-PC the PWM2_d pin is connected to LOG_DVS_PWM of
> VDD_LOG. So, for normal working operations this needs to
> active and pull-down.
> 
> This patch fix, by attaching pinctrl active and pull-down
> the pwm2.

This looks highly dubious on first glance. The pwm subsystem nor
the Rockchip pwm driver do not do any pinctrl handling.

So I don't really see where that "active" pinctrl state is supposed
to come from.

Comparing with the pwm driver in the vendor tree I see that there
is such a state defined there. But that code there also looks strange
as that driver never again leaves this active state after entering it.

Also for example all the Gru devices run with quite a number of pwm-
regulators without needing additional fiddling with the pwm itself, so
I don't really see why that should be different here.

Heiko

> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts
> index 19f7732d728c..c53f3d571620 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts
> @@ -548,6 +548,8 @@
>  };
>  
>  &pwm2 {
> +	pinctrl-names = "active";
> +	pinctrl-0 = <&pwm2_pin_pull_down>;
>  	status = "okay";
>  };
>  
> 
