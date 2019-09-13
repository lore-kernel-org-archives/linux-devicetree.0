From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH 5/6] media: sun4i: Add H3 deinterlace driver
Date: Fri, 13 Sep 2019 22:06:15 +0200
Message-ID: <6033065.vD0Azduf8t@jernej-laptop>
References: <20190912175132.411-1-jernej.skrabec@siol.net> <4613446.95M5L3lKvs@jernej-laptop> <20190913091147.42nsldzxwzfjoiak@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913091147.42nsldzxwzfjoiak@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hi!

Dne petek, 13. september 2019 ob 11:11:47 CEST je Maxime Ripard napisal(a):
> Hi,
> 
> On Thu, Sep 12, 2019 at 10:43:28PM +0200, Jernej Škrabec wrote:
> > Dne četrtek, 12. september 2019 ob 22:26:47 CEST je Maxime Ripard 
napisal(a):
> > > > +	clk_set_rate(dev->mod_clk, 300000000);
> 
> I just realized I missed this too. If you really need the rate to be
> fixed, and if the controller cannot operate properly at any other
> frequency, you probably want to use clk_set_rate_exclusive there.

I don't think that's needed. Parents of deinterlace clock are pll-periph0 and 
pll-periph1 which both have fixed clock and thus deinterlace clock will never 
be changed. I just set it to same frequency as it is set in BSP driver. I 
think it works with 600 MHz too, but that's overkill.

Best regards,
Jernej 
