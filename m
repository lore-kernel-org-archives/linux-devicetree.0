From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: display: renesas: lvds: Document r8a774c0 bindings
Date: Thu, 13 Dec 2018 23:38:05 +0200
Message-ID: <16274213.zDsrymDxqi@avalon>
References: <1544732454-6633-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544732454-6633-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Thursday, 13 December 2018 22:20:54 EET Fabrizio Castro wrote:
> The RZ/G2E (r8a774c0) supports two LVDS channels. Extend the binding to
> support them.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt index
> 3aeb0ec..cb7c328 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -8,6 +8,7 @@ Required properties:
> 
>  - compatible : Shall contain one of
>    - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
> +  - "renesas,r8a774c0-lvds" for R8A774C0 (RZ/G2E) compatible LVDS encoders
>    - "renesas,r8a7790-lvds" for R8A7790 (R-Car H2) compatible LVDS encoders
>    - "renesas,r8a7791-lvds" for R8A7791 (R-Car M2-W) compatible LVDS
> encoders - "renesas,r8a7793-lvds" for R8A7793 (R-Car M2-N) compatible LVDS
> encoders @@ -24,7 +25,7 @@ Required properties:
>  - clock-names: Name of the clocks. This property is model-dependent.
>    - The functional clock, which mandatory for all models, shall be listed
>      first, and shall be named "fck".
> -  - On R8A77990 and R8A77995, the LVDS encoder can use the EXTAL or
> +  - On R8A77990, R8A77995 and R8A774C0, the LVDS encoder can use the EXTAL
> or DU_DOTCLKINx clocks. Those clocks are optional. When supplied they must
> be named "extal" and "dclkin.x" respectively, with "x" being the
> DU_DOTCLKIN numerical index.


-- 
Regards,

Laurent Pinchart
