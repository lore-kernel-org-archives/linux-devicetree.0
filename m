From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 4/7] clocksource/cadence_ttc: Adjust interval in clock
 notifier
Date: Tue, 12 Nov 2013 17:29:45 +0100
Message-ID: <52825779.2050106@linaro.org>
References: <1383945677-29674-1-git-send-email-soren.brinkmann@xilinx.com> <1383945677-29674-5-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383945677-29674-5-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/08/2013 10:21 PM, Soren Brinkmann wrote:
> The clockevent has to be reprogrammed if the timer's input
> clock frequency changes and the timer is in periodic mode, in order t=
o
> maintain the correct timer interval.
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>   drivers/clocksource/cadence_ttc_timer.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clocks=
ource/cadence_ttc_timer.c
> index a92350b55d32..68a336038d8f 100644
> --- a/drivers/clocksource/cadence_ttc_timer.c
> +++ b/drivers/clocksource/cadence_ttc_timer.c
> @@ -338,6 +338,10 @@ static int ttc_rate_change_clockevent_cb(struct =
notifier_block *nb,
>   		/* update cached frequency */
>   		ttc->freq =3D ndata->new_rate;
>
> +		if (ttcce->ce.mode =3D=3D CLOCK_EVT_MODE_PERIODIC)
> +			ttc_set_interval(ttc, DIV_ROUND_CLOSEST(ttc->freq,
> +						PRESCALE * HZ));
> +

Couldn't be racy ?

>   		/* fall through */
>   	}
>   	case PRE_RATE_CHANGE:
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
