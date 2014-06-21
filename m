From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: imx6: add aristainetos board support
Date: Sat, 21 Jun 2014 16:57:11 +0800
Message-ID: <20140621085710.GA18165@dragon>
References: <1403275967-22317-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403275967-22317-1-git-send-email-hs-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 20, 2014 at 04:52:47PM +0200, Heiko Schocher wrote:
> This patch add support for the imx6dl based aristainetos board
> with following configuration:
> 
> CPU:   Freescale i.MX6DL rev1.1 at 792 MHz
> DRAM:  1 GiB
> NAND:  512 MiB
> MMC:   FSL_SDHC: 0, FSL_SDHC: 1
> SF: Detected N25Q128 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
> 
> As this board can used with 2 different display types, the
> differences between them are extracted into 2 DTS files, and
> the common settings are collected in a common file.
> 
> Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
