From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2] arm64: dts: meson: Fix mmc cd-gpio polarity
Date: Wed, 9 Jan 2019 23:14:57 +0100
Message-ID: <CAFBinCBf+yJu4z1JYNdH7B4h07-U_0ckysV_=nC65nd5ByOCvA@mail.gmail.com>
References: <1547042198-17601-1-git-send-email-lollivier@baylibre.com> <CACRpkdbhVB7-Y9EBhBC6GAxqFt8zujS2QJ4CzGDJnDMDjj2Ptg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbhVB7-Y9EBhBC6GAxqFt8zujS2QJ4CzGDJnDMDjj2Ptg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Loys Ollivier <lollivier@baylibre.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jan 9, 2019 at 7:31 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Ollivier!
>
> On Wed, Jan 9, 2019 at 2:56 PM Loys Ollivier <lollivier@baylibre.com> wrote:
>
> > Commit 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
> > changed the behavior of "cd-inverted" to follow the device tree bindings
> > specification.
> > Lines specifying "cd-inverted" are now "acitve high".
there's a typo in the description - it should be "active"

> >
> > Fix the SD card for meson by setting the cd-gpio as "active low" according
> > to the boards specifications.
> >
> > Fixes: 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
> > Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> >
> > v2: fix more occurences, also in other meson boards.
>
> This is a good change in itself since it gets rid of some occasions
> of the dreaded "cd-inverted" property. I think Martin Blumenstingl
> already sent patches like these though (I might be confused).
I sent patches for the 32-bit Amlogic SoCs
my TODO-list is now a bit longer, I'll test this series on my Khadas
VIM, VIM2 and Libretech CC during the weekend

> But we should keep the old device trees working as well.
> Can you test if Martins patch:
> https://marc.info/?l=linux-mmc&m=154637189021211&w=2
>
> Also makes your boards work?
feedback on that patch is appreciated


Regards
Martin
