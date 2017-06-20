From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH v4 0/3] watchdog: dw_wdt: add reset lines
Date: Tue, 20 Jun 2017 09:55:22 +0200
Message-ID: <738tknf5zp.fsf@pengutronix.de>
References: <cover.50aaf23e8fbe9028f711a67e39b96910c986e8b0.1495443015.git-series.s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <cover.50aaf23e8fbe9028f711a67e39b96910c986e8b0.1495443015.git-series.s.trumtrar@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-watchdog@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, kernel@pengutronix.de, Wim Van Sebroeck <wim@iguana.be>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org


Steffen Trumtrar <s.trumtrar@pengutronix.de> writes:

> Hi!
>
> This series adds support for the reset line that is (potentially) holding
> the watchdog in reset.
>
> As the watchdog is useless if this happens, it needs to be deasserted in
> the probe function.
>
> Tested on a Socrates board.
>
> Regards,
> Steffen
>
>
> Changes since v3:
>
>   - goto out_disable_clk
>   - add Reviewed-by
>
> Changes since v2:
>
>   - use optional reset functions
>   - add Acked-by to devictree bindings
>
> Changes since v1:
>
>   - remove reset-names property
>   - remove warning if reset property is missing
>
> Steffen Trumtrar (3):
>   watchdog: bindings: dw_wdt: add reset lines
>   watchdog: dw_wdt: get reset lines from dt
>   ARM: socfpga: dtsi: add dw-wdt reset lines
>
>  Documentation/devicetree/bindings/watchdog/dw_wdt.txt |  3 +++
>  arch/arm/boot/dts/socfpga.dtsi                        |  2 ++
>  drivers/watchdog/dw_wdt.c                             | 11 +++++++++++
>  3 files changed, 16 insertions(+)
>
> base-commit: 2ea659a9ef488125eb46da6eb571de5eae5c43f6

Gentle Ping!

Is this series already applied somewhere I didn't look?


Best regards,
Steffen

-- 
Pengutronix e.K.                           | Steffen Trumtrar            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
