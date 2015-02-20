From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH RFC v9 01/20] clk: divider: Correct parent clk round rate
 if no bestdiv is normally found
Date: Fri, 20 Feb 2015 11:42:27 -0800
Message-ID: <20150220194227.421.44526@quantum>
References: <1423720903-24806-2-git-send-email-Ying.Liu@freescale.com>
 <20150212103944.GA1290@victor> <20150212122405.GW12209@pengutronix.de>
 <20150212125646.GT8656@n2100.arm.linux.org.uk>
 <20150212134131.GX12209@pengutronix.de> <54DE0BB8.7070004@ti.com>
 <20150213185713.GA12209@pengutronix.de>
 <20150216112724.GN8656@n2100.arm.linux.org.uk>
 <20150220191306.421.58746@quantum>
 <20150220192043.GM8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150220192043.GM8656@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, Tomi Valkeinen <tomi.valkeinen@ti.com>, kernel@pengutronix.de, andy.yan@rock-chips.com, Liu Ying <Ying.Liu@freescale.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Russell King - ARM Linux (2015-02-20 11:20:43)
> On Fri, Feb 20, 2015 at 11:13:06AM -0800, Mike Turquette wrote:
> > Quoting Russell King - ARM Linux (2015-02-16 03:27:24)
> > > On Fri, Feb 13, 2015 at 07:57:13PM +0100, Sascha Hauer wrote:
> > > > I agree that it's a bit odd, but I think it has to be like this.
> > > > Consider that you request a rate of 100Hz, but the clock can only
> > > > produce 99.5Hz, so due to rounding clk_round_rate() returns 99Hz.
> > > > Now when you request 99Hz from clk_set_rate() the 99.5Hz value
> > > > can't be used because it's too high.
> > > 
> > > Math rounding rules normally state that anything of .5 and greater
> > > should be rounded up, not rounded down.  So, for 99.5Hz, you really
> > > ought to be returning 100Hz, not 99Hz.
> > > 
> > > However, you do have a point for 99.4Hz, which would be returned as
> > > 99Hz, and when set, it would result in something which isn't 99.4Hz.
> > 
> > More practically, this again raises the issue of whether or not unsigned
> > long rate should be in millihertz or something other than hertz.
> 
> You still get the same issue if it's millihertz.  Take 10 2/3rds Hz.
> Is 10.666 Hz less than 10 2/3rds Hz?

Millihertz won't solve rounding problems, I agree. But we currently do
not support any fractional rates and we should.

Regards,
Mike

> 
> -- 
> FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
> according to speedtest.net.
