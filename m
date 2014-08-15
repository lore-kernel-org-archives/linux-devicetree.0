From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH RFC 7/7] usb: host: ohci-exynos: Remove unnecessary
 usb-phy support
Date: Fri, 15 Aug 2014 11:22:30 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1408151122160.1144-100000@iolanthe.rowland.org>
References: <1408026240-28365-8-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408026240-28365-8-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, balbi@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, gregkh@linuxfoundation.org, jg1.han@samsung.com, s.nawrocki@samsung.com, k.debski@samsung.com
List-Id: devicetree@vger.kernel.org

On Thu, 14 Aug 2014, Vivek Gautam wrote:

> Now that we have completely moved from older USB-PHY drivers
> to newer GENERIC-PHY drivers for PHYs available with USB controllers
> on Exynos series of SoCs, we can remove the support for the same
> in our host drivers too.
> This should fix the issue on ohci-exynos, wherein in the absence of
> SAMSUNG_USB2PHY config symbol, we ended up getting the NOP_USB_XCEIV phy
> when the same is enabled. And thus the PHYs are not configured properly.
> 
> Reported-by: Sachin Kamat <sachin.kamat@samsung.com>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>

Acked-by: Alan Stern <stern@rowland.harvard.edu>
