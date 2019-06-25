From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 5/9] dt-bindings: vendor-prefixes: add SoChip
Date: Tue, 25 Jun 2019 11:39:01 -0600
Message-ID: <CAL_Jsq+w-+cRwfAMu=kZPK=e85ujq8hu9Lh=jjf+Qy=R7C-AQA@mail.gmail.com>
References: <20190623043801.14040-1-icenowy@aosc.io> <20190623043801.14040-6-icenowy@aosc.io>
 <CACRpkdbbxgeGPh1oKfyKKOMhpXiz4sQWjZv23FbYaafCz6NyCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbbxgeGPh1oKfyKKOMhpXiz4sQWjZv23FbYaafCz6NyCQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Icenowy Zheng <icenowy@aosc.io>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 7:55 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Jun 23, 2019 at 6:39 AM Icenowy Zheng <icenowy@aosc.io> wrote:
>
> > Shenzhen SoChip Technology Co., Ltd. is a hardware vendor that produces
> > EVBs with Allwinner chips. There's also a SoC named S3 that is developed
> > by Allwinner (based on Allwinner V3/V3s) but branded SoChip.
> >
> > Add the vendor prefix for SoChip.
> >
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > No changes in v3.
> >
> > Changes in v2:
> > - Add the review tag by Rob.
>
> Should I apply this to the pinctrl tree? Rob?

I'd like to take these 2 because we have lots of vendor prefix changes
(adding a bunch of undocumented ones) this cycle.

Rob
