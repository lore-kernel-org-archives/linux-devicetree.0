From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 3/8] dt-bindings: display: renesas,lvds: Add LVDS binding
 for D3
Date: Thu, 15 Feb 2018 08:45:33 +0000
Message-ID: <ad5ea103-b039-7a2e-01c8-2cb16324115d@ideasonboard.com>
References: <1518683903-10681-1-git-send-email-kbingham@kernel.org>
 <1518683903-10681-4-git-send-email-kbingham@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1518683903-10681-4-git-send-email-kbingham@kernel.org>
Content-Language: en-GB
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Kieran Bingham <kbingham@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>, geert@glider.be, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 15/02/18 08:38, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The D3 supports two LVDS channels. Extend the binding to support them.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> index 79860f58a7ad..0dcf488b70df 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -14,6 +14,7 @@ Required properties:
>  - compatible : Shall contain one of
>    - "renesas,lvds-r8a7795" for R8A7795 (R-Car H3) compatible LVDS encoders
>    - "renesas,lvds-r8a7796" for R8A7796 (R-Car M3-W) compatible LVDS encoders
> +  - "renesas,lvds-r8a77995" for R8A77995 (R-Car D3) compatible LVDS encoders

Hi Laurent,

Are we unable to have a generic lvds-gen3 here?

(Although to perhaps answer my own question I see that the D3/E3 have extra
registers)

Also "lets pretend" that I intentionally separated out the LVDS updates to the
rcar_lvds_of_table :)

--
Kieran

>  
>  - reg: Base address and length for the memory-mapped registers
>  - clocks: A phandle + clock-specifier pair for the functional clock
> 
