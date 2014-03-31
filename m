From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH RFC v3 2/2] clk: Add handling of clk parent and rate
 assigned from DT
Date: Mon, 31 Mar 2014 10:32:10 +0200
Message-ID: <20140331083210.GX24917@pengutronix.de>
References: <1395922579-28547-1-git-send-email-s.nawrocki@samsung.com>
 <46532903.ghnH4Us8Zz@avalon>
 <20140327144712.GW17250@pengutronix.de> <2134974.m5sRReBBJh@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <2134974.m5sRReBBJh@avalon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, mturquette@linaro.org, gregkh@linuxfoundation.org, t.figa@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, galak@codeaurora.org, grant.likely@linaro.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

On Fri, Mar 28, 2014 at 05:44:17PM +0100, Laurent Pinchart wrote:
> Hi Sascha,
> 
> On Thursday 27 March 2014 15:47:12 Sascha Hauer wrote:
> > On Thu, Mar 27, 2014 at 03:08:10PM +0100, Laurent Pinchart wrote:
> 
> [snip]
> 
> > > That's clearer indeed. Can the parents and rates depend on the board, or
> > > on the SoC only ? We might be getting dangerously close to specifying
> > > platform configuration instead of describing the hardware. A real example
> > > might be nice to support the discussion.
> > 
> > This patch comes just at the right time. This is what I do with it:
> > 
> > #define cko1_sel 57
> > #define pll4_audio_div 203
> > #define pll4_audio 173
> > #define ssi3_sel 47
> > 
> > &clks {
> > 	assigned-clocks {
> > 		clocks = <&clks cko1_sel>, <&clks ssi3_sel>, <&clks pll4_audio>;
> > 		clock-parents = <&clks pll4_audio_div>, <&clks pll4_audio_div>, <0>;
> > 		clock-rates = <0>, <0>, <786432000>;
> > 	};
> > };
> > 
> > cko1_sel is a clock that can be routed out of the SoC. In my case it is
> > connected the sysclk of an external Audio Codec. ssi3_sel drives my SoC
> > internal I2S unit which I use in master mode. The above makes sure that
> > the I2S unit and the the external codec both get their clock from the
> > audio PLL. The audio PLL is configured to a rate of 786432000Hz which
> > is an exact multiple of the desired audio clock.
> 
> Thank you for the example.
> 
> Are the cko1_sel and ssi3_sel used only by the external audio codec and 
> internal I2S unit respectively ? If so, it might make sense to move the 
> configuration of their parent to the audio codec and I2S unit DT nodes. 
> However, grouping the parent configuration and the pll4 rate configuration in 
> a single place makes sense as well. Guidelines are probably needed.

I didn't bother much to find the right place for the nodes. It indeed
might make sense to put them under the I2S unit and the codec. However,
the clock-rate is a shared property between the I2S unit and the codec
which probably should better be placed under the block which provides
the clocks.

> 
> I get a slight feeling of uneasiness about this, probably because we're at the 
> boundary between hardware description and system configuration. Encoding in DT 
> that "for this particular board this particular clock must be configured this 
> particular way" sounds fine to me, but we need to make sure it won't turn to 
> software-driven rather than hardware-driven use case descriptions.

I agree this is in the grey area between hardware and software
description. At least on i.MX it happens with audio and video that
totally unrelated units share a clock. Often it's next to impossible to
find an algorithm that configures the clocks correctly without the help
of hardcoded assumptions about parents and rates. I find specifying this
in the devicetree much more convenient than writing board specific code
each time.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
