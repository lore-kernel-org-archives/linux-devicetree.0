Return-Path: <SRS0=20pF=KZ=verge.net.au=horms@kernel.org>
Date: Fri, 10 Aug 2018 14:12:32 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 5/5] ARM: dts: iwg23s-sbc: Add pinctl support for
 EtherAVB
Message-ID: <20180810121231.776wrl3cozakpsao@verge.net.au>
References: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
 <1533628626-26503-6-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1533628626-26503-6-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 07, 2018 at 08:57:06AM +0100, Biju Das wrote:
> Adding pinctrl support for EtherAVB interface.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V1-->V2 
>      * No change
> V2-->V3
>      * No change
>      Depend onthe below patch
>        https://patchwork.kernel.org/patch/10546801/

What is the effect of applying this patch without that dependency present?
