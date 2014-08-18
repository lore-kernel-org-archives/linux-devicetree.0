From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/7] usb-phy: samsung-usb3: Remove older phy-samsung-usb3
 driver
Date: Mon, 18 Aug 2014 10:34:05 +0900
Message-ID: <009e01cfba84$7f795060$7e6bf120$%han@samsung.com>
References: <1408026240-28365-1-git-send-email-gautam.vivek@samsung.com>
 <1408026240-28365-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1408026240-28365-2-git-send-email-gautam.vivek@samsung.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, 'Felipe Balbi' <balbi@ti.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, s.nawrocki@samsung.com, k.debski@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: devicetree@vger.kernel.org

On Thursday, August 14, 2014 11:24 PM, Vivek Gautam wrote:
> 
> Removing this older USB 3.0 DRD controller PHY driver, since
> a new driver based on generic phy framework is now available.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/usb/phy/Kconfig            |    8 -
>  drivers/usb/phy/Makefile           |    1 -
>  drivers/usb/phy/phy-samsung-usb.h  |   80 ---------
>  drivers/usb/phy/phy-samsung-usb3.c |  350 ------------------------------------
>  4 files changed, 439 deletions(-)
>  delete mode 100644 drivers/usb/phy/phy-samsung-usb3.c
