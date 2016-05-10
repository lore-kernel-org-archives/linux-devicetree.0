From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v3 2/4] clk: arizona: Add clock driver for the Arizona
 devices
Date: Tue, 10 May 2016 10:58:48 +0100
Message-ID: <20160510095848.GI1646@localhost.localdomain>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1452252582-20834-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20160507005501.GN3492@codeaurora.org>
 <20160509104728.GG1646@localhost.localdomain>
 <20160509214829.GQ3492@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160509214829.GQ3492@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, cw00.choi@samsung.com, lee.jones@linaro.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Mon, May 09, 2016 at 02:48:29PM -0700, Stephen Boyd wrote:
> On 05/09, Charles Keepax wrote:
> > On Fri, May 06, 2016 at 05:55:01PM -0700, Stephen Boyd wrote:
> > > I've applied this to clk-next but still have a question, see
> > > below.
> > > 
> > > On 01/08, Charles Keepax wrote:
> > Apologies, I have been working on a v4 that includes these
> > improvements. It does indeed look much nicer using assigned
> > parents etc. I think it might be best to drop these for now until
> > those are ready to send.
> 
> Ok sure. I've dropped them.

Cool thanks.

> 
> > 
> > The only problem I really have left to sort out before I can send
> > it are some locking issues. It is quite tricky to get interaction
> > between the clocking and SPI frameworks to play nicely. The SPI
> > framework will sometimes punt the actually processing for the
> > transfer to a worker thread which will often perform operations
> > on clocks required for the SPI. Because this is a seperate
> > thread it isn't handled by the re-enterant locking in the clock
> > framework. I had been working around this using async transfers
> > for the SPI, but even then I have since found you can get lockdep
> > warnings because of the potential mutex inversion (SPI mutex and
> > the clock one).
> > 
> > Any suggestions on this front would be greatly appreciated?
> > 
> 
> The fix is to always prepare the first clk right? That way we
> avoid any deadlock scenario.

Yeah, been looking at that, the problem is our parts get used
in a fairly wide array of places and it tends to be up to the
individual SPI driver how the clocks are controlled. So feels a
bit like SPI driver whack a mole, perhaps something could be done
through the SPI core itself through.

> 
> We've been slowly working our way toward an alternate solution,
> which is to have one mutex per clk so that different parts of the
> clk tree can be locked independently, but so far that's blocked
> on drivers re-entering the clk framework with clk consumer APIs
> from within the clk_ops callbacks. Hopefully coordinated clk rate
> switches will allow us to get rid of those situations and then we
> can go and make sure all drivers aren't relying on the big
> prepare mutex to keep their drivers safe from concurrent accesses
> and finally move to one mutex per clk. This is a long term goal
> though so I wouldn't depend on this happening anytime soon.

Thanks, really good to hear some thoughts on this.  I had been
coming to the conclusion here that individual prepare locks was
the right course of action. I had tried some changes to allow
individual clock drivers to specify prepare_lock and unlock
callbacks and then having the clock core fall back to the global
lock if the driver didn't have these. Which is a sort of half way
house to individual locks, but its still quite easy to run into
mutex inversions with all the other clocks still sharing a global
lock.

Thanks,
Charles
