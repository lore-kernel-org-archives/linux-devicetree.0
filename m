From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH] Support multiple MEM tags with atags->fdt conversion
Date: Wed, 15 Jun 2011 16:20:15 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1106151618570.2142@xanadu.home>
References: <1308094074-24898-1-git-send-email-davidb@codeaurora.org> <alpine.LFD.2.00.1106151540230.2142@xanadu.home> <8ya8vt2am2i.fsf@huya.qualcomm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <8ya8vt2am2i.fsf@huya.qualcomm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: David Brown <davidb@codeaurora.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Shawn Guo <shawn.guo@freescale.com>, Tony Lindgren <tony@atomide.com>, John Bonesio <bones@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 15 Jun 2011, David Brown wrote:

> On Wed, Jun 15 2011, Nicolas Pitre wrote:
> 
> > On Tue, 14 Jun 2011, David Brown wrote:
> >
> >> Some targets have multiple memory regions.  Parse up to 8 of these
> >> when converting the atags to fdt.
> >> 
> >> Signed-off-by: David Brown <davidb@codeaurora.org>
> >
> > I've added your patch to my zImage patch queue.
> >
> >> With this change, I am able to boot MSM8x60 combining ATAGS and my DT.
> >> It seems to work as long as my device tree has placeholders for all of
> >> the properties I need.
> >
> > I think those missing nodes should simply be created if missing.  I 
> > however don't see any function in the libfdt API to do that -- there is 
> > fdt_add_subnode() but no fdt_add_node().  Any DT expert please?
> 
> It does seem to only work if I already have nodes that are large enough
> to hold the properties coming from the ATAG.  For example, I have to
> have an array of memory reg values large enough, as well as a command
> line large enough to hold the one passed from the bootloader.
> 
> If the DTB's command line is smaller than the one from ATAG, it just
> silently leaves the DTB one in place.

That I can explain, and that looks easy to fix.


Nicolas
