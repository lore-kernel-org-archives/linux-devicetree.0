Return-Path: <SRS0=j3wE=HP=samsung.com=cw00.choi@kernel.org>
MIME-version: 1.0
Content-transfer-encoding: 8BIT
Content-type: text/plain; charset="UTF-8"
Message-id: <5AE12829.4090607@samsung.com>
Date: Thu, 26 Apr 2018 10:15:21 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC 07/10] pinctrl: samsung: Remove support for Exynos5440
In-reply-to: <20180424203239.21885-8-krzk@kernel.org>
References: <20180424203239.21885-1-krzk@kernel.org>
	<CGME20180424203539epcas2p4e099df5797adb9a49c0d49bbfc829543@epcas2p4.samsung.com>
	<20180424203239.21885-8-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On 2018년 04월 25일 05:32, Krzysztof Kozlowski wrote:
> The Exynos5440 is not actively developed, there are no development
> boards available and probably there are no real products with it.
> Remove wide-tree support for Exynos5440.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/pinctrl/samsung/Kconfig              |   10 +-
>  drivers/pinctrl/samsung/Makefile             |    1 -
>  drivers/pinctrl/samsung/pinctrl-exynos5440.c | 1005 --------------------------
>  3 files changed, 2 insertions(+), 1014 deletions(-)
>  delete mode 100644 drivers/pinctrl/samsung/pinctrl-exynos5440.c

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
