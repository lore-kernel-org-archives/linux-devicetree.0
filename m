Return-Path: <SRS0=Sfu6=UF=verge.net.au=horms@kernel.org>
Date: Thu, 6 Jun 2019 10:55:04 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: iwg23s-sbc: Fix SDHI2 VccQ regulator
Message-ID: <20190606085504.agvtxu3vadicfxau@verge.net.au>
References: <1559555632-2258-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1559555632-2258-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559555632-2258-3-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jun 03, 2019 at 10:53:52AM +0100, Fabrizio Castro wrote:
> SDR50 isn't working anymore because the GPIO regulator
> driver is using descriptors since
> commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors")
> which in turn causes the system to use the polarity of the
> GPIOs (as specified in the DT) for selecting the states,
> but the polarity specified in the DT is wrong.
> This patch fixes the regulator DT definition, and that fixes
> SDR50.
> 
> Fixes: 9eb36b945b5c ("ARM: dts: iwg23s-sbc: Add uSD and eMMC support")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks, I have applied this for inclusion in v5.3.
