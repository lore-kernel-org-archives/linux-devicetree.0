From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: usb: rt1711h device tree binding
 document
Date: Mon, 26 Mar 2018 17:23:36 -0500
Message-ID: <20180326222336.jqix6k4pyqy4bg36@rob-hp-laptop>
References: <1521537304-7531-1-git-send-email-leechu729@gmail.com>
 <1521537304-7531-3-git-send-email-leechu729@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521537304-7531-3-git-send-email-leechu729@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ShuFan Lee <leechu729@gmail.com>
Cc: greg@kroah.com, heikki.krogerus@linux.intel.com, linux@roeck-us.net, mark.rutland@arm.com, shufan_lee@richtek.com, cy_huang@richtek.com, jun.li@nxp.com, mats.dev.list@gmail.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2018 at 05:15:04PM +0800, ShuFan Lee wrote:
> From: ShuFan Lee <shufan_lee@richtek.com>
> 
> Add device tree binding document for Richtek RT1711H Type-C chip driver
> 
> Signed-off-by: ShuFan Lee <shufan_lee@richtek.com>
> ---
>  .../devicetree/bindings/usb/richtek,rt1711h.txt    | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
> 
>  changelogs between v2 & v3
>  - add dt-bindings for rt1711h typec driver
> 
> diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
> new file mode 100644
> index 000000000000..7da4dac78ea7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
> @@ -0,0 +1,30 @@
> +Richtek RT1711H TypeC PD Controller.
> +
> +Required properties:
> + - compatible : Must be "richtek,rt1711h".
> + - reg : Must be 0x4e, it's slave address of RT1711H.
> +
> +Recommended properties :
> + - interrupt-parent : the phandle for the interrupt controller that
> +   provides interrupts for this device.
> + - interrupts : <a b> where a is the interrupt number and b represents an
> +   encoding of the sense and level information for the interrupt.
> +
> +Optional properties :
> + - rt,intr-gpios : IRQ GPIO pin that's connected to RT1711H interrupt.
> +   if interrupt-parent & interrupts are not defined, use this property instead.

Drop this. You should simply always have interrupts property.

Rob
