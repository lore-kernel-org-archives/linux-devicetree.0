From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] usb: phy: mxs: Add DT bindings to configure TX
 settings
Date: Wed, 23 Mar 2016 12:36:38 +0800
Message-ID: <20160323043638.GA18462@peterchendt>
References: <20160318211936.GA4158@rob-hp-laptop>
 <1458577947-12614-1-git-send-email-jaret.cantu@timesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458577947-12614-1-git-send-email-jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 21, 2016 at 12:32:27PM -0400, Jaret Cantu wrote:
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
> v3. Added unit suffix (-ohms) to tx-cal-45-d*
> 
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
> index 379b84a..1d25b04 100644
> --- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> @@ -12,6 +12,16 @@ Required properties:
>  - interrupts: Should contain phy interrupt
>  - fsl,anatop: phandle for anatop register, it is only for imx6 SoC series
>  
> +
> +	if (!of_property_read_u32(np, "fsl,tx-d-cal", &val) &&
> +	    val >= MXS_PHY_TX_D_CAL_MIN && val <= MXS_PHY_TX_D_CAL_MAX) {
> +		/* scale to 4-bit value */
> +		val = (MXS_PHY_TX_D_CAL_MAX - val) * 0xF
> +			/ (MXS_PHY_TX_D_CAL_MAX - MXS_PHY_TX_D_CAL_MIN);
> +		mxs_phy->tx_reg_mask |= GM_USBPHY_TX_D_CAL(~0);
> +		mxs_phy->tx_reg_set  |= GM_USBPHY_TX_D_CAL(val);
> +	}
> +

I have tested "tx-d-cal", but it seems incorrect according to the xls you
have provided, would you please check it again or am I wrong?

dts changes:

+&usbphy1 {
+       fsl,tx-d-cal = <109>;
+};
+
+&usbphy2 {
+       fsl,tx-d-cal = <106>;
+};
+

The phy1's tx-d-cal is 0x3, and phy2's tx-d-cal is 0x4 after PHY initialization, 
but according to xls, it should be 0x4 and 0x5.

-- 
Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
