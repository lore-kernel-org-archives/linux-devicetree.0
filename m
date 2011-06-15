From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH] Support multiple MEM tags with atags->fdt conversion
Date: Wed, 15 Jun 2011 15:50:37 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1106151540230.2142@xanadu.home>
References: <1308094074-24898-1-git-send-email-davidb@codeaurora.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1308094074-24898-1-git-send-email-davidb@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: David Brown <davidb@codeaurora.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Shawn Guo <shawn.guo@freescale.com>, Tony Lindgren <tony@atomide.com>, John Bonesio <bones@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 14 Jun 2011, David Brown wrote:

> Some targets have multiple memory regions.  Parse up to 8 of these
> when converting the atags to fdt.
> 
> Signed-off-by: David Brown <davidb@codeaurora.org>

I've added your patch to my zImage patch queue.

> With this change, I am able to boot MSM8x60 combining ATAGS and my DT.
> It seems to work as long as my device tree has placeholders for all of
> the properties I need.

I think those missing nodes should simply be created if missing.  I 
however don't see any function in the libfdt API to do that -- there is 
fdt_add_subnode() but no fdt_add_node().  Any DT expert please?

Also, should the DTB be enlarged in order to add new nodes, or even 
modify existing ones with larger properties?  In other words, 
should something like fdt_move(fdt, fdt, fdt_totalsize(fdt)+HEADROOM) be 
used beforehand?


Nicolas
