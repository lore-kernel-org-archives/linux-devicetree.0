From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: imx: add Gateworks Ventana GW553x support
Date: Mon, 15 Aug 2016 20:15:36 +0800
Message-ID: <20160815121536.GA500@tiger>
References: <1467207146-4842-1-git-send-email-tharvey@gateworks.com>
 <1470768547-869-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470768547-869-1-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 09, 2016 at 11:49:07AM -0700, Tim Harvey wrote:
> The Gateworks Ventana GW553x is a single-board computer based on the NXP
> IMX6 SoC with the following features:
>  * IMX6 DualLite Soc (supports IMX6S,IMX6DL,IMX6Q)
>  * small form factor (35x70mm)
>  * 512MB DDR3 DRAM (2x32bit) (options up to 2GB)
>  * 256MB NAND flash (4GB option)
>  * Gateworks System Controller:
>   - hardware watchdog
>   - hardware monitor
>   - pushbutton controller
>   - EEPROM storage
>   - power control
>  * JTAG programmable
>  * 1x miniPCI socket (with PCIe, USB, SIM)
>  * 1x microSD socket
>  * 1x SIM socket
>  * Inertial Module (LSM9DS1 9DOF: 3x acc, 3x rate, 3x mag)
>  * analog CVBS video in
>  * GPS (optional uBlox EVA-M8M)
>  * Application headers:
>   - 2x TTL UART (TX/RX)
>   - 4x TTL GPIO (3x configurable as PWM)
>   - 3x CVBS Analog video input (1x decoder with 3x selectable inputs)
>  * Front panel connectors:
>   - micro-HDMI audio/video out
>   - 1x user programmable LED
>   - 1x configurable user pushbutton
>   - 1x USB OTG
> 
> See http://www.gateworks.com for more info
> 
> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
