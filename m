From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 1/5] ARM: imx: add suspend in ocram support on i.mx6q
Date: Mon, 13 Jan 2014 16:09:25 +0800
Message-ID: <20140113080923.GR23525@S2101-09.ap.freescale.net>
References: <1389592718-9999-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389592718-9999-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 13, 2014 at 01:58:34PM +0800, Anson Huang wrote:
> +			pm_info->mmdc_io_val[i][1] =
> +				readl_relaxed(*(&pm_info->iomuxc_base.vbase) +

*(&pm_info->iomuxc_base.vbase) is just pm_info->iomuxc_base.vbase

Shawn

> +				imx6q_mmdc_io_dsm_offset[i]);

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
