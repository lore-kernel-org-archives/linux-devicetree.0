From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 1/8] phy: miphy28lp: Add Device Tree bindings for the
 MiPHY28lp
Date: Mon, 8 Sep 2014 20:03:39 +0530
Message-ID: <540DBE43.50403@ti.com>
References: <1409758637-28654-1-git-send-email-gabriel.fernandez@linaro.org> <1409758637-28654-2-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409758637-28654-2-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, alexandre torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wednesday 03 September 2014 09:07 PM, Gabriel FERNANDEZ wrote:
> The MiPHY28lp is a Generic PHY which can serve various SATA or PCIe
> or USB3 devices.
> 
> Signed-off-by: alexandre torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/phy/phy-miphy28lp.txt      | 126 +++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-miphy28lp.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt b/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt
> new file mode 100644
> index 0000000..5e307af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt
> @@ -0,0 +1,126 @@
> +STMicroelectronics STi MIPHY28LP PHY binding
> +============================================
> +
> +This binding describes a miphy device that is used to control PHY hardware
> +for SATA, PCIe or USB3.
> +
> +Required properties (controller (parent) node):
> +- compatible	: Should be "st,miphy28lp-phy"
> +- st,syscfg	: Should be a phandle of the system configuration register group
> +		  which contain the SATA, PCIe or USB3 mode setting bits
> +
> +Required nodes	:  A sub-node is required for each channel the controller
> +		   provides. Address range information including the usual
> +		   'reg' and 'reg-names' properties are used inside these
> +		   nodes to describe the controller's topology. These nodes
> +		   are translated by the driver's .xlate() function.
> +
> +Required properties (port (child) node):
> +- #phy-cells	: Should be 1 (See second example)
> +		  Cell after port phandle is device type from:
> +			- MIPHY_TYPE_SATA
> +			- MIPHY_TYPE_PCI
> +			- MIPHY_TYPE_USB3
> +- reg		: Address and length of the register set for the device
> +- reg-names	: The names of the register addresses corresponding to the registers
> +		  filled in "reg". Is can also contain the offset of the system configuration

%s/Is/It

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
