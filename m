From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: dt-bindings: watchdog: renesas-wdt: Document r8a774c0 support
Date: Wed, 19 Dec 2018 18:37:28 -0800
Message-ID: <20181220023728.GA10247@roeck-us.net>
References: <1544732333-6086-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544732333-6086-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 13, 2018 at 08:18:53PM +0000, Fabrizio Castro wrote:
> RZ/G2E (R8A774C0) watchdog implementation is compatible with R-Car
> Gen3, therefore add relevant documentation.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/renesas-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt b/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> index a8ee29f..ef2b97b 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> @@ -9,6 +9,7 @@ Required properties:
>  		 - "renesas,r8a7744-wdt" (RZ/G1N)
>  		 - "renesas,r8a7745-wdt" (RZ/G1E)
>  		 - "renesas,r8a774a1-wdt" (RZ/G2M)
> +		 - "renesas,r8a774c0-wdt" (RZ/G2E)
>  	         - "renesas,r8a7790-wdt" (R-Car H2)
>  	         - "renesas,r8a7791-wdt" (R-Car M2-W)
>  	         - "renesas,r8a7792-wdt" (R-Car V2H)
