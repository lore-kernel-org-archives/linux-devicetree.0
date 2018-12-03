From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 05/12] usb: dwc3: Add two quirks for Hisilicon Kirin
 Soc Platform
Date: Mon, 3 Dec 2018 10:02:49 +0200
Message-ID: <CAHp75VcbNumAGa8NsYp9tL-ZRP4stApuTFtY1LARHMnJjxA4dw@mail.gmail.com>
References: <20181203034515.91412-1-chenyu56@huawei.com> <20181203034515.91412-6-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203034515.91412-6-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: chenyu56@huawei.com
Cc: USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Stultz <john.stultz@linaro.org>, Wangbinghui <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 3, 2018 at 5:48 AM Yu Chen <chenyu56@huawei.com> wrote:
>
> There are tow quirks for DesignWare USB3 DRD Core of Hisilicon Kirin Soc.
> 1)SPLIT_BOUNDARY_DISABLE should be set for Host mode
> 2)A GCTL soft reset should be executed when switch mode

> +static void dwc3_gctl_core_soft_reset(struct dwc3 *dwc)
> +{

> +       int reg;

u32? int for register value looks confusing a bit.

> +       reg = dwc3_readl(dwc->regs, DWC3_GCTL);
> +       reg |= (DWC3_GCTL_CORESOFTRESET);
> +       dwc3_writel(dwc->regs, DWC3_GCTL, reg);
> +
> +       reg = dwc3_readl(dwc->regs, DWC3_GCTL);
> +       reg &= ~(DWC3_GCTL_CORESOFTRESET);
> +       dwc3_writel(dwc->regs, DWC3_GCTL, reg);
> +}

> +       int reg;

Ditto.

-- 
With Best Regards,
Andy Shevchenko
