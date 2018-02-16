From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77995-draak: Enable DU
Date: Fri, 16 Feb 2018 14:42:38 +0100
Message-ID: <20180216134237.e3tmlj46hvdmr7vp@verge.net.au>
References: <1518683903-10681-7-git-send-email-kbingham@kernel.org>
 <1518784355-17272-1-git-send-email-kbingham@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1518784355-17272-1-git-send-email-kbingham@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 16, 2018 at 12:32:35PM +0000, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Enable the DU, providing only the VGA output for now.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> 
> Just a v2 update to fix the PFC name, and collect Laurent's RB tag.  The
> remainder of the series will likely be postponed due to dependencies on LVDS
> changes etc.
> 
> v2:
>  - Update du_dot_clk_0 name to match Ulrich's PFC configuration.

Thanks, applied with s/r8a77995-// adjustment to the subject.
