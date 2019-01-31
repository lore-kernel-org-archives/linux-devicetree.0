From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/6] mfd: Add support for the MediaTek MT6358 PMIC
Date: Thu, 31 Jan 2019 10:01:53 +0000
Message-ID: <20190131100153.GJ4701@dell>
References: <1548839891-20932-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1548839891-20932-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <CANdKZ0csqmTFj7+03yRAM25z4jGEQYQvOuSWggDY81spGqhgfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANdKZ0csqmTFj7+03yRAM25z4jGEQYQvOuSWggDY81spGqhgfA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, 31 Jan 2019, Pi-Hsun Shih wrote:

> On Wed, Jan 30, 2019 at 5:19 PM Hsin-Hsiung Wang
> <hsin-hsiung.wang@mediatek.com> wrote:
> >
> > This adds support for the MediaTek MT6358 PMIC. This is a
> > multifunction device with the following sub modules:
> >
> > - Regulator
> > - RTC
> > - Codec
> > - Interrupt
> >
> > It is interfaced to the host controller using SPI interface
> > by a proprietary hardware called PMIC wrapper or pwrap.
> > MT6358 MFD is a child device of the pwrap.
> >
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  drivers/mfd/Makefile                 |    2 +-
> >  drivers/mfd/mt6358-irq.c             |  236 +++++
> >  drivers/mfd/mt6397-core.c            |   62 +-
> >  include/linux/mfd/mt6358/core.h      |  158 +++
> >  include/linux/mfd/mt6358/registers.h | 1926 ++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/mt6397/core.h      |    3 +
> >  6 files changed, 2385 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/mfd/mt6358-irq.c
> >  create mode 100644 include/linux/mfd/mt6358/core.h
> >  create mode 100644 include/linux/mfd/mt6358/registers.h

[100's (hundreds) of lines of code cut]

> > +static const struct mfd_cell mt6358_devs[] = {
> > +       {
> > +               .name = "mt6358-regulator",
> > +               .of_compatible = "mediatek,mt6358-regulator"
> > +       }, {
> > +               .name = "mt6397-rtc",
> 
> Should this be "mt6358-rtc"?

[1000's (thousands) of lines of code cut]

When replying to a patch, especially one as large as this, you should
cut all of the irrelevant quotes.  Put another way, you should only
quote what you are replying to, and maybe a small section before/after
to keep the context.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
