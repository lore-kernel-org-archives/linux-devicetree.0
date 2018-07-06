From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/5] clocksource/drivers/timer-mediatek: Add system
 timer bindings
Date: Fri, 6 Jul 2018 14:51:37 -0600
Message-ID: <20180706205137.GA20617@rob-hp-laptop>
References: <1530832288-8156-1-git-send-email-stanley.chu@mediatek.com>
 <1530832288-8156-2-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530832288-8156-2-git-send-email-stanley.chu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanley Chu <stanley.chu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 06, 2018 at 07:11:24AM +0800, Stanley Chu wrote:
> This patch adds bindings of new "System Timer" on Mediatek SoCs.
> 
> Remove RTC clock in the same time because it is not used by
> both "General Purpose Timer" and "System Timer" now.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  .../bindings/timer/mediatek,mtk-timer.txt          |   34 ++++++++++++--------
>  1 file changed, 20 insertions(+), 14 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
