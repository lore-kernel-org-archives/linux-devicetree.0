From: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: Add system timer driver for Mediatek SoCs
Date: Tue, 26 Jun 2018 16:03:38 +0800
Message-ID: <1530000218.17448.28.camel@mtkswgap22>
References: <1529910601-15005-1-git-send-email-stanley.chu@mediatek.com>
         <dd36b094-b11c-e6ef-a0fc-b039785e74f2@linaro.org>
         <1529917631.17448.22.camel@mtkswgap22>
         <561c2c41-ea92-3ad8-a1d7-aeef46cdc601@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <561c2c41-ea92-3ad8-a1d7-aeef46cdc601@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Tue, 2018-06-26 at 09:31 +0200, Daniel Lezcano wrote:
> On 25/06/2018 11:07, Stanley Chu wrote:
> > On Mon, 2018-06-25 at 09:34 +0200, Daniel Lezcano wrote:
> >> On 25/06/2018 09:09, Stanley Chu wrote:
> >>> This patch adds a new driver for system timer on the Mediatek SoCs.
> >>
> >> Please elaborate why we need yet another timer.
> >>
> >> Is this timer present on all Mediatek platform ? Does it always co-exist
> >> with the existing one ?
> >>
> >>
> >>
> >>
> > Hi Daniel,
> > 
> > This new "system timer" only exists on recent Mediatek platforms,
> > for example, MT6765. We will upstream driver first, and then update
> > device tree on MT6765 later.
> > 
> > System timer is designed and optimized as a SoC timer for
> > tick-broadcasting. Besides timer IP has simpler register manipulation
> > and friendly low-power design.
> > 
> > There is no plan to remove existed "General Purpose Timer" now.
> 
> It is unclear what "General Purpose Timer" and "System Timer" differ
> except they are different timers running on different platforms.
> 
> Merge them into a single timer-mediatek.c file.
> 
Hi Daniel,

Yes, they are different timers running on different platforms.

"System Timer" can replace "General Purpose Timer" in recent platforms,
for example, MT6765.

Thanks.
Stanley Chu
