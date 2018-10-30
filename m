Return-Path: <SRS0=ocas=NK=verge.net.au=horms@kernel.org>
Date: Tue, 30 Oct 2018 16:40:22 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a77470 CMT
 support
Message-ID: <20181030154022.6od3reuiapd2hqhb@verge.net.au>
References: <1540542973-15752-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540542973-15752-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 26, 2018 at 09:36:13AM +0100, Biju Das wrote:
> Document SoC specific compatible strings for r8a77470. No driver change
> is needed as the fallback strings will activate the right code.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
