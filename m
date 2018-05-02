Return-Path: <SRS0=HETZ=HV=gmail.com=k.kozlowski.k@kernel.org>
Date: Wed, 2 May 2018 19:09:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC 07/10] pinctrl: samsung: Remove support for Exynos5440
Message-ID: <20180502170937.bqnzjk4e2h3k7t4j@kozik-lap>
References: <20180424203239.21885-1-krzk@kernel.org>
 <20180424203239.21885-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180424203239.21885-8-krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 24, 2018 at 10:32:36PM +0200, Krzysztof Kozlowski wrote:
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
> 

Applied.

Best regards,
Krzysztof
