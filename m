From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3] arm64: dts: rockchip: add roc-rk3328-cc board
Date: Fri, 02 Feb 2018 22:47:23 +0100
Message-ID: <3332426.dR0IG2DWyn@phil>
References: <20180106094538.15568-1-djw@t-chip.com.cn> <20180123021017.24110-1-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180123021017.24110-1-djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Levin Du <zslevin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Levin,

Am Dienstag, 23. Januar 2018, 03:10:17 CET schrieb djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org:
> From: Levin Du <djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>
> 
> Hi all,
> 
> v3:
> Use pmic@18 instead of rk805@18
> Use macro definition RK_Pxx in gpio number
> 
> v2:
> Use SPDX license tag
> 
> Thanks.
> 
> The roc-rk3328-cc is a credit card size single board computer using the
> Rockchip RK3328 Quad-Core ARM Cortex A53 64-Bit Processor and supporting
> up to 2GB 2133MHz LPDDR4 memory. It provides eMMC module socket, MicroSD
> Card slot, USB 2.0/3.0, Gigabit Ethernet, HDMI/CVBS, Infrared Receiver,
> SPDIF/I2S, and SPI/I2C/UART/PWM interfaces.
> 
> The devicetree currently supports basic peripherals.
> 
> Signed-off-by: Levin Du <djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>

I've applied the patch for 4.17 with some changes:
- dropped the version prose in the commit message as noted by Rob
- dropped the usbdrd3 elements for the time being.
  Definitly not your fault and I did pick up the core usb3 enablement
  for the rk3328, but it looks like this needs a bit more time as the phy
  has this issue of not recognizing device unpluggs, making the controller
  not taking any plug events after that at all.
  So I want to make that actually work, before I bind myself to the binding
  using the dwc3-of-simple stuff.
  We can readd the dwc3 nodes to the roc-3328-cc once that works correctly.

Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
