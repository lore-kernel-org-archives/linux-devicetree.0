From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: timer: renesas, cmt: Document
 r8a774[35] CMT support
Date: Fri, 15 Dec 2017 16:51:55 -0600
Message-ID: <20171215225155.4li2rwxxkkmudvpy@rob-hp-laptop>
References: <1513104579-6333-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513104579-6333-2-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513104579-6333-2-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 12, 2017 at 06:49:37PM +0000, Fabrizio Castro wrote:
> Document SoC specific compatible strings for r8a7743 and r8a7745.
> No driver change is needed as the fallback strings will activate
> the right code.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
