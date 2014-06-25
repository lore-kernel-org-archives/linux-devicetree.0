From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6sx: iomux-gpr syscon is compatible to imx6q
Date: Wed, 25 Jun 2014 15:33:44 +0800
Message-ID: <20140625073343.GE2224@dragon>
References: <1403503442-2273-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403503442-2273-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 23, 2014 at 02:04:01PM +0800, Anson Huang wrote:
> The imx6sx iomuxc-gpr syscon is compatible to imx6q, so let's add
> compatible string 'fsl,imx6q-iomuxc-gpr' for imx6sx iomuxc-gpr syscon node.
> 
> This is necessary to enable SW workaround for ERR007265,
> please refer to imx6_pm_common_init of arch/arm/mach-imx/pm-imx6.c
> for detail.
> 
> Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
