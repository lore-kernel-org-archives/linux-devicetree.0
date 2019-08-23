From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 06/11] pinctrl: mediatek: add pinctrl support for
 MT6779 SoC
Date: Fri, 23 Aug 2019 10:59:08 +0200
Message-ID: <CACRpkdbZY2vZBaEXDMsjLxA1NGYWirhCdspu0W-foXJX=Fd4yg@mail.gmail.com>
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com>
 <1566206502-4347-7-git-send-email-mars.cheng@mediatek.com> <CAGp9LzoVwNxY8Q3G4hxpa7=orsEox+J0mNamag70wyjrGvDiZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGp9LzoVwNxY8Q3G4hxpa7=orsEox+J0mNamag70wyjrGvDiZw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@kernel.org>
Cc: Mars Cheng <mars.cheng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Boyd <sboyd@kernel.org>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, lkml <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com, mtk01761 <wendell.lin@mediatek.com>, linux-clk <linux-clk@vger.kernel.org>, Andy Teng <andy.teng@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 8:12 PM Sean Wang <sean.wang@kernel.org> wrote:
> On Mon, Aug 19, 2019 at 2:22 AM Mars Cheng <mars.cheng@mediatek.com> wrote:
> >
> > This adds MT6779 pinctrl driver based on MediaTek pinctrl-paris core.
> >
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> > Signed-off-by: Andy Teng <andy.teng@mediatek.com>
>
> Acked-by: Sean Wang <sean.wang@kernel.org>

Please look at the DT bindings as well when you have time, and
especially the "virtual GPIO" patch, I don't understand that at all.

I suspect the "virtual GPIO" is maybe more about something that
should be done by setting up the valid_mask in the gpio_chip
or something.

Yours,
Linus Walleij
