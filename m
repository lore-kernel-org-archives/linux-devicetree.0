From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/3] arm64: alpine: select AL_POS
Date: Mon, 9 Sep 2019 11:40:19 +0200
Message-ID: <CAK8P3a0DEMeFWK+RuAdSLyDYduWWwj9DxP_Beipays-d_6ixnA@mail.gmail.com>
References: <1568020220-7758-1-git-send-email-talel@amazon.com> <1568020220-7758-4-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568020220-7758-4-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Miller <davem@davemloft.net>, gregkh <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Maxime Ripard <mripard@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, paul.kocialkowski@bootlin.com, mjourdan@baylibre.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, DTML <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>David
List-Id: devicetree@vger.kernel.org

On Mon, Sep 9, 2019 at 11:14 AM Talel Shenhar <talel@amazon.com> wrote:
>
> Amazon's Annapurna Labs SoCs uses al-pos driver, enable it.
>
> Signed-off-by: Talel Shenhar <talel@amazon.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 4778c77..bd86b15 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -25,6 +25,7 @@ config ARCH_SUNXI
>  config ARCH_ALPINE
>         bool "Annapurna Labs Alpine platform"
>         select ALPINE_MSI if PCI
> +       select AL_POS
>         help
>           This enables support for the Annapurna Labs Alpine
>           Soc family.

Generally I think this kind of thing should go into the defconfig
rather than being hard-selected. There might be users that
want to not enable the driver.

       Arnd
