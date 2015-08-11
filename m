From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH 0/5] add GPT timer support for mt8173
Date: Tue, 11 Aug 2015 23:54:02 +0800
Message-ID: <CAGS+omAeYhXDpBueG-F_gYBccqeaejN9k5bRKC78aDLfvHfnBA@mail.gmail.com>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: James Liao <jamesjj.liao@mediatek.com>, Michael Turquette <mturquette@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Russell King <linux@arm.linux.org.uk>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, srv_heupstream <srv_heupstream@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 13, 2015 at 5:32 PM, Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
> This series add GPT timer support for mt8173. This is based on v4.2-rc1
> and Matthias' next branch (for dts parts).
>
> The first 2 patches comes from 'Add SMP bringup support for mt65xx socs'
> series [1]. I decide to move these 2 patches to this series, since it
> is more relevent here. They are changed based on Matthias' and Daniel's
> comments.
>
> [1] http://lists.infradead.org/pipermail/linux-mediatek/2015-May/000714.html
>
> Daniel Kurtz (1):
>   arm64: dts: mt8173: add timer node
>
> Yingjoe Chen (4):
>   clocksource: mediatek: do not enable GPT_CLK_EVT when setup
>   clocksource: mediatek: Use GPT as sched clock source
>   arm64: mediatek: enable MTK_TIMER
>   clk: mediatek: add 13mhz clock for MT8173

Was this mediatek clocksource patch set get forgotten again?
All 5 patches have have been reviewed, and I think the ones that need
it have been Ack'ed by Matthias and/or Stephen.
What is the plan for merging them?

Thanks,
-Dan

>
>  arch/arm64/Kconfig                       |  1 +
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi |  9 +++++++++
>  drivers/clk/mediatek/clk-mt8173.c        |  5 +++++
>  drivers/clocksource/mtk_timer.c          | 26 ++++++++++++++++++++------
>  include/dt-bindings/clock/mt8173-clk.h   |  3 ++-
>  5 files changed, 37 insertions(+), 7 deletions(-)
>
