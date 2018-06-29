From: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3 5/5] clocksource/drivers/timer-mediatek: Add support
 for system timer
Date: Fri, 29 Jun 2018 08:16:49 +0800
Message-ID: <1530231409.17448.52.camel@mtkswgap22>
References: <1530182744-10731-1-git-send-email-stanley.chu@mediatek.com>
         <1530182744-10731-6-git-send-email-stanley.chu@mediatek.com>
         <b025b8c2-9cfd-466e-ec1c-9fa5e2148904@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b025b8c2-9cfd-466e-ec1c-9fa5e2148904@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, 2018-06-28 at 16:08 +0200, Daniel Lezcano wrote:
> On 28/06/2018 12:45, Stanley Chu wrote:
> > This patch adds a new "System Timer" on the Mediatek SoCs.
> > 
> > The System Timer is introduced as an always-on timer being
> > clockevent device for tick-broadcasting.
> > 
> > For clock, it is driven by 13 MHz system clock.
> > The implementation uses the system clock with no clock
> > source divider.
> > 
> > For interrupt, the clock event timer can be used by all cores.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> 
> Please do the GPT prefix in patch 3/5, so this patch will contain 'syst'
> addition only.
> 
Hi Daniel,

Sure! Will re-arrange patches in v4.

Thanks.
Stanley Chu
