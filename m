From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH RFC v9 01/20] clk: divider: Correct parent clk round rate if no
 bestdiv is normally found
Date: Fri, 20 Feb 2015 11:13:06 -0800
Message-ID: <20150220191306.421.58746@quantum>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
 <1423720903-24806-2-git-send-email-Ying.Liu@freescale.com>
 <20150212093356.GR12209@pengutronix.de> <20150212103944.GA1290@victor>
 <20150212122405.GW12209@pengutronix.de>
 <20150212125646.GT8656@n2100.arm.linux.org.uk>
 <20150212134131.GX12209@pengutronix.de> <54DE0BB8.7070004@ti.com>
 <20150213185713.GA12209@pengutronix.de>
 <20150216112724.GN8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150216112724.GN8656@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, stefan.wahren@i2se.com, devicetree@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kernel@pengutronix.de, andy.yan@rock-chips.com, Liu Ying <Ying.Liu@freescale.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Russell King - ARM Linux (2015-02-16 03:27:24)
> On Fri, Feb 13, 2015 at 07:57:13PM +0100, Sascha Hauer wrote:
> > I agree that it's a bit odd, but I think it has to be like this.
> > Consider that you request a rate of 100Hz, but the clock can only
> > produce 99.5Hz, so due to rounding clk_round_rate() returns 99Hz.
> > Now when you request 99Hz from clk_set_rate() the 99.5Hz value
> > can't be used because it's too high.
> 
> Math rounding rules normally state that anything of .5 and greater
> should be rounded up, not rounded down.  So, for 99.5Hz, you really
> ought to be returning 100Hz, not 99Hz.
> 
> However, you do have a point for 99.4Hz, which would be returned as
> 99Hz, and when set, it would result in something which isn't 99.4Hz.

More practically, this again raises the issue of whether or not unsigned
long rate should be in millihertz or something other than hertz.

And then that question again raises the issue of making rate 64-bit...

Regards,
Mike

> 
> -- 
> FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
> according to speedtest.net.
