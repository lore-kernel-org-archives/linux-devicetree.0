From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 0/3] add GPT timer support for mt8173
Date: Mon, 12 Oct 2015 18:35:07 +0200
Message-ID: <561BE13B.5090202@gmail.com>
References: <1443798319-45744-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1443798319-45744-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>, linux-clk@vger.kernel.org, erin.lo@mediatek.com
List-Id: devicetree@vger.kernel.org



On 02/10/15 17:05, Yingjoe Chen wrote:
> This is based on v4.3-rc1 + clockevents-4.4[1] and James's mediatek-clk
> tree[2].
>
> Changes compare to previous version[3]:
> - Add more MediaTek SoC to mtk-timer binding
> - Update commit message to better describe the purpose.
>
> Changes compare to v2[4]:
> - the first two mtk_timer related changes are removed because they are
> replaced/accepted in clockevents tree.
> - Remove 'add 13mhz clock for MT8173' because it is accepted in
> mediatek-clk tree.
> - Kconfig.platforms path change.
>
> [1]
> https://git.linaro.org/people/daniel.lezcano/linux.git clockevents/4.4
> [2]
> http://lists.infradead.org/pipermail/linux-mediatek/2015-August/002069.html
> [3]
> http://lists.infradead.org/pipermail/linux-mediatek/2015-September/002301.html
> [4]
> http://lists.infradead.org/pipermail/linux-mediatek/2015-July/001544.html
>
>
> Daniel Kurtz (1):
>    arm64: dts: mt8173: add timer node
>
> Yingjoe Chen (2):
>    dt-bindings: add more MediaTek SoC to mtk-timer binding
>    arm64: mediatek: enable MTK_TIMER
>
>   Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 8 +++++---
>   arch/arm64/Kconfig.platforms                                   | 1 +
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi                       | 9 +++++++++
>   3 files changed, 15 insertions(+), 3 deletions(-)
>

Applied, thanks.
