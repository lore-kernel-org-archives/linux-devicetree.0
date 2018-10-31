From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] Add Pinctrl and GPIO support for HI3670 SoC
Date: Wed, 31 Oct 2018 10:43:00 +0100
Message-ID: <CACRpkdbMSYt5aH9fwRijtO=VG1nLAnfxTsfxGza+_Z2iGj2+-A@mail.gmail.com>
References: <20181023190655.12004-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181023190655.12004-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Xu Wei <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 23, 2018 at 9:07 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> This patchset adds Pinctrl and GPIO support for HI3670 SoC from HiSilicon
> found in the HiKey970 developement board. Also, the remaining UARTs are
> enabled and GPIO line names are added based on the Schematics and the
> 96Boards Consumer Edition spec.
>
> Note: These patches are based on the below common clk patches pushed
> earlier:
>
> arm64: dts: hisilicon: Add clock nodes for Hi3670 SoC
> arm64: dts: hisilicon: Source SoC clock for UART6

All looks good to me.
Acked-by: Linus Walleij <linus.walleij@linaro.org>
for the series.

Yours,
Linus Walleij
