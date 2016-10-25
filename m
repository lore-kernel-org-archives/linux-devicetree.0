From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH/RFT v2 15/17] usb: host: ohci-da8xx: Add devicetree
 bindings documentation
Date: Mon, 24 Oct 2016 20:02:00 -0500
Message-ID: <523928a1-a321-abb6-504f-a1053c88ce53@lechnology.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
 <20161024164634.4330-16-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161024164634.4330-16-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/24/2016 11:46 AM, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org wrote:
> From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>
> This patch documents the device tree bindings required for
> the ohci controller found in TI da8xx family of SoC's
>
> Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/ohci-da8xx.txt         | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ohci-da8xx.txt
>
> diff --git a/Documentation/devicetree/bindings/usb/ohci-da8xx.txt b/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
> new file mode 100644
> index 0000000..4251c84
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
> @@ -0,0 +1,39 @@
> +DA8XX USB OHCI controller
> +
> +Required properties:
> +
> + - compatible: Should be "ti,da830-ohci"
> + - reg:        Should contain one register range i.e. start and length
> + - interrupts: Description of the interrupt line
> + - phys:       Phandle for the PHY device
> + - phy-names:  Should be "usb-phy"
> +
> +Optional properties:
> + - vbus-supply: Regulator that controls vbus power


Isn't vbus-supply property required?

If it is really supposed to be optional, the ohci driver needs to use 
devm_regulator_get_optional() and handle the case when there is no 
regulator.

I don't see a problem with making it required though since one can just 
use a dummy supply if there is not a real one.

> +
> +Example for omap138-lck:
> +
> +vbus_fixed: fixed-regulator-vbus {
> +        compatible = "regulator-fixed";
> +        gpio = <&gpio 109 0>;
> +        oc-gpio = <&gpio 36 0>;
> +        regulator-boot-on;
> +        enable-active-high;
> +        regulator-name = "vbus";
> +        regulator-min-microvolt = <5000000>;
> +        regulator-max-microvolt = <5000000>;
> +};
> +
> +usb_phy: usb-phy {
> +        compatible = "ti,da830-usb-phy";
> +        #phy-cells = <1>;
> +        status = "disabled";

why disabled?

> +};
> +usb: usb@0225000 {
> +        compatible = "ti,da830-ohci";
> +        reg = <0x225000 0x1000>;
> +        interrupts = <59>;
> +        phys = <&usb_phy 1>;
> +        phy-names = "usb-phy";

missing vbus-supply property

> +        status = "disabled";

why disabled?

> +};
>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
