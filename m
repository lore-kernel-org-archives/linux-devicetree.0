From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 01/19] dt-bindings: pinctrl: mediatek: use - instead of
 _ in examples
Date: Fri, 2 Mar 2018 08:43:38 +0100
Message-ID: <CACRpkdaH+LPTv-ruNesf2D+RixYwBOxa44rwuZ8V616W5rLbXQ@mail.gmail.com>
References: <cover.1519378871.git.sean.wang@mediatek.com> <44956252092b19ece67c5a0df1492a5baeaa4dab.1519378871.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <44956252092b19ece67c5a0df1492a5baeaa4dab.1519378871.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 23, 2018 at 11:16 AM,  <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> It should be good that no use "_" is in examples. Consequently,
> those nodes in certain files which have an inappropriate name containing
> "_" are all being replaced with "-".
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: devicetree@vger.kernel.org

Patch applied.

Yours,
Linus Walleij
