From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH  0/5] Add USB2.0 Host support
Date: Thu, 12 Oct 2017 12:15:23 +0200
Message-ID: <20171012101522.bbfst7qegni6vlvc@verge.net.au>
References: <1507557541-46560-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507557541-46560-1-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 09, 2017 at 02:58:56PM +0100, Biju Das wrote:
> Hello,
> 
> This series aims to add USB2.0 Host support on iWave RZ/G1E(r8a7745) based board.
> 
> This series has been tested against renesas-dev tag 20171009-v4.14-rc4
> 
> This patch has documentation dependency on below patch
>  * [RESEND] phy: rcar-gen2: Add r8a7743/5 support
> https://patchwork.kernel.org/patch/9992587/
> 
> Biju Das (5):
>   ARM: dts: r8a7745: Add internal PCI bridge nodes
>   ARM: dts: r8a7745: Add USB PHY DT support
>   ARM: dts: r8a7745: Link PCI USB devices to USB PHY
>   ARM: dts: iwg22d-sodimm: Enable internal PCI
>   ARM: dts: iwg22d-sodimm: Enable USB PHY

Thanks, applied with Geert's review tags.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
