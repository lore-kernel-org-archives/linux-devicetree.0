From: Jon Mason <jonmason@broadcom.com>
Subject: Re: [PATCH v2 7/7] clk: ns2: add clock support for Broadcom
 Northstar 2 SoC
Date: Thu, 15 Oct 2015 15:23:05 -0400
Message-ID: <20151015192304.GL32089@broadcom.com>
References: <1444770485-11210-1-git-send-email-jonmason@broadcom.com>
 <561FF223.2050807@broadcom.com>
 <20151015184344.GK32089@broadcom.com>
 <5092107.jzBI3Aa57c@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5092107.jzBI3Aa57c@wuerfel>
Sender: linux-clk-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Scott Branden <sbranden@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Thu, Oct 15, 2015 at 08:54:34PM +0200, Arnd Bergmann wrote:
> On Thursday 15 October 2015 14:43:45 Jon Mason wrote:
> > On Thu, Oct 15, 2015 at 11:36:19AM -0700, Scott Branden wrote:
> > > Jon,
> > > 
> > > Can you add this to your patchset and change COMMON_CLK_IPROC to a
> > > silent option?
> > 
> > Sure, I'll add this (and make it silent), as well as adding the
> > documentation patches back to this series (per Ray's suggestion), and
> > will resend.
> > 
> 
> Thanks!
> 
> 	Arnd

I'm tweaking the patch slightly.  So, I'll remove Scott's ack and let
him re-ack if he still likes it.

I moved the selection of the COMMON_CLK_IPROC to ARCH_BCM_IPROC, as
all iProc SoCs will soon have clk drivers (and enabling it without a
SoC driver won't hurt anything).  Also, the slient enable option is
added.

Thanks,
Jon
