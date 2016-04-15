From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: Add bindings for phy-da8xx-usb
Date: Fri, 15 Apr 2016 13:48:01 +0300
Message-ID: <5710C6E1.8010401@cogentembedded.com>
References: <1460658919-4965-1-git-send-email-david@lechnology.com>
 <1460658919-4965-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460658919-4965-3-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: petr@barix.com, khilman@kernel.org, nsekhar@ti.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 4/14/2016 9:35 PM, David Lechner wrote:

> Device tree binding for new phy-da8xx-usb driver.
>
> Signed-off-by: David Lechner <david@lechnology.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>
> v4 changes:
>
> * swapped order of usb20 and usb11 to be in logical order of reg address.
>
>   .../devicetree/bindings/phy/phy-da8xx-usb.txt      | 40 ++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
>
> diff --git a/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
> new file mode 100644
> index 0000000..bead185
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
> @@ -0,0 +1,40 @@
> +TI DaVinci DA8xx USB PHY

    DA8xx is not DaVinci, please omit this.

> +
> +Required properties:
> + - compatible: must be "ti,da830-usbphy".
> + - #phy-cells: must be 1.
> +
> +This device controls the PHY for both the USB 1.1 OHCI and USB 2.0 OTG
> +controllers on DA8xx SoCs. Consumers of this device should use index 0 for
> +the USB 2.0 phy device and index 1 for the USB 1.1 phy device.

    Not indices 2 and 1 already?

> +It also requires a "syscon" node with compatible = "ti,da830-cfgchip", "syscon"
> +to access the CFGCHIP2 register.
> +
> +Example:
> +
> +	cfgchip: cfgchip@1417c {
> +		compatible = "ti,da830-cfgchip", "syscon";
> +		reg = <0x1417c 0x14>;
> +	};
> +
> +	usbphy: usbphy {

    Name it "usb-phy" please, consistent to what ePAPR has mandated for 
Ethernet PHYs.

[...]

MBR, Sergei
