From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH 1/2] arm64: mediatek: enable MTK_TIMER
Date: Wed, 16 Sep 2015 10:21:31 +0800
Message-ID: <1442370091.14347.10.camel@mtksdaap41>
References: <1442369095-1094-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1442369095-1094-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-09-16 at 10:04 +0800, Yingjoe Chen wrote:
> Enable MTK_TIMER for MediaTek plaform, which will be used as
> schedule clock.

Sorry, sending this series too early without cover letter and removing
Change-Id. Here's the cover letter:


This is actually v3 of "add GPT timer support for mt8173" series. This
is based on v4.3-rc1 + clockevents-4.4[1] and James's mediatek-clk
tree[2].

Changes compare to previous version[3]:
- the first two mtk_timer related changes are removed because they are
replaced/accepted in clockevents tree.
- Remove 'add 13mhz clock for MT8173' because it is accepted in
mediatek-clk tree.
- Kconfig.platforms path change.

So we only have 2 patches left here.
Matthias, can you take these and help to remove the Change-Id?


Daniel Kurtz (1):
  arm64: dts: mt8173: add timer node

Yingjoe Chen (1):
  arm64: mediatek: enable MTK_TIMER



[1]
https://git.linaro.org/people/daniel.lezcano/linux.git clockevents/4.4
[2]
http://lists.infradead.org/pipermail/linux-mediatek/2015-August/002069.html
[3]
http://lists.infradead.org/pipermail/linux-mediatek/2015-July/001544.html




