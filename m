From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: phy: Add qcom,usb-hsic-phy bindings
Date: Mon, 20 Jun 2016 11:26:22 -0500
Message-ID: <20160620162622.GA21783@rob-hp-laptop>
References: <1466159119-20310-1-git-send-email-narmstrong@baylibre.com>
 <1466159119-20310-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466159119-20310-3-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 17, 2016 at 12:25:19PM +0200, Neil Armstrong wrote:
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/phy/qcom,usb-hsic-phy.txt  | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.txt b/Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.txt
> new file mode 100644
> index 0000000..79259a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.txt
> @@ -0,0 +1,95 @@
> +Qualcomm's MDM9615 USB HISC transceiver controller
> +
> +- compatible:
> +    Usage: required
> +    Value type: <string>
> +    Definition: Should contain "qcom,usb-hsic-phy".

SoC specific compatible string please.

> +
> +- reg:
> +    Usage: required
> +    Value type: <prop-encoded-array>
> +    Definition: USB PHY base address and length of the register map
> +
> +- clocks:
> +    Usage: required
> +    Value type: <prop-encoded-array>
> +    Definition: See clock-bindings.txt section "consumers". List of
> +                5 clock specifiers for interface and core controller
> +                clocks.
> +
> +- clock-names:
> +    Usage: required
> +    Value type: <string>
> +    Definition: Must contain "core", "alt-core", "phy", "cal" and "iface" strings.
> +
> +- vddcx-supply:
> +    Usage: required
> +    Value type: <phandle>
> +    Definition: phandle to the regulator VDCCX supply node.
> +
> +- resets:
> +    Usage: required
> +    Value type: <prop-encoded-array>
> +    Definition: See reset.txt section "consumers". PHY reset specifier.
> +
> +- reset-names:
> +    Usage: required
> +    Value type: <string>
> +    Definition: Must contain "link" string.
> +
> +- interrupts:
> +    Usage: required
> +    Value type: <prop-encoded-array>
> +    Definition: Interrupt line definition for the PHY
> +
> +- dr_mode:
> +    Usage: required
> +    Value type: <prop-encoded-array>
> +    Definition: Setup the PHY mode, either "host", "gadget" or "dual"
> +
> +- qcom,vdd-levels:
> +    Usage: required for MDM9615
> +    Value type: <prop-encoded-array>
> +    Definition: Setup the valid vdd levers for the vddx-supply

s/levers/levels/

There's not a common regulator property for this?

> +
> +- phy_type:
> +    Usage: required
> +    Value type: <prop-encoded-array>
> +    Definition: Shall be "hisc"

typo

> +
> +- qcom,tlmm:
> +    Usage: required for MDM961

s/MDM961/MDM9615/

or drop because this binding is only for MDM9615.

> +    Value type: <prop-encoded-array>
> +    Definition: TLMM syscon phandle to setup the HSIC lines
> +
> +- qcom,tlmm-cfg:
> +    Usage: required for MDM961

s/MDM961/MDM9615/

> +    Value type: <prop-encoded-array>
> +    Definition: Shall be two entries of offset, data of the HSIC lines setup

This property is somewhat questionable with just magic register address 
and value to write...
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
