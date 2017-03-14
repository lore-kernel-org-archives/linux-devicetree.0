From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx50: imx50-esdhc use imx53-esdhc
Date: Tue, 14 Mar 2017 15:12:33 +0800
Message-ID: <20170314071231.GI3618@dragon>
References: <1488488628-11711-1-git-send-email-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1488488628-11711-1-git-send-email-akurz-3EoFODjbY6Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Kurz <akurz-3EoFODjbY6Q@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 02, 2017 at 10:03:48PM +0100, Alexander Kurz wrote:
> According to the reference manuals, both imx50/imx53 SOC seem to share
> the same eSDHC controller, especially the section on "Multi-block Read"
> mentioned in commit 361b8482026c ("mmc: sdhci-esdhc-imx: fix multiblock
> reads on i.MX53") is identical for both SOC.
> Hence, let imx50 use imx53-esdhc.
> 
> Signed-off-by: Alexander Kurz <akurz-3EoFODjbY6Q@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
