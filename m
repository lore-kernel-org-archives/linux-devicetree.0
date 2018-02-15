From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r8a77995: add FCPVD nodes
Date: Thu, 15 Feb 2018 17:38:32 +0100
Message-ID: <20180215163832.abzsl4kcui55kgii@verge.net.au>
References: <1518474330-8713-1-git-send-email-kbingham@kernel.org>
 <1518474330-8713-3-git-send-email-kbingham@kernel.org>
 <1541765.WkmPmS7X3L@avalon>
 <20180215161404.pywzt7m3ccd7gygu@verge.net.au>
 <0d235657-3b2e-7fbe-f7ba-e33756b76532@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0d235657-3b2e-7fbe-f7ba-e33756b76532@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kbingham@kernel.org>, linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 15, 2018 at 04:20:42PM +0000, Kieran Bingham wrote:
> Hi Simon,
> 
> On 15/02/18 16:14, Simon Horman wrote:
> > On Tue, Feb 13, 2018 at 02:32:22PM +0200, Laurent Pinchart wrote:
> >> Hi Kieran,
> >>
> >> Thank you for the patch.
> >>
> >> On Tuesday, 13 February 2018 00:25:27 EET Kieran Bingham wrote:
> >>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>>
> >>> The FCPVD handles the interface between the VSPD and memory.
> >>>
> >>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>
> >> I would however squash this with patch 1/4 from the same series.
> > 
> > Thanks, I've taken the liberty of doing so when applying this patch.
> > The result is as follows:
> 
> That's probably fine, but there was a follow up series which already handles this.

Thanks, I've dropped this and will use the follow-up series instead.
