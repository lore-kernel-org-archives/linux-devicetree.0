From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 0/4] pinctrl: samsung: Add support for Exynos4x12 SoCs
Date: Tue, 30 Oct 2012 08:28:12 +0530
Message-ID: <CAJuYYwQ=RQt=9z2jSOYWEv4YJS8jsE0y3Y5bVhhbRPt-dsDMiQ@mail.gmail.com>
References: <1351089457-8205-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1351089457-8205-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com, linus.walleij@linaro.org, swarren@wwwdotorg.org
List-Id: devicetree@vger.kernel.org

On 24 October 2012 20:07, Tomasz Figa <t.figa@samsung.com> wrote:
> This patch series adds pinctrl support for SoCs from Exynos4x12 family.
>
> First two patches make necessary preperations to skip legacy GPIO and
> GPIO interrupt registration in case of Exynos4x12 SoCs which are not
> supported by legacy (non-DT) code.
>
> Third patch adds Exynos4x12-specific definitions to pinctrl-samsung driver.
>
> Fourth patch adds device nodes for pin controllers available on Exynos4x12
> SoCs to Exynos4x12 device tree sources.
>
> This series depends on:
>   - [PATCH] ARM: dts: exynos4: Add support for Exynos4x12 SoCs
>
> Tomasz Figa (4):
>   ARM: EXYNOS: Skip wakeup-int setup if pinctrl driver is used on
>     Exynos4x12
>   gpio: samsung: Skip registration if pinctrl driver is present on
>     Exynos4x12
>   pinctrl: samsung: Add support for Exynos4x12
>   ARM: dts: exynos4x12: Add nodes for pin controllers
>
>  .../bindings/pinctrl/samsung-pinctrl.txt           |   1 +
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi          | 965 +++++++++++++++++++++
>  arch/arm/boot/dts/exynos4x12.dtsi                  |  38 +
>  arch/arm/mach-exynos/common.c                      |   7 +-
>  drivers/gpio/gpio-samsung.c                        |  43 +-
>  drivers/pinctrl/pinctrl-exynos.c                   | 110 +++
>  drivers/pinctrl/pinctrl-samsung.c                  |   2 +
>  drivers/pinctrl/pinctrl-samsung.h                  |   1 +
>  8 files changed, 1144 insertions(+), 23 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
>
> --
> 1.7.12
>

For this series:
Acked-by: Thomas Abraham <thomas.abraham@linaro.org>
