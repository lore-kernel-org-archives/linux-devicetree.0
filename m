From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH  0/3] Add SMP support
Date: Wed, 9 Aug 2017 10:35:54 +0200
Message-ID: <20170809083554.GI2705@verge.net.au>
References: <1502189793-59679-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502189793-59679-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 08, 2017 at 11:56:30AM +0100, Biju Das wrote:
> This series aims to add SMP support for r8a7743 SoC.
> 
> This series has been tested against Linux-next tag 20170727
> and renesas-dev branch.

It seems that these patches are targeted at the renesas tree.
The best practice in that case is to base patches on the latest
devel branch. Please consider doing so in future.

The patches themselves seem good to me, however, I would like to enquire
about testing. In particular, have you tested CPU hotplug and suspend to
RAM with these patches (and without in the case of the latter)?

I am cautious about any regressions that may creep in
when going from UP to SMP.

> 
> Biju Das (3):
>   dt-bindings: apmu: Document r8a7743 support
>   ARM: dts: r8a7743: Add APMU node and second CPU core
>   ARM: dts: r8a7743: Add OPP table for frequency scaling
> 
>  .../devicetree/bindings/power/renesas,apmu.txt     |  3 ++-
>  arch/arm/boot/dts/r8a7743.dtsi                     | 25 ++++++++++++++++++++++
>  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> -- 
> 1.9.1
> 
