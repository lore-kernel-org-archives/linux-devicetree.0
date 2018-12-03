From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 06/12] phy: Add usb phy support for hi3660 Soc of Hisilicon
Date: Mon, 3 Dec 2018 10:14:30 +0200
Message-ID: <CAHp75Vepvab=fD-3vps_RXewrb-Nfe8947soAmbNHatS4YQR4w@mail.gmail.com>
References: <20181203034515.91412-1-chenyu56@huawei.com> <20181203034515.91412-7-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203034515.91412-7-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: chenyu56@huawei.com
Cc: USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Kishon Vijay Abraham I <kishon@ti.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, lpc.li@hisilicon.com, sunjianguo1@huawei.com, Masahiro Yamada <yamada.masahiro@socionext.com>, xuejiancheng@hisilicon.com, John Stultz <john.stultz@linaro.org>, Wangbinghui <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 3, 2018 at 5:47 AM Yu Chen <chenyu56@huawei.com> wrote:
>
> This driver handles usb phy power on and shutdown for hi3660 Soc of
> Hisilicon.

> +// SPDX-License-Identifier: GPL-2.0+

Ambigous license through the code reading.


> +#define PERI_CRG_CLK_EN4                       (0x40)
> +#define PERI_CRG_CLK_DIS4                      (0x44)
> +#define GT_CLK_USB3OTG_REF                     BIT(0)
> +#define GT_ACLK_USB3OTG                                BIT(1)
> +
> +#define PERI_CRG_RSTEN4                                (0x90)
> +#define PERI_CRG_RSTDIS4                       (0x94)
> +#define IP_RST_USB3OTGPHY_POR                  BIT(3)
> +#define IP_RST_USB3OTG                         BIT(5)
> +
> +#define PERI_CRG_ISODIS                                (0x148)
> +#define USB_REFCLK_ISO_EN                      BIT(25)
> +
> +#define PCTRL_PERI_CTRL3                       (0x10)
> +#define PCTRL_PERI_CTRL3_MSK_START             (16)
> +#define USB_TCXO_EN                            BIT(1)
> +
> +#define PCTRL_PERI_CTRL24                      (0x64)
> +#define SC_CLK_USB3PHY_3MUX1_SEL               BIT(25)
> +
> +#define USBOTG3_CTRL0                          (0x00)
> +#define SC_USB3PHY_ABB_GT_EN                   BIT(15)
> +
> +#define USBOTG3_CTRL2                          (0x08)
> +#define USBOTG3CTRL2_POWERDOWN_HSP             BIT(0)
> +#define USBOTG3CTRL2_POWERDOWN_SSP             BIT(1)
> +
> +#define USBOTG3_CTRL3                          (0x0C)
> +#define USBOTG3_CTRL3_VBUSVLDEXT               BIT(6)
> +#define USBOTG3_CTRL3_VBUSVLDEXTSEL            BIT(5)
> +
> +#define USBOTG3_CTRL4                          (0x10)
> +
> +#define USBOTG3_CTRL7                          (0x1c)
> +#define REF_SSP_EN                             BIT(16)
> +
> +#define HI3660_USB_DEFAULT_PHY_PARAM           (0x1c466e3)

A lot of redundant parens.

> +static const struct of_device_id hi3660_phy_of_match[] = {
> +       {.compatible = "hisilicon,hi3660-usb-phy",},
> +       { },

No comma needed.

> +};

-- 
With Best Regards,
Andy Shevchenko
