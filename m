From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] mmc: dt-bindings: Add reg/source_cg/latch-ck for
 Mediatek MMC bindings
Date: Fri, 22 Sep 2017 13:25:52 +0200
Message-ID: <CACRpkdaco5XnWK-gAdGLWFZtjqnM16iT424ist5Zmd3RyAXAEQ@mail.gmail.com>
References: <1505958774-14410-1-git-send-email-chaotian.jing@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1505958774-14410-1-git-send-email-chaotian.jing@mediatek.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Chaotian Jing <chaotian.jing@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, yong mao <yong.mao@mediatek.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Heiner Kallweit <hkallweit1@gmail.com>, Phong LE <ple@baylibre.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 3:52 AM, Chaotian Jing
<chaotian.jing@mediatek.com> wrote:

> +- mediatek,latch-ck: Some projects do not support enhance_rx, need set correct latch-ck to avoid data crc
> +                    error caused by stop clock(fifo full)

I think I wrote elsewhere: replace "projects" with "systems" or "SoCs".

Yours,
Linus Walleij
