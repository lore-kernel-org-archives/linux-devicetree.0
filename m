From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: media: renesas-fcp: Add RZ/G2 support
Date: Thu, 13 Dec 2018 23:27:46 +0200
Message-ID: <16447189.zyKSHM3mdJ@avalon>
References: <1544732433-6543-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544732433-6543-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Thursday, 13 December 2018 22:20:33 EET Fabrizio Castro wrote:
> Document RZ/G2 support.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

And applied to my tree.

> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt
> b/Documentation/devicetree/bindings/media/renesas,fcp.txt index
> 3ec9180..79c3739 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> @@ -2,8 +2,9 @@ Renesas R-Car Frame Compression Processor (FCP)
>  -----------------------------------------------
> 
>  The FCP is a companion module of video processing modules in the Renesas
> R-Car -Gen3 SoCs. It provides data compression and decompression, data
> caching, and -conversion of AXI transactions in order to reduce the memory
> bandwidth. +Gen3 and RZ/G2 SoCs. It provides data compression and
> decompression, data +caching, and conversion of AXI transactions in order
> to reduce the memory +bandwidth.
> 
>  There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and
> FCP for FDP (FCPF). Their configuration and behaviour depend on the module
> they


-- 
Regards,

Laurent Pinchart
