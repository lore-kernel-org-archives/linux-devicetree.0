From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/5] ARM:dts:imx6:phyflex: dt update
Date: Wed, 19 Nov 2014 09:32:39 +0800
Message-ID: <20141119013237.GC24042@dragon>
References: <1415971946-48975-1-git-send-email-c.hemp@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415971946-48975-1-git-send-email-c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 14, 2014 at 02:32:21PM +0100, Christian Hemp wrote:
> This series updates the PHYTEC phyFLEX-i.MX6 board.
>  - set nodes in correct order
>  - enables gpmi in pfla02
>  - sets the correct PMIC interrupt
>  - add support for PCIe and CAN
> 
> Based on branch for-next from Shawn Guo:
> git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> 
> Christian Hemp (5):
>   ARM:dts:imx6:phyFLEX: set nodes in alphabetical order
>   ARM:dts:imx6:phyFLEX: Enable gpmi in module file
>   ARM:dts:imx6:phyFLEX: Set correct interrupt for pmic
>   ARM:dts:imx6:phyFLEX: Add PCIe
>   ARM:dts:imx6:phyFLEX: Add CAN support

Applied all, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
