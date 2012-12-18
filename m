From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 05/10] ARM: shmobile: Add DT table of INTC for sh7372
Date: Tue, 18 Dec 2012 09:37:17 +0900
Message-ID: <20121218003717.GI7146@verge.net.au>
References: <1355562224-29448-1-git-send-email-horms+renesas@verge.net.au>
 <1355562224-29448-6-git-send-email-horms+renesas@verge.net.au>
 <Pine.LNX.4.64.1212170941400.24007@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1212170941400.24007@axis700.grange>
Sender: linux-sh-owner@vger.kernel.org
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Simon Horman <horms+renesas@verge.net.au>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Bastian Hecht <hechtb@gmail.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>, Magnus Damm <damm@opensource.se>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2012 at 09:44:10AM +0100, Guennadi Liakhovetski wrote:
> Hi Simon
> 
> On Sat, 15 Dec 2012, Simon Horman wrote:
> 
> > From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> > 
> > Cc: Magnus Damm <damm@opensource.se>
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> What happened to intcs support? Why has it been dropped? Without it many 
> important devices cannot be set up from DT, e.g. I2C #0.

INTCS support is still being worked on and doesn't seem to be
quite ready yet. I am aware that this limits the usefulness of
this series. But it is a step in the right direction.
