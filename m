From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 4/5] arm64: dts: renesas: r8a7795: Fix register
 mappings on VSPs
Date: Fri, 16 Feb 2018 14:36:07 +0100
Message-ID: <20180216133607.lf25xbk5trmjhe63@verge.net.au>
References: <1518602108-1724-1-git-send-email-kbingham@kernel.org>
 <1518602108-1724-5-git-send-email-kbingham@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1518602108-1724-5-git-send-email-kbingham@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Magnus Damm <magnus.damm@gmail.com>, open list <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, "moderated list:ARM64 PORT AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 14, 2018 at 09:55:07AM +0000, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The VSPD includes a CLUT on RPF2. Ensure that the register space is
> mapped correctly to support this.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, applied
