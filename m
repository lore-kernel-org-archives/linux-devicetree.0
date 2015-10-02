From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH v4 0/3] add GPT timer support for mt8173
Date: Fri, 2 Oct 2015 23:13:03 +0800
Message-ID: <1443798783.24788.1.camel@mtksdaap41>
References: <1443798319-45744-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1443798319-45744-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>, linux-clk@vger.kernel.org, erin.lo@mediatek.com
List-Id: devicetree@vger.kernel.org

On Fri, 2015-10-02 at 23:05 +0800, Yingjoe Chen wrote:
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


Hi Sudeep, Mark,

I just post a new version of this patch. Sorry I forgot to CC you.

Joe.C



