From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/2] ARM: imx6sx-sdb: add revb board
Date: Thu, 26 Feb 2015 20:56:44 +0800
Message-ID: <20150226125642.GI20028@dragon>
References: <1424939310-19282-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424939310-19282-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 26, 2015 at 04:28:28PM +0800, Peter Chen wrote:
> Changes for v3:
> - Rebased on v4.0-rc1
> 
> Changes for v2:
> 
> - Add missing Makefile entries for both dts files. [Patch 1/2] and [Patch 2/2]
> - Delete OOP setting changed at imx6sx-sdb-reva, it is SoC feature,
>   it doesn't need to be change unless board limitations. [Patch 1/2]
> - Add explanation why OOP setting need to changed at imx6sx-sdb revb board. [Patch 2/2]
> - Make imx6sx-sdb revb board as default imx6sx-sdb board. [Patch 2/2]
> 
> Hi Shawn,
> 
> The imx6sx-sdb board has two revisions, the current mainline is the
> reva which is experimental and will not be released, the revb board
> is used widely for internal and external users.
> 
> The main changes between reva and revb board:
> - OOP setting
> - pfuse
> - qspi
> - can transceiver (not mainlined)
> 
> Peter Chen (2):
>   ARM: imx6sx-sdb: change default board as reva board
>   ARM: imx6sx-sdb: add revb board and make it default

Applied both, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
