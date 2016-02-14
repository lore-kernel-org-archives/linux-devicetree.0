From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: ls2080a: Add quirk for Erratum A009116
Date: Sun, 14 Feb 2016 15:42:18 +0800
Message-ID: <20160214074218.GL6756@tiger>
References: <1455059287-2500-1-git-send-email-Lijun.Pan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455059287-2500-1-git-send-email-Lijun.Pan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lijun Pan <Lijun.Pan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rajesh.bhagat-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 09, 2016 at 05:08:07PM -0600, Lijun Pan wrote:
> Add "snps,quirk-frame-length-adjustment" property to
> USB3 node for erratum A009116. This property provides
> value of GFLADJ_30MHZ for post silicon frame length
> adjustment.
> 
> Signed-off-by: Lijun Pan <Lijun.Pan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
