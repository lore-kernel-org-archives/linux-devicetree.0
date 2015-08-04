From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 1/7] clocksource: mips-gic: Enable the clock before
 using it
Date: Tue, 04 Aug 2015 11:23:59 +0200
Message-ID: <55C084AF.7060606@linaro.org>
References: <1438005618-27003-1-git-send-email-govindraj.raja@imgtec.com> <1438005618-27003-2-git-send-email-govindraj.raja@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
        format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1438005618-27003-2-git-send-email-govindraj.raja@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Govindraj Raja <govindraj.raja@imgtec.com>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Andrew Bresticker <abrestic@chromium.org>, James Hartley <James.Hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
List-Id: devicetree@vger.kernel.org

On 07/27/2015 04:00 PM, Govindraj Raja wrote:
> From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
>
> For the clock to be used (e.g. get its rate through clk_get_rate)
> it should be prepared and enabled first.
>
> Also, while the clock is enabled the driver must hold a reference to =
it,
> so let's remove the call to clk_put.
>
> Reviewed-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>   drivers/clocksource/mips-gic-timer.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksour=
ce/mips-gic-timer.c
> index b81ed1a..913585d 100644
> --- a/drivers/clocksource/mips-gic-timer.c
> +++ b/drivers/clocksource/mips-gic-timer.c
> @@ -158,8 +158,13 @@ static void __init gic_clocksource_of_init(struc=
t device_node *node)
>
>   	clk =3D of_clk_get(node, 0);
>   	if (!IS_ERR(clk)) {
> +		if (clk_prepare_enable(clk) < 0) {
> +			pr_err("GIC failed to enable clock\n");
> +			clk_put(clk);
> +			return;
> +		}
> +
>   		gic_frequency =3D clk_get_rate(clk);
> -		clk_put(clk);
>   	} else if (of_property_read_u32(node, "clock-frequency",
>   					&gic_frequency)) {
>   		pr_err("GIC frequency not specified.\n");
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
