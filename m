From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/7] ARM: shmobile: Use interrupt macros in SoC DT files
Date: Tue, 19 Nov 2013 11:36:50 +0900
Message-ID: <20131119023649.GL17628@verge.net.au>
References: <1383999839-3339-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1383999839-3339-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20131119013852.GE17628@verge.net.au>
 <2390430.hJVcfjsIq8@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2390430.hJVcfjsIq8@avalon>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 19, 2013 at 02:50:00AM +0100, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Tuesday 19 November 2013 10:38:52 Simon Horman wrote:
> > On Sat, Nov 09, 2013 at 01:23:54PM +0100, Laurent Pinchart wrote:
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > > 
> > >  arch/arm/boot/dts/r8a73a4.dtsi | 108 ++++++++++++++++++++++++----------
> > >  arch/arm/boot/dts/r8a7740.dtsi | 106 +++++++++++++++++-----------------
> > >  arch/arm/boot/dts/r8a7778.dtsi |  44 +++++++-------
> > >  arch/arm/boot/dts/r8a7779.dtsi |  42 +++++++-------
> > >  arch/arm/boot/dts/r8a7790.dtsi |  58 ++++++++++---------
> > >  arch/arm/boot/dts/r8a7791.dtsi |  49 ++++++++--------
> > >  arch/arm/boot/dts/sh73a0.dtsi  | 128 +++++++++++++++++++-----------------
> > >  7 files changed, 299 insertions(+), 236 deletions(-)
> > 
> > There was some fuzz when applying the arch/arm/boot/dts/r8a7778.dtsi hunks
> > of this patch. The result that I have queued up is as follows. Please
> > double-check it.
> 
> I'll resend the patch. Which branch should I base it on ?

dt3.
