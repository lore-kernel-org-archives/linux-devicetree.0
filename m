From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: usb: dwc2: document the vbus-supply property
Date: Wed, 27 Mar 2019 18:42:17 -0500
Message-ID: <20190327234217.GA8346@bogus>
References: <20190306212431.5779-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190306212431.5779-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: hminas@synopsys.com, gregkh@linuxfoundation.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, amelie.delaunay@st.com, felipe.balbi@linux.intel.com
List-Id: devicetree@vger.kernel.org

On Wed, Mar 06, 2019 at 10:24:31PM +0100, Martin Blumenstingl wrote:
> Various boards have an external VBUS supply regulator. This regulator
> depends on the current mode of the controller which is defined as:
> - dr_mode set to either "host" or "peripheral" (fixed value)
> - dr_mode set to "otg", based on the OTG status the dwc2 controller
>   internally switches between "host" and "peripheral" mode (selection
>   happens at runtime)
> 
> Based on the current mode the regulator has to be enabled or disabled:
> - host: provide power to the connected USB device, thus the regulator
>   has to be enabled
> - peripheral: the host device to which the controller is connected
>   provides power, thus the regulator has to be disabled
> 
> Add the dt-bindings documentation for this property so .dts authors know
> that this property exists and how it behaves.
> 
> Fixes: 531ef5ebea9639 ("usb: dwc2: add support for host mode external vbus supply")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> index 6dc3c4a34483..1e8a775a0e72 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> @@ -31,6 +31,10 @@ Refer to clk/clock-bindings.txt for generic clock consumer properties
>  Optional properties:
>  - phys: phy provider specifier
>  - phy-names: shall be "usb2-phy"
> +- vbus-supply: reference to the VBUS regulator. Depending on the current mode
> +  this is enabled (in "host" mode") or disabled (in "peripheral" mode). The
> +  regulator is updated if the controller is configured in "otg" mode and the
> +  status changes between "host" and "peripheral".

This is actually wrong IMO unless Vbus is powering the controller 
itself. If it is just a regulator routed to the USB connector, then the 
DT should use the usb-connector binding and put vbus-supply there. If 
the driver needs it, then it can walk the tree/graph and get it. For 
some reason folks seem to think everything the driver needs has to be in 
the node associated with the driver.

</rant>

I guess given this is already in use:

Acked-by: Rob Herring <robh@kernel.org>

>  Refer to phy/phy-bindings.txt for generic phy consumer properties
>  - dr_mode: shall be one of "host", "peripheral" and "otg"
>    Refer to usb/generic.txt
> -- 
> 2.21.0
> 
