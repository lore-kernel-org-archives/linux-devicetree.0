From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/5] ARM: dts: iwg20d-q7-common: Sound PIO support
Date: Mon, 18 Dec 2017 12:22:21 +0100
Message-ID: <20171218112221.krf6bh6sya56du5u@verge.net.au>
References: <1513349453-54689-1-git-send-email-biju.das@bp.renesas.com>
 <1513349453-54689-2-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513349453-54689-2-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 15, 2017 at 02:50:49PM +0000, Biju Das wrote:
> Enable sound PIO support on carrier board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi | 46 +++++++++++++++++++++++++++++++++

It appears that the nodes in this file are in (or close to in) alphabetical
order. Please add new nodes in a manner that preserves that. If necessary
please provide a clean-up patch to shift nodes into alphabetical order.
