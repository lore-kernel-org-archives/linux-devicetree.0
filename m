From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 0/5] Add Pinctrl and GPIO support for HI3670 SoC
Date: Mon, 12 Nov 2018 12:47:08 +0530
Message-ID: <20181112071708.GA6689@mani>
References: <20181023190655.12004-1-manivannan.sadhasivam@linaro.org>
 <CACRpkdbMSYt5aH9fwRijtO=VG1nLAnfxTsfxGza+_Z2iGj2+-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbMSYt5aH9fwRijtO=VG1nLAnfxTsfxGza+_Z2iGj2+-A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com
Cc: linus.walleij@linaro.org, Rob Herring <robh+dt@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 31, 2018 at 10:43:00AM +0100, Linus Walleij wrote:
> On Tue, Oct 23, 2018 at 9:07 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> 
> > This patchset adds Pinctrl and GPIO support for HI3670 SoC from HiSilicon
> > found in the HiKey970 developement board. Also, the remaining UARTs are
> > enabled and GPIO line names are added based on the Schematics and the
> > 96Boards Consumer Edition spec.
> >
> > Note: These patches are based on the below common clk patches pushed
> > earlier:
> >
> > arm64: dts: hisilicon: Add clock nodes for Hi3670 SoC
> > arm64: dts: hisilicon: Source SoC clock for UART6
> 
> All looks good to me.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> for the series.
>

Hi Wei,

Any update on this patchset?

Thanks,
Mani
 
> Yours,
> Linus Walleij
