Return-Path: <SRS0=j3wE=HP=samsung.com=cw00.choi@kernel.org>
MIME-version: 1.0
Content-transfer-encoding: 8BIT
Content-type: text/plain; charset="UTF-8"
Message-id: <5AE12441.2090506@samsung.com>
Date: Thu, 26 Apr 2018 09:58:41 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC 04/10] clk: samsung: Remove support for Exynos5440
In-reply-to: <20180424203239.21885-5-krzk@kernel.org>
References: <20180424203239.21885-1-krzk@kernel.org>
	<CGME20180424203341epcas5p3a6db7d58b0ce8940d03711823fbf6e41@epcas5p3.samsung.com>
	<20180424203239.21885-5-krzk@kernel.org>
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
>  .../devicetree/bindings/clock/exynos5440-clock.txt |  28 ----
>  drivers/clk/samsung/Makefile                       |   1 -
>  drivers/clk/samsung/clk-exynos5440.c               | 167 ---------------------
>  include/dt-bindings/clock/exynos5440.h             |  44 ------
>  4 files changed, 240 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos5440-clock.txt
>  delete mode 100644 drivers/clk/samsung/clk-exynos5440.c
>  delete mode 100644 include/dt-bindings/clock/exynos5440.h
> 

Looks good to me. Thanks.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

[snip]

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
