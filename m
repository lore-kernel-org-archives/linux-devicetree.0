From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: media: rcar_vin: add device tree
 support for r8a774[35]
Date: Fri, 17 Nov 2017 14:32:24 -0600
Message-ID: <20171117203224.4wiujhhnvkzexwq5@rob-hp-laptop>
References: <1510856571-30281-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1510856571-30281-3-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1510856571-30281-3-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 16, 2017 at 06:22:49PM +0000, Fabrizio Castro wrote:
> Add compatible strings for r8a7743 and r8a7745. No driver change
> is needed as "renesas,rcar-gen2-vin" will activate the right code.
> However, it is good practice to document compatible strings for the
> specific SoC as this allows SoC specific changes to the driver if
> needed, in addition to document SoC support and therefore allow
> checkpatch.pl to validate compatible string values.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
> v1->v2:
> * Fixed double "change" in changelog
> 
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
