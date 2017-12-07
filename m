From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: meson-axg: add clock DT info for Meson AXG SoC
Date: Wed, 06 Dec 2017 16:50:02 -0800
Message-ID: <7ho9nbmked.fsf@baylibre.com>
References: <20171201012452.27086-1-yixun.lan@amlogic.com>
        <20171201012452.27086-5-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171201012452.27086-5-yixun.lan@amlogic.com> (Yixun Lan's
        message of "Fri, 1 Dec 2017 09:24:52 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Yixun Lan <yixun.lan@amlogic.com> writes:

> From: Qiufang Dai <qiufang.dai@amlogic.com>
>
> Try to add Hiubus DT info, and also enable clock DT info
> for the Amlogic's Meson-AXG SoC.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Qiufang Dai <qiufang.dai@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index b932a784b02a..36a2e98338a8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/axg-clkc.h>

This #include will cause an unnessary dependency from the amlogic tree
to the clock tree even though this patch is not currently using any of
the #defines from that header.  It will simplify the dependencies if you
drop this #include from this patch.

In my comment on the cover letter, I suggested adding a patch that also
switches the UART over to the new clock provider.  That is the patch
that should add this #include, since it will actually need #defines from
the header.

Doing it in that order means that we could merge this patch
independently of the clock driver, and then merge the UART switch-over
patch only after the driver (and headers) are merged.

Kevin
