From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: [PATCH v2] mfd: as3711: add OF support
Date: Wed, 20 Mar 2013 20:40:15 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1303202034090.24222@axis700.grange>
References: <Pine.LNX.4.64.1302181049510.4526@axis700.grange>
 <20130302041547.GJ6610@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130302041547.GJ6610@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, devicetree-discuss@lists.ozlabs.org, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lrg@ti.com>, Richard Purdie <rpurdie@rpsys.net>, Andrew Morton <akpm@linux-foundation.org>, linux-fbdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi all

On Sat, 2 Mar 2013, Mark Brown wrote:

> On Mon, Feb 18, 2013 at 10:57:44AM +0100, Guennadi Liakhovetski wrote:
> > Add device-tree bindings to the AS3711 regulator and backlight drivers.
> 
> Reviwed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

This patch has been submitted more than a month ago and only has got one 
reviewed-be (thanks) and no comments otherwise. The patch touches multiple 
subsystems, so, it is a bit difficult to decide via which tree it should 
be pushed. Since the least trivial and largest portion of the patch is 
backlight-related, maybe Samuel could add his ack and then Andrew could 
pull it via his tree?

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
