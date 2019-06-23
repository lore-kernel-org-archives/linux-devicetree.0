From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH V2 2/3] clocksource: imx-sysctr: Add of_clk skip option
Date: Sun, 23 Jun 2019 14:17:31 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1906231413110.32342@nanos.tec.linutronix.de>
References: <20190623120434.19556-1-Anson.Huang@nxp.com> <20190623120434.19556-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623120434.19556-2-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, l.stach@pengutronix.de, abel.vesa@nxp.com, ccaione@baylibre.com, angus@akkea.ca, andrew.smirnov@gmail.com, agx@sigxcpu.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Sun, 23 Jun 2019, Anson.Huang@nxp.com wrote:

Again the short summary could be more informative. Instead of 'Add foo' you
could say:

    .....: Make timer work with platform driver model

That sums up the real meat of the patch. 'Add some option' is pretty
uninformative.

> On some i.MX8M platforms, clock driver uses platform driver
> model and it is NOT ready during timer initialization phase,
> the clock operations will fail and system counter driver will
> fail too. As all the i.MX8M platforms' system counter clock
> are from OSC which is always enabled, so it is no need to enable
> clock for system counter driver, the ONLY thing is to pass
> clock frequence to driver.
> 
> This patch adds an option of skipping of_clk operation for
> system counter driver, an optional property "clock-frequency"
> is introduced to pass the frequency value to system counter
> driver and indicate driver to skip of_clk operations.

The comments to the changelog of patch 1 apply here as well :)

Hint: 'This patch'

Thanks,

	tglx
