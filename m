From: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 2/2] clocksource/drivers/mtk_systimer: Add support
 for Mediatek SoCs
Date: Wed, 27 Jun 2018 17:50:16 +0800
Message-ID: <1530093016.17448.35.camel@mtkswgap22>
References: <1530086039-3763-1-git-send-email-stanley.chu@mediatek.com>
         <1530086039-3763-3-git-send-email-stanley.chu@mediatek.com>
         <2a40ec95-7352-f0c4-b394-d7b689de98ec@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2a40ec95-7352-f0c4-b394-d7b689de98ec@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Wed, 2018-06-27 at 11:39 +0200, Daniel Lezcano wrote:
> On 27/06/2018 09:53, Stanley Chu wrote:
> > This patch adds a new clock event for the timer
> > found on the Mediatek SoCs.
> > 
> > The Mediatek System Timer has several 32-bit timers.
> > Only one timer is used by this driver as a clock event
> > supporting oneshot events.
> > 
> > The System Timer can be run with two clocks. A 13 MHz system
> > clock and the RTC clock running at 32 KHz. This implementation
> > uses the system clock with no clock source divider.
> 
> Recent platforms have the arch_arm_timer and it will be always selected.
> 
> What is the benefit of adding this timer ?
> 
> 
Hi Daniel,

To save power as much as possible, our platform enables
"arch_timer_c3stop" in arch_arm_timer, and thus another always-on timer
is required for tick-broadcasting. System Timer is introduced for above
purpose.

Thanks.
Stanley Chu
