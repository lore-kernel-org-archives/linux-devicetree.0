Return-Path: <SRS0=HETZ=HV=gmail.com=k.kozlowski.k@kernel.org>
Date: Wed, 2 May 2018 19:07:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC 01/10] ARM: dts: exynos: Remove Exynos5440
Message-ID: <20180502170751.5ci6hgvtlytwyvqh@kozik-lap>
References: <20180424203239.21885-1-krzk@kernel.org>
 <20180424203239.21885-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180424203239.21885-2-krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 24, 2018 at 10:32:30PM +0200, Krzysztof Kozlowski wrote:
> The Exynos5440 (quad-core A15 with GMAC, PCIe, SATA) was targeting
> server platforms but it did not make it to the market really.  There are
> no development boards with it and probably there are no real products
> neither.  The development for Exynos5440 ended in 2013 and since then
> the platform is in maintenance mode.
> 
> Remove all Device Tree sources for Exynos5440, as first step of removal
> of the platform to simplify the code and drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/arm/samsung/samsung-boards.txt        |   2 -
>  arch/arm/boot/dts/Makefile                         |   2 -
>  arch/arm/boot/dts/exynos5440-sd5v1.dts             |  42 ---
>  arch/arm/boot/dts/exynos5440-ssdk5440.dts          |  81 -----
>  arch/arm/boot/dts/exynos5440-tmu-sensor-conf.dtsi  |  20 --
>  arch/arm/boot/dts/exynos5440-trip-points.dtsi      |  21 --
>  arch/arm/boot/dts/exynos5440.dtsi                  | 355 ---------------------
>  7 files changed, 523 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/exynos5440-sd5v1.dts
>  delete mode 100644 arch/arm/boot/dts/exynos5440-ssdk5440.dts
>  delete mode 100644 arch/arm/boot/dts/exynos5440-tmu-sensor-conf.dtsi
>  delete mode 100644 arch/arm/boot/dts/exynos5440-trip-points.dtsi
>  delete mode 100644 arch/arm/boot/dts/exynos5440.dtsi
> 

Applied.

Best regards,
Krzysztof
