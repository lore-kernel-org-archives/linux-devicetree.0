From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 1/4] clocksource: rockchip: Make the driver more compatible
Date: Wed, 30 Sep 2015 21:14:50 +0200
Message-ID: <2486591.i0n1KlEQoc@diego>
References: <1443147298-12603-1-git-send-email-wxt@rock-chips.com> <1443147298-12603-2-git-send-email-wxt@rock-chips.com> <560A10FB.7040408@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <560A10FB.7040408@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Caesar Wang <wxt@rock-chips.com>, will.deacon@arm.com, catalin.marinas@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am Dienstag, 29. September 2015, 06:18:03 schrieb Daniel Lezcano:
> On 09/25/2015 04:14 AM, Caesar Wang wrote:
> > Build the arm64 SoCs (e.g.: RK3368) on Rockchip platform,
> > There are some failure with build up on timer driver for rockchip.
> > 
> > Says:
> > /tmp/ccdAnNy5.s:47: Error: missing immediate expression at  operand 1 --
> > `dsb`
> > ...
> > 
> > The problem was different semantics of dsb on btw arm32 and arm64,
> > Here we can convert the dsb with insteading of dsb(sy).The "sy" param
> > is the default which you are allow to omit, so on arm32 dsb()and dsb(sy)
> > are the same.
> > 
> > Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

as you have "just" Acked these patches, I guess you are expecting them to go 
through the same tree as the devicetree changes, right?

Thanks
Heiko
