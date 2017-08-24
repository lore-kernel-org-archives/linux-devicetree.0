From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: dtsi: r8a7745: iwg22m: Add eMMC support
Date: Thu, 24 Aug 2017 06:44:30 -0400
Message-ID: <20170824104430.GA27788@verge.net.au>
References: <1502991103-2325-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1502991103-2325-1-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 17, 2017 at 06:31:41PM +0100, Fabrizio Castro wrote:
> This series adds eMMC support to r8a7745 SoC and iW-RainboW-G22M-SM SoM.
> 
> Testing has been made on top of Renesas's devel branch.
> 
> The patches contained in this series depend on the following patches:
> [1/2] ARM: dts: iwg22m: Add iWave RZG1E SODIMM SOM - https://patchwork.kernel.org/patch/9901619/
> [2/2] ARM: dts: iwg22d-sodimm: Add support for iWave G22D-SODIMM board - https://patchwork.kernel.org/patch/9901623/
> dt-bindings: mmc: sh_mmcif: Document r8a7745 DT bindings - https://patchwork.kernel.org/patch/9902199/

Thanks, applied for v4.15.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
