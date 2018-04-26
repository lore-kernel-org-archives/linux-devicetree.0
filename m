Return-Path: <SRS0=j3wE=HP=samsung.com=cw00.choi@kernel.org>
MIME-version: 1.0
Content-transfer-encoding: 8BIT
Content-type: text/plain; charset="UTF-8"
Message-id: <5AE12E4A.90907@samsung.com>
Date: Thu, 26 Apr 2018 10:41:30 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC 06/10] thermal: samsung: Remove support for Exynos5440
In-reply-to: <20180424203239.21885-7-krzk@kernel.org>
References: <20180424203239.21885-1-krzk@kernel.org>
	<CGME20180424203603epcas5p4cdd2039eabe7039e4daf286ed4c1ecc0@epcas5p4.samsung.com>
	<20180424203239.21885-7-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Hi Krzysztof,

On 2018년 04월 25일 05:32, Krzysztof Kozlowski wrote:
> The Exynos5440 is not actively developed, there are no development
> boards available and probably there are no real products with it.
> Remove wide-tree support for Exynos5440.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/thermal/exynos-thermal.txt |  14 +-
>  drivers/thermal/samsung/exynos_tmu.c               | 155 +--------------------
>  drivers/thermal/samsung/exynos_tmu.h               |   1 -
>  3 files changed, 4 insertions(+), 166 deletions(-)


After applied this patch, I tested the build and found out
'exynos5440' keyword. There is one comment including 'exynos5440' as following:

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index f92f470bce21..cb525228cfe1 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -943,7 +943,7 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
         * Exynos3250, Exynos4412, Exynos5250 and Exynos5260 incorrectly
         * states that INTCLEAR register has a different placing of bits
         * responsible for FALL IRQs than INTSTAT register.  Exynos5420
-        * and Exynos5440 documentation is correct (Exynos4210 doesn't
+        * documentation is correct (Exynos4210 doesn't
         * support FALL IRQs at all).
         */
        writel(val_irq, data->base + tmu_intclear);

After removing it, looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
