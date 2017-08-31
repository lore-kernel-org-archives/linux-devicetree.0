From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH ] phy: rcar-gen2: Add r8a7743/5 support
Date: Thu, 31 Aug 2017 12:57:27 -0500
Message-ID: <20170831175727.tjncwk2c2gvzmlzb@rob-hp-laptop>
References: <1503568773-41410-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503568773-41410-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 24, 2017 at 10:59:33AM +0100, Biju Das wrote:
> Add USB PHY support for r8a7743/5 SoC. Renesas RZ/G1[ME] (R8A7743/5)
> USB PHY is identical to the R-Car Gen2 family.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch is tested against Linux next tag next-20170824 and 
> renesas-dev branch renesas-devel-20170822-v4.13-rc6. 
> 
>  Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
