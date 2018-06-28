From: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add mtk-systimer bindings
Date: Thu, 28 Jun 2018 18:24:32 +0800
Message-ID: <1530181472.17448.37.camel@mtkswgap22>
References: <1530086039-3763-1-git-send-email-stanley.chu@mediatek.com>
         <1530086039-3763-2-git-send-email-stanley.chu@mediatek.com>
         <32d0da38-f014-c2c0-70ff-11cdf9ed0569@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <32d0da38-f014-c2c0-70ff-11cdf9ed0569@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Wed, 2018-06-27 at 10:20 +0200, Daniel Lezcano wrote:
> Actually this binding already exists for mediatek timers, it is useless
> to add a new one.
> 
> I note the binding in
> 
> Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> 
> contains:
> 
>  clocks = <&system_clk>, <&rtc_clk>
> 
> However the existing driver does only use <&system_clk> AFAICT, I'm
> questioning if <&rtc_clk> is really needed.
> 
> So, I suggest you sort out and fixup the rtc_clk thing (drop it) and
> then just add your new platform in the list in this binding.
> 
> 
Hi Daniel,

OK! We'll fix it and merge two timers into single document file in v3.

Thanks.
Stanley Chu
