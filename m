From: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3 4/5] clocksource/drivers/timer-mediatek: Convert the
 driver to timer-of
Date: Fri, 29 Jun 2018 08:10:27 +0800
Message-ID: <1530231027.17448.46.camel@mtkswgap22>
References: <1530182744-10731-1-git-send-email-stanley.chu@mediatek.com>
         <1530182744-10731-5-git-send-email-stanley.chu@mediatek.com>
         <5cdfbfdf-4d6e-de18-0f20-2f3b50129b87@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5cdfbfdf-4d6e-de18-0f20-2f3b50129b87@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, 2018-06-28 at 16:03 +0200, Daniel Lezcano wrote:
> >  
> > -struct mtk_clock_event_device {
> > -	void __iomem *gpt_base;
> > -	u32 ticks_per_jiffy;
> > -	struct clock_event_device dev;
> > +struct mtk_timer_private {
> > +	unsigned long ticks_per_jiffy;
> >  };
> 
> This private structure is not needed. There is timer_of_clk->period
> 
> cf.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clocksource/timer-of.c#n144
> 
> 
Hi Daniel,

Thanks for remind:)
Will fix it in v4.

Thanks.
Stanley Chu
