From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] usb: phy: mxs: Add DT bindings to configure TX
 settings
Date: Fri, 18 Mar 2016 16:19:36 -0500
Message-ID: <20160318211936.GA4158@rob-hp-laptop>
References: <1457040571-7775-1-git-send-email-jaret.cantu@timesys.com>
 <1458060853-15115-1-git-send-email-jaret.cantu@timesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458060853-15115-1-git-send-email-jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2016 at 12:54:13PM -0400, Jaret Cantu wrote:
> The TX settings can be calibrated for particular hardware.  The
> phy is reset by Linux, so this cannot be handled by the bootloader.
> 
> The TRM mentions that the maximum resistance should be used for the
> DN/DP calibration in order to pass USB certification.
> 
> The values for the TX registers are poorly described in the TRM.
> The meanings of the register values were taken from another
> Freescale-provided document:
> https://community.freescale.com/message/566147#comment-566912
> 
> Signed-off-by: Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
> ---
> v2. Copying devicetree list
>     Removed prettifying extra whitespace
>     Removed unnecessary register rewrite on resume
>     Use min and max constants for clarity
> 
>  .../devicetree/bindings/phy/mxs-usb-phy.txt        |   10 ++++
>  drivers/usb/phy/phy-mxs-usb.c                      |   58 ++++++++++++++++++++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> index 379b84a..2f11e27 100644
> --- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> @@ -12,6 +12,16 @@ Required properties:
>  - interrupts: Should contain phy interrupt
>  - fsl,anatop: phandle for anatop register, it is only for imx6 SoC series
>  
> +Optional properties:
> +- fsl,tx-cal-45-dn: Integer [30-55]. Resistance (in ohms) of switchable
> +  high-speed trimming resistor connected in parallel with the 45 ohm resistor
> +  that terminates the DN output signal. Default: 45
> +- fsl,tx-cal-45-dp: Integer [30-55]. Resistance (in ohms) of switchable
> +  high-speed trimming resistor connected in parallel with the 45 ohm resistor
> +  that terminates the DP output signal. Default: 45

Add unit suffix (-ohms)

> +- fsl,tx-d-cal: Integer [79-119]. Current trimming value (as a percentage) of
> +  the 17.78mA TX reference current. Default: 100
> +
>  Example:
>  usbphy1: usbphy@020c9000 {
>  	compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
