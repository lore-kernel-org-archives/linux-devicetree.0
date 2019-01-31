From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH 4/6] mfd: Add support for the MediaTek MT6358 PMIC
Date: Thu, 31 Jan 2019 16:33:55 +0800
Message-ID: <1548923635.25380.4.camel@mtksdaap41>
References: <1548839891-20932-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1548839891-20932-5-git-send-email-hsin-hsiung.wang@mediatek.com>
         <CANdKZ0csqmTFj7+03yRAM25z4jGEQYQvOuSWggDY81spGqhgfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANdKZ0csqmTFj7+03yRAM25z4jGEQYQvOuSWggDY81spGqhgfA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi Pi-Hsun,

On Thu, 2019-01-31 at 11:56 +0800, Pi-Hsun Shih wrote:
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
...
> > +static const struct mfd_cell mt6358_devs[] = {
> > +       {
> > +               .name = "mt6358-regulator",
> > +               .of_compatible = "mediatek,mt6358-regulator"
> > +       }, {
> > +               .name = "mt6397-rtc",
> 
> Should this be "mt6358-rtc"?

Because MT6358 rtc uses the same rtc driver as MT6397, the name should
be "mt6397-rtc" for rtc driver probe.

Thanks a lot.
> > +               .num_resources = ARRAY_SIZE(mt6358_rtc_resources),
> > +               .resources = mt6358_rtc_resources,
> > +               .of_compatible = "mediatek,mt6358-rtc",
> > +       }, {
> > +               .name = "mt6358-sound",
> > +               .of_compatible = "mediatek,mt6358-sound"
> > +       },
> > +};
...
> > --
> > 1.9.1
> >
