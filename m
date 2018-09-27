From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH 4/5] usb: host: Add XHCI driver for Broadcom STB SoCs
Date: Thu, 27 Sep 2018 08:57:09 +0300
Message-ID: <87a7o3scsq.fsf@linux.intel.com>
References: <1538000414-24873-1-git-send-email-alcooperx@gmail.com> <1538000414-24873-5-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538000414-24873-5-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Jianguo Sun <sunjianguo1@huawei.com>, James Hogan <jhogan@kernel.org>, Alban Bedel <albeu@free.fr>, Lu Baolu <baolu.lu@linux.intel.com>, Avi Fishman <avifishman70@gmail.com>, Alex Elder <elder@linaro.org>, Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org, dev
List-Id: devicetree@vger.kernel.org


Hi,

Al Cooper <alcooperx@gmail.com> writes:

> This driver enables USB XHCI on Broadcom ARM STB SoCs.
> The drivers depend on a matching "brcm,brcmstb-usb-phy"
> Broadcom STB USB Phy driver.
>
> The standard platform driver can't be used because of differences
> in PHY and Clock handling. The standard PHY handling in hcd.c will
> do a phy_exit/phy_init on suspend/resume and this will end up
> shutting down the PHYs to the point that the host controller
> registers are no longer accessible and will cause suspend to crash.
> The clocks specified in device tree for these drivers are not
> available in mainline so instead of returning EPROBE_DEFER when
> the specified clock is not found and eventually failing probe,
> the clock pointer is set to NULL which disables all clock handling.
>
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  drivers/usb/host/xhci-brcm.c | 294 +++++++++++++++++++++++++++++++++++++++++++

this looks a lot like xhci-plat.c, why don't you use that instead?

- 
balbi
