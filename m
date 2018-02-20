From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH] usb: host: ehci-platform: add support for optional
 external vbus supply
Date: Tue, 20 Feb 2018 11:27:00 +0200
Message-ID: <9f1f49a0-4afd-a7f1-53bd-18f72abd4753@ti.com>
References: <1519117905-12095-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519117905-12095-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tony Prisk <linux@prisktech.co.nz>, Alan Stern <stern@rowland.harvard.edu>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On 20/02/18 11:11, Amelie Delaunay wrote:
> On some boards, especially when vbus supply requires large current,
> and the charge pump on the PHY isn't enough, an external vbus power switch
> may be used.
> Add support for this optional external vbus supply in ehci-platform.

Isn't this generic enough to be done for all *hci-platform drivers?

And if this is a VBUS supply to the port, the root hub driver should be controlling it
based on port power on/off commands to the port right?

> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-ehci.txt |  1 +
>  drivers/usb/host/ehci-platform.c                   | 23 ++++++++++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
> index 3efde12..fc480cd 100644
> --- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-ehci.txt
> @@ -19,6 +19,7 @@ Optional properties:
>   - phys : phandle + phy specifier pair
>   - phy-names : "usb"
>   - resets : phandle + reset specifier pair
> + - vbus-supply : phandle of regulator supplying vbus
>  
>  Example (Sequoia 440EPx):
>      ehci@e0000300 {
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index b065a96..76cc781 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -29,6 +29,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
> @@ -46,6 +47,7 @@ struct ehci_platform_priv {
>  	struct reset_control *rsts;
>  	struct phy **phys;
>  	int num_phys;
> +	struct regulator *vbus_supply;
>  	bool reset_on_resume;
>  };
>  
> @@ -99,6 +101,15 @@ static int ehci_platform_power_on(struct platform_device *dev)
>  		}
>  	}
>  
> +	if (priv->vbus_supply) {
> +		ret = regulator_enable(priv->vbus_supply);
> +		if (ret) {
> +			dev_err(&dev->dev,
> +				"failed to enable vbus supply: %d\n", ret);
> +			goto err_exit_phy;
> +		}
> +	}
> +
>  	return 0;
>  
>  err_exit_phy:
> @@ -119,6 +130,9 @@ static void ehci_platform_power_off(struct platform_device *dev)
>  	struct ehci_platform_priv *priv = hcd_to_ehci_priv(hcd);
>  	int clk, phy_num;
>  
> +	if (priv->vbus_supply)
> +		regulator_disable(priv->vbus_supply);
> +

If we disable the VBUS here, which is being called during ehci_platform_suspend(),
how can we expect remote wakeup to work?
This is unconditionally powering down the port.

>  	for (phy_num = 0; phy_num < priv->num_phys; phy_num++) {
>  		phy_power_off(priv->phys[phy_num]);
>  		phy_exit(priv->phys[phy_num]);
> @@ -247,6 +261,15 @@ static int ehci_platform_probe(struct platform_device *dev)
>  	if (err)
>  		goto err_put_clks;
>  
> +	priv->vbus_supply = devm_regulator_get_optional(&dev->dev, "vbus");
> +	if (IS_ERR(priv->vbus_supply)) {
> +		err = PTR_ERR(priv->vbus_supply);
> +		if (err == -ENODEV)
> +			priv->vbus_supply = NULL;
> +		else
> +			goto err_reset;
> +	}
> +
>  	if (pdata->big_endian_desc)
>  		ehci->big_endian_desc = 1;
>  	if (pdata->big_endian_mmio)
> 

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
