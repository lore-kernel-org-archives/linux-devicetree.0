From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH ] ARM: dts: r8a7745: Add GPIO support
Date: Tue, 22 Aug 2017 10:05:50 +0200
Message-ID: <20170822080550.GG30838@verge.net.au>
References: <1503068161-55067-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503068161-55067-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 18, 2017 at 03:56:01PM +0100, Biju Das wrote:
> Describe GPIO blocks in the R8A7745 device tree.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch has run time dependency on the below patch
> [PATCH/RFC] gpio: rcar: add gen[123] fallback compatibility strings
> https://patchwork.kernel.org/patch/9834611/

Thanks, applied for v4.15.
