From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 5/7] pinctrl: mediatek: remove unused fields in struct mtk_eint_hw
Date: Thu, 24 May 2018 09:40:31 +0200
Message-ID: <CACRpkdYD-N7uLOZmYSKaTJpsa+8N3KStVRpKfR45j2OFveNveQ@mail.gmail.com>
References: <cover.1526835466.git.sean.wang@mediatek.com> <72462fb7aab16463a42066998ac3b4bf35ada416.1526835466.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <72462fb7aab16463a42066998ac3b4bf35ada416.1526835466.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, May 20, 2018 at 7:01 PM,  <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> The .name field has been not being used in existent code logic, so
> it's better that we remove them all.
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Patch applied.

Yours,
Linus Walleij
