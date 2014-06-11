From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v8 2/7] clocksource: Add support for the Mediatek SoCs
Date: Wed, 11 Jun 2014 20:14:02 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1406112012460.5170@nanos>
References: <1402490055-15197-1-git-send-email-matthias.bgg@gmail.com> <1402490055-15197-3-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1402490055-15197-3-git-send-email-matthias.bgg@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, grant.likely@linaro.org, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, heiko.stuebner@bq.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, arnd@arndb.de, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, soren.brinkmann@xilinx.com, shawn.guo@freescale.com, anders.berg@lsi.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 11 Jun 2014, Matthias Brugger wrote:
> +static void mtk_clkevt_mode(enum clock_event_mode mode,
> +				struct clock_event_device *clk)
> +{
> +	struct mtk_clock_event_device *evt = to_mtk_clk(clk);
> +
> +	mtk_clkevt_time_stop(evt, GPT_CLK_EVT);
> +
> +	switch (mode) {
> +	case CLOCK_EVT_MODE_PERIODIC:
> +		mtk_clkevt_time_setup(evt, evt->ticks_per_jiffy, GPT_CLK_EVT);
> +		mtk_clkevt_time_start(evt, true, GPT_CLK_EVT);
> +		break;
> +	case CLOCK_EVT_MODE_ONESHOT:
> +		mtk_clkevt_time_start(evt, false, GPT_CLK_EVT);

Why start the timer here? The code will call set next event right away.

> +		break;
> +	case CLOCK_EVT_MODE_UNUSED:
> +	case CLOCK_EVT_MODE_SHUTDOWN:
> +	default:
> +		/* No more interrupts will occur as source is disabled */
> +		break;
> +	}
> +}

Looks good otherwise.

Thanks,

	tglx
