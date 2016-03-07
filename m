From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/7] mtd: spi-nor: fsl-quadspi: add big-endian support
Date: Mon, 7 Mar 2016 12:34:10 -0800
Message-ID: <20160307203410.GX55664@google.com>
References: <1453793041-35868-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453793041-35868-1-git-send-email-yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yao.yuan-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 26, 2016 at 03:23:55PM +0800, Yuan Yao wrote:
> Add R/W functions for big- or little-endian registers:
> The qSPI controller's endian is independent of the CPU core's endian.
> So far, the qSPI have two versions for big-endian and little-endian.
> 
> Signed-off-by: Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>
> Acked-by: Han xu <han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Pushed patches 1, 2, 3, 5, and 7 to l2-mtd.git. Patch 4 seems unrelated,
and patch 6 should go through arm-soc.

Regards,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
