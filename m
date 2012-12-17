From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: [PATCH 05/10] ARM: shmobile: Add DT table of INTC for sh7372
Date: Mon, 17 Dec 2012 09:44:10 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1212170941400.24007@axis700.grange>
References: <1355562224-29448-1-git-send-email-horms+renesas@verge.net.au>
 <1355562224-29448-6-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1355562224-29448-6-git-send-email-horms+renesas@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Bastian Hecht <hechtb@gmail.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>, Magnus Damm <damm@opensource.se>
List-Id: devicetree@vger.kernel.org

Hi Simon

On Sat, 15 Dec 2012, Simon Horman wrote:

> From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> 
> Cc: Magnus Damm <damm@opensource.se>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

What happened to intcs support? Why has it been dropped? Without it many 
important devices cannot be set up from DT, e.g. I2C #0.

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
