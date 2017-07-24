From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] soc: renesas: rcar-sysc: Add support for R-Car D3
 power areas
Date: Mon, 24 Jul 2017 14:59:05 -0500
Message-ID: <20170724195905.3wsf6kuxfgygbsuw@rob-hp-laptop>
References: <1500554094-22198-1-git-send-email-geert+renesas@glider.be>
 <1500554094-22198-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1500554094-22198-4-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 20, 2017 at 02:34:53PM +0200, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  .../bindings/power/renesas,rcar-sysc.txt           |  1 +
>  drivers/soc/renesas/Kconfig                        |  5 ++++
>  drivers/soc/renesas/Makefile                       |  1 +
>  drivers/soc/renesas/r8a77995-sysc.c                | 31 ++++++++++++++++++++++
>  drivers/soc/renesas/rcar-sysc.c                    |  3 +++
>  drivers/soc/renesas/rcar-sysc.h                    |  1 +
>  6 files changed, 42 insertions(+)
>  create mode 100644 drivers/soc/renesas/r8a77995-sysc.c

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
