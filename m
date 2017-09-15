From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/8] ARM: dts: r8a7745: Add SDHI controllers
Date: Fri, 15 Sep 2017 09:54:15 +0200
Message-ID: <20170915075415.GG3924@verge.net.au>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-3-git-send-email-chris.paterson2@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505322341-9480-3-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 13, 2017 at 06:05:35PM +0100, Chris Paterson wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Add the SDHI controllers to the r8a7745 device tree.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Thanks, applied.

> ---
> This patch is based on renesas-devel-20170913-v4.13.
> 
> This patch is dependant on:
> - "dt-bindings: mmc: sh_mmcif: Document r8a7745 DT bindings"

I think that should be "[PATCH v3] mmc: renesas_sdhi: Add r8a7743/5 support"
