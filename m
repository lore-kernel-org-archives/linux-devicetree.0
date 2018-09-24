Return-Path: <SRS0=X0Lk=MG=verge.net.au=horms@kernel.org>
Date: Mon, 24 Sep 2018 11:13:48 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 4/4] ARM: dts: iwg23s-sbc: Add uSD card support
Message-ID: <20180924091348.gf462j2n7yuf4tif@verge.net.au>
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537530911-443-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537530911-443-5-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 21, 2018 at 12:55:11PM +0100, Fabrizio Castro wrote:
> Add uSD card support to the iwg23s single board computer powered
> by the RZ/G1C SoC (a.k.a. r8a77470).
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
> Hello Simon,
> 
> this patch can only be taken after patch "pinctrl: sh-pfc: r8a77470:
> Add SDHI2 voltage switch" from this series appears on a release candidate
> or a release.

What is the nature of that dependency. Does adding this patch without
its dependency cause a regression?

> Shall I re-send it at a later stage or are you happy to keep it around
> and defer its application to when its dependency is sorted?

I'd rather that you repost or otherwise ping me once any dependency is sorted.
