From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v6 6/6] powerpc, tqm5200: update tqm5200_defconfig to fit
 for charon board.
Date: Mon, 2 May 2011 16:31:20 -0600
Message-ID: <20110502223120.GD15187@ponder.secretlab.ca>
References: <1291451028-22532-1-git-send-email-hs@denx.de>
 <1300782452-528-1-git-send-email-hs@denx.de>
 <1300782452-528-7-git-send-email-hs@denx.de>
 <20110322091027.GC2134@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110322091027.GC2134@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: Heiko Schocher <hs@denx.de>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-fbdev@vger.kernel.org, devicetree-discuss@ozlabs.org, Ben Dooks <ben@simtec.co.uk>, Vincent Sanders <vince@simtec.co.uk>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Wolfgang Denk <wd@denx.de>, Paul Mundt <lethal@linux-sh.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 22, 2011 at 10:10:27AM +0100, Wolfram Sang wrote:
> >     As this board is tqm5200 based, added necessary changes
> >     to the tqm5200_defconfig. In previous patchserie I added
> >     the changes to mpc5200_defconfig, as Wolfram Sang mentioned,
> >     but as tqm5200_defconfig is in mainline, and the board is
> >     tqm5200 based, I think, thats the appropriate place, as
> 
> I'd think the perfect solution would have been to merge the
> tqm-defconfig into the mpc5200-defconfig entirely and get rid of it.
> That being said, I don't think this issue is big enough to block this
> series, so fine enough with me.

Merged, thanks.

g.
