From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: defconfig: Add Renesas R-Car USB 3.0 driver
 support
Date: Thu, 21 Apr 2016 13:15:14 +1000
Message-ID: <20160421031514.GB11116@verge.net.au>
References: <1461142034-5008-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461142034-5008-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Wed, Apr 20, 2016 at 05:47:14PM +0900, Yoshihiro Shimoda wrote:
> If we doesn't enable this configuration and runs on R-Car Gen3,
> xhci host driver will cause timeout in xhci_reset() because
> the R-Car Gen3 xHCI controller needs specific initialization.
> 
> [    1.565605] xhci-hcd ee000000.usb: xHCI Host Controller
> [    1.570636] xhci-hcd ee000000.usb: new USB bus registered, assigned bus number 5
> [   22.270160] xhci-hcd ee000000.usb: can't setup: -110
> [   22.274931] xhci-hcd ee000000.usb: USB bus 5 deregistered
> [   22.280158] xhci-hcd: probe of ee000000.usb failed with error -110
> 
> Remarks:
> The timestamp doesn't work correctly on R-Car H3 ES1.0. It should be
> 10 seconds.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  arch/arm64/configs/defconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index a44ef99..a95751d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1,7 +1,6 @@
>  # CONFIG_LOCALVERSION_AUTO is not set
>  CONFIG_SYSVIPC=y
>  CONFIG_POSIX_MQUEUE=y
> -CONFIG_FHANDLE=y
>  CONFIG_AUDIT=y
>  CONFIG_NO_HZ_IDLE=y
>  CONFIG_HIGH_RES_TIMERS=y

Is the hunk above intended?
It does not seem to match my reading of the changelog.

> @@ -192,7 +191,7 @@ CONFIG_SND_SOC_AK4613=y
>  CONFIG_USB=y
>  CONFIG_USB_OTG=y
>  CONFIG_USB_XHCI_HCD=y
> -CONFIG_USB_XHCI_PLATFORM=y
> +CONFIG_USB_XHCI_RCAR=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_MSM=y
>  CONFIG_USB_EHCI_HCD_PLATFORM=y
> -- 
> 1.9.1
