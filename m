From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: Re: [PATCH v2 2/4] phy: socionext: add USB3 PHY driver for UniPhier SoC
Date: Wed, 08 Aug 2018 09:41:37 +0900
Message-ID: <20180808094136.5509.4A936039@socionext.com>
References: <1533290045-18969-1-git-send-email-hayashi.kunihiko@socionext.com> <1533290045-18969-3-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533290045-18969-3-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, 3 Aug 2018 18:54:03 +0900 <hayashi.kunihiko@socionext.com> wrote:

> Add a driver for PHY interface built into USB3 controller
> implemented in UniPhier SoCs.
> This driver supports High-Speed PHY and Super-Speed PHY.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Signed-off-by: Motoya Tanigawa <tanigawa.motoya@socionext.com>
> Signed-off-by: Masami Hiramatsu <masami.hiramatsu@linaro.org>
> ---
>  drivers/phy/Kconfig                         |   1 +
>  drivers/phy/Makefile                        |   1 +
>  drivers/phy/socionext/Kconfig               |  12 +
>  drivers/phy/socionext/Makefile              |   6 +
>  drivers/phy/socionext/phy-uniphier-usb3hs.c | 423 ++++++++++++++++++++++++++++
>  drivers/phy/socionext/phy-uniphier-usb3ss.c | 350 +++++++++++++++++++++++
>  6 files changed, 793 insertions(+)
>  create mode 100644 drivers/phy/socionext/Kconfig
>  create mode 100644 drivers/phy/socionext/Makefile
>  create mode 100644 drivers/phy/socionext/phy-uniphier-usb3hs.c
>  create mode 100644 drivers/phy/socionext/phy-uniphier-usb3ss.c

[snip]

> +static void uniphier_u3ssphy_testio_write(struct uniphier_u3ssphy_priv *priv,
> +					  u32 data)
> +{
> +	/* need to read TESTO twice after accessing TESTI */
> +	writel(data, priv->base + SSPHY_TESTI);
> +	readl(priv->base + SSPHY_TESTI);
> +	readl(priv->base + SSPHY_TESTI);

I made a mistake here. The comment and the code are inconsistent.
I'll fix it next.

Thanks,

---
Best Regards,
Kunihiko Hayashi
