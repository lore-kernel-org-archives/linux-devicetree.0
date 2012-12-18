From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 09/10] ARM: shmobile: sh7372: Do not initialise TMU when
 using DT
Date: Tue, 18 Dec 2012 09:39:24 +0900
Message-ID: <20121218003924.GJ7146@verge.net.au>
References: <1355562224-29448-1-git-send-email-horms+renesas@verge.net.au>
 <1355562224-29448-10-git-send-email-horms+renesas@verge.net.au>
 <Pine.LNX.4.64.1212171056150.24007@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1212171056150.24007@axis700.grange>
Sender: linux-sh-owner@vger.kernel.org
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Simon Horman <horms+renesas@verge.net.au>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Bastian Hecht <hechtb@gmail.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>, Magnus Damm <damm@opensource.se>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2012 at 10:58:39AM +0100, Guennadi Liakhovetski wrote:
> Hi Simon
> 
> On Sat, 15 Dec 2012, Simon Horman wrote:
> 
> > This is in preparation for initialising INTC using DT.
> > The proposed INTC configuration is not complete and does
> > not allow the TMU to be initialised, to exclude it when using DT.
> 
> Not sure why you decide to not include incs, as I said, it is quite 
> important on sh7372. If we do find a way to include it back, then this 
> patch becomes unnecessary too.

Yes, I agree this should not be necessary once INTC has more complete
DT support. But in the meantime it seems to be needed.

Its the baby-steps approach to changing everything.
