Return-Path: <SRS0=3//v=L2=verge.net.au=horms@kernel.org>
Date: Wed, 12 Sep 2018 10:42:20 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/3] dt-bindings: power: Add r8a774c0 SYSC power domain
 definitions
Message-ID: <20180912084219.krefscb47b2j4bs6@verge.net.au>
References: <1536590488-23270-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1536590488-23270-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536590488-23270-2-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 10, 2018 at 03:41:26PM +0100, Fabrizio Castro wrote:
> This patch adds power domain indices for RZ/G2E.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Thanks Fabrizio,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  include/dt-bindings/power/r8a774c0-sysc.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 include/dt-bindings/power/r8a774c0-sysc.h
> 
> diff --git a/include/dt-bindings/power/r8a774c0-sysc.h b/include/dt-bindings/power/r8a774c0-sysc.h
> new file mode 100644
> index 0000000..9922d4c
> --- /dev/null
> +++ b/include/dt-bindings/power/r8a774c0-sysc.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_POWER_R8A774C0_SYSC_H__
> +#define __DT_BINDINGS_POWER_R8A774C0_SYSC_H__
> +
> +/*
> + * These power domain indices match the numbers of the interrupt bits
> + * representing the power areas in the various Interrupt Registers
> + * (e.g. SYSCISR, Interrupt Status Register)
> + */
> +
> +#define R8A774C0_PD_CA53_CPU0		5
> +#define R8A774C0_PD_CA53_CPU1		6
> +#define R8A774C0_PD_A3VC		14
> +#define R8A774C0_PD_3DG_A		17
> +#define R8A774C0_PD_3DG_B		18
> +#define R8A774C0_PD_CA53_SCU		21
> +#define R8A774C0_PD_A2VC1		26
> +
> +/* Always-on power area */
> +#define R8A774C0_PD_ALWAYS_ON		32
> +
> +#endif /* __DT_BINDINGS_POWER_R8A774C0_SYSC_H__ */
> -- 
> 2.7.4
> 
