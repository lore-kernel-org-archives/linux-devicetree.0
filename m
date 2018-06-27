From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 2/2] clocksource/drivers/mtk_systimer: Add support for
 Mediatek SoCs
Date: Wed, 27 Jun 2018 11:39:32 +0200
Message-ID: <2a40ec95-7352-f0c4-b394-d7b689de98ec@linaro.org>
References: <1530086039-3763-1-git-send-email-stanley.chu@mediatek.com>
 <1530086039-3763-3-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530086039-3763-3-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stanley Chu <stanley.chu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 27/06/2018 09:53, Stanley Chu wrote:
> This patch adds a new clock event for the timer
> found on the Mediatek SoCs.
> 
> The Mediatek System Timer has several 32-bit timers.
> Only one timer is used by this driver as a clock event
> supporting oneshot events.
> 
> The System Timer can be run with two clocks. A 13 MHz system
> clock and the RTC clock running at 32 KHz. This implementation
> uses the system clock with no clock source divider.

Recent platforms have the arch_arm_timer and it will be always selected.

What is the benefit of adding this timer ?


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
