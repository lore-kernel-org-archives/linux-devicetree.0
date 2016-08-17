From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] ARM: dts: r8a7790/r8a7791: Remove obsolete vsp1
 properties
Date: Wed, 17 Aug 2016 09:22:58 +0200
Message-ID: <20160817072257.GI8673@verge.net.au>
References: <1471359392-12584-1-git-send-email-geert+renesas@glider.be>
 <1731850.1TRV7u0XMF@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1731850.1TRV7u0XMF@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 16, 2016 at 06:09:12PM +0300, Laurent Pinchart wrote:
> Hi Geert,
> 
> On Tuesday 16 Aug 2016 16:56:30 Geert Uytterhoeven wrote:
> > 	Hi Simon, Magnus, Laurent,
> > 
> > This patch series removes from the R-Car H2 and M2-W DT source files the
> > obsolete DT properties to identify the exact VSP device instance
> > features, which are no longer needed nor used since commit
> > 5aa2eb3c86d4fd16 ("[media] v4l: vsp1: Configure device based on IP
> > version").
> 
> I was about to submit the same patches :-)
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > Geert Uytterhoeven (2):
> >   ARM: dts: r8a7790: Remove obsolete vsp1 properties
> >   ARM: dts: r8a7791: Remove obsolete vsp1 properties

Thanks, I have queued these up.
