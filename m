From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: fix dual-edge code defect
Date: Tue, 31 May 2016 10:13:35 +0200
Message-ID: <CACRpkdYWEpVetL=YXs-FjaHUob6U6WjJspmiJYaGR8NPMjh6zA@mail.gmail.com>
References: <1463815419-11719-1-git-send-email-hongkun.cao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1463815419-11719-1-git-send-email-hongkun.cao@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
To: hongkun.cao@mediatek.com
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, Erin Lo <erin.lo@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, srv_heupstream@mediatek.com, Hongzhou Yang <hongzhou.yang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, inux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 21, 2016 at 9:23 AM,  <hongkun.cao@mediatek.com> wrote:

> From: "hongkun.cao" <hongkun.cao@mediatek.com>
>
> When a dual-edge irq is triggered, an incorrect irq will be reported on
> condition that the external signal is not stable and this incorrect irq
> has been registered.
> Correct the register offset.
>
> Signed-off-by: hongkun.cao <hongkun.cao@mediatek.com>

Patch applied for fixes with Matthias' review tag.

Yours,
Linus Walleij
