From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] clk: shmobile: Add R8A7790 clocks support
Date: Thu, 07 Nov 2013 13:15:26 +0100
Message-ID: <3394178.9T7q17vczr@avalon>
References: <1383058511-26046-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <87zjpggalc.wl%kuninori.morimoto.gx@renesas.com> <871u2s65kz.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <871u2s65kz.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Mike Turquette <mturquette@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Morimoto-san,

On Wednesday 06 November 2013 23:20:32 Kuninori Morimoto wrote:
> Hi Laurent again
> 
> > In my SuperH experience, CPG clock divier has same pattern.
> > In H2's SDCKCR register, SDHFC and SD0FC looks different.
> > But, the real different is only enabled bit area,
> > the value is same.
> > You can find same pattern on FRQCRB register too,
> > and, you can find same pattern on M2.
> > 
> > I guess FRQCRB/SDHFC can share code if it has mask.
> > This idea was used on R-Mobile series on div4.
> > (ex clock-sh73a0.c :: div4_clks)
> 
> I talked it with Magnus, and I understand your headache.
> I can agree about your approach now.
> 
> But, I guess H2 and M2 are very similar SoC.
> and I don't want too many clock-${SoC} files.
> Is it possible to share code like clk-gen2.c ?

Sure, if the hardware is very similar, it makes sense to share code. I've had 
a quick look at the M2 documentation, and it seems to be indeed mostly 
identical to H2. Only a couple of clocks are missing, and a new GPU clock 
register is documented. As the GPU clock is mentioned in the H2 documentation 
as being programmable I would assume that the GPU clock register exists and is 
identical in H2 but has been forgotten in the documentation.

We should probably extend clock-r8a7790.c with M2 support and rename it to 
clock-rcar-gen2.c before pushing it to mainline. Would you like to submit a 
patch ? :-)

-- 
Regards,

Laurent Pinchart

