From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 1/2] phy: add lpc18xx usb otg phy driver
Date: Fri, 22 May 2015 16:48:50 +0530
Message-ID: <555F109A.3030503@ti.com>
References: <1432223961-26101-1-git-send-email-manabian@gmail.com> <1432223961-26101-2-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432223961-26101-2-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thursday 21 May 2015 09:29 PM, Joachim Eastwood wrote:
> Add PHY driver for the internal USB OTG PHY found on NXP
> LPC18xx and LPC43xx devices. This driver takes care of
> enabling the PHY in CREG (syscon) and setting the required
> clock frequency.
>
> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/phy/Kconfig               |  11 +++
>   drivers/phy/Makefile              |   1 +
>   drivers/phy/phy-lpc18xx-usb-otg.c | 143 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 155 insertions(+)
>   create mode 100644 drivers/phy/phy-lpc18xx-usb-otg.c
>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index a53bd5b52df9..e11fb9e3c760 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -52,6 +52,17 @@ config PHY_EXYNOS_MIPI_VIDEO
>   	  Support for MIPI CSI-2 and MIPI DSI DPHY found on Samsung S5P
>   	  and EXYNOS SoCs.
>
> +config PHY_LPC18XX_USB_OTG
> +	tristate "NXP LPC18xx/43xx SoC USB OTG PHY driver"
> +	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
> +	select GENERIC_PHY
> +	select MFD_SYSCON

using select on visible symbols should be avoided. see [1]

[1] -> 
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/kbuild/kconfig-language.txt#n111

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
