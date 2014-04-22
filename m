From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 11/19] usb: phy: msm: Add device tree support and binding
 information
Date: Tue, 22 Apr 2014 17:05:38 +0100
Message-ID: <53569352.3050101@linaro.org>
References: <1398158438-21579-1-git-send-email-iivanov@mm-sol.com> <1398158438-21579-12-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398158438-21579-12-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ivan,

On 22/04/14 10:20, Ivan T. Ivanov wrote:
> From: "Ivan T. Ivanov"<iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>
> Allows MSM OTG controller to be specified via device tree.
>
> Signed-off-by: Ivan T. Ivanov<iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> ---
>   .../devicetree/bindings/usb/msm-hsusb.txt          |  67 ++++++++++=
+++
>   drivers/usb/phy/phy-msm-usb.c                      | 108 ++++++++++=
+++++++----
>   include/linux/usb/msm_hsusb.h                      |   6 +-
>   3 files changed, 159 insertions(+), 22 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/msm-hsusb.txt b/Do=
cumentation/devicetree/bindings/usb/msm-hsusb.txt
> index 5ea26c6..ee4123d 100644
> --- a/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> +++ b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> @@ -15,3 +15,70 @@ Example EHCI controller device node:
>   		usb-phy =3D <&usb_otg>;
>   	};
>
> +USB PHY with optional OTG:
> +
> +Required properties:
> +- compatible:   Should contain:
> +  "qcom,usb-otg-ci" for chipsets with ChipIdea 45nm PHY
> +  "qcom,usb-otg-snps" for chipsets with Synopsys 28nm PHY
> +
> +- regs:         Offset and length of the register set in the memory =
map
> +- interrupts:   interrupt-specifier for the OTG interrupt.
> +
> +- clocks:       A list of phandle + clock-specifier pairs for the
> +                clocks listed in clock-names
> +- clock-names:  Should contain the following:
> +  "phy"         USB PHY reference clock
> +  "core"        Protocol engine clock
> +  "iface"       Interface bus clock
> +  "alt_core"    Protocol engine clock for targets with asynchronous
> +                reset methodology. (optional)
> +
> +- vdccx-supply: phandle to the regulator for the vdd supply for
> +                digital circuit operation.
> +- v1p8-supply:  phandle to the regulator for the 1.8V supply
> +- v3p3-supply:  phandle to the regulator for the 3.3V supply
> +
> +- resets:       A list of phandle + reset-specifier pairs for the
> +                resets listed in reset-names
> +- reset-names:  Should contain the following:
> +  "phy"         USB PHY controller reset
> +  "link"        USB LINK controller reset
> +
> +- qcom,otg-control: OTG control (VBUS and ID notifications) can be o=
ne of
> +                1 - PHY control
> +                2 - PMIC control
> +
> +Optional properties:
> +- dr_mode:      One of "host", "peripheral" or "otg". Defaults to "o=
tg"
> +
> +- qcom,phy-init-sequence: PHY configuration sequence values. This is=
 related to Device
> +                Mode Eye Diagram test. Start address at which these =
values will be
> +                written is ULPI_EXT_VENDOR_SPECIFIC. Value of -1 is =
reserved as
> +                "do not overwrite default value at this address".
> +                For example: qcom,phy-init-sequence =3D < -1 0x63 >;
> +                Will update only value at address ULPI_EXT_VENDOR_SP=
ECIFIC + 1.

I don=92t think DT maintainers will like the sound of it.
Sorry If I missed some old discussion on this.
But I don't this this is the correct way.

DT should describe the system hardware layout rather than initializatio=
n=20
sequence.

The initialization code with magic values should go directly into the=20
driver and depending on the dt-compatible driver should select the righ=
t=20
sequence.

/phy-msm-usb.c
> +++ b/drivers/usb/phy/phy-msm-usb.c
> @@ -30,9 +30,12 @@
>   #include <linux/debugfs.h>
>   #include <linux/seq_file.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>
>   #include <linux/usb.h>
>   #include <linux/usb/otg.h>
> +#include <linux/usb/of.h>
>   #include <linux/usb/ulpi.h>
>   #include <linux/usb/gadget.h>
>   #include <linux/usb/hcd.h>
> @@ -217,16 +220,16 @@ static struct usb_phy_io_ops msm_otg_io_ops =3D=
 {
>   static void ulpi_init(struct msm_otg *motg)
>   {
>   	struct msm_otg_platform_data *pdata =3D motg->pdata;
> -	int *seq =3D pdata->phy_init_seq;
> +	int *seq =3D pdata->phy_init_seq, idx;
> +	u32 addr =3D ULPI_EXT_VENDOR_SPECIFIC;
>
> -	if (!seq)
> -		return;
> +	for (idx =3D 0; idx < pdata->phy_init_sz; idx++) {
> +		if (seq[idx] =3D=3D -1)
> +			continue;
>
> -	while (seq[0] >=3D 0) {
>   		dev_vdbg(motg->phy.dev, "ulpi: write 0x%02x to 0x%02x\n",
> -				seq[0], seq[1]);
> -		ulpi_write(&motg->phy, seq[0], seq[1]);
> -		seq +=3D 2;
> +				seq[idx], addr + idx);
> +		ulpi_write(&motg->phy, seq[idx], addr + idx);
>   	}
>   }

How is above change related to device trees?
>
> @@ -1343,25 +1346,87 @@ static void msm_otg_debugfs_cleanup(void)
>   	debugfs_remove(msm_otg_dbg_root);
>   }
>
> +static struct of_device_id msm_otg_dt_match[] =3D {
> +	{
> +		.compatible =3D "qcom,usb-otg-ci",
> +		.data =3D (void *) CI_45NM_INTEGRATED_PHY
> +	}, {
> +		.compatible =3D "qcom,usb-otg-snps",
> +		.data =3D (void *) SNPS_28NM_INTEGRATED_PHY
> +	}, {}
> +};
> +
> +static int msm_otg_read_dt(struct platform_device *pdev, struct msm_=
otg *motg)
> +{
> +	struct msm_otg_platform_data *pdata;
> +	const struct of_device_id *id;
> +	struct device_node *node =3D pdev->dev.of_node;
> +	struct property *prop;
> +	int len, ret;
> +	u32 val;
> +
> +	pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return -ENOMEM;
> +
> +	motg->pdata =3D pdata;
> +
> +	id =3D of_match_device(msm_otg_dt_match, &pdev->dev);
> +	pdata->phy_type =3D (int) id->data;
> +
> +	pdata->mode =3D of_usb_get_dr_mode(node);
> +	if (pdata->mode =3D=3D USB_DR_MODE_UNKNOWN)
> +		pdata->mode =3D USB_DR_MODE_OTG;
> +
> +	pdata->otg_control =3D OTG_PHY_CONTROL;
> +	if (!of_property_read_u32(node, "qcom,otg-control", &val))
> +		if (val =3D=3D OTG_PMIC_CONTROL)
> +			pdata->otg_control =3D val;
> +
> +	prop =3D of_find_property(node, "qcom,phy-init-sequence", &len);
> +	if (!prop || !len)
> +		return 0;
> +
> +	pdata->phy_init_seq =3D devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> +	if (!pdata->phy_init_seq)
> +		return 0;
return -ENOMEM;
> +
> +	len /=3D sizeof(u32);
> +
> +	if (len >=3D ULPI_EXT_VENDOR_SPECIFIC) {
> +		dev_warn(&pdev->dev, "Too big PHY init sequence %d\n", len);
> +		return 0;
> +	}
> +
> +	ret =3D of_property_read_u32_array(node, "qcom,phy-init-sequence",
> +					 pdata->phy_init_seq, len);
> +	if (!ret)
> +		pdata->phy_init_sz =3D len;

empty line before return would be nice.
> +	return 0;
> +}
> +
>   static int msm_otg_probe(struct platform_device *pdev)
>   {
>   	int ret =3D 0;
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct msm_otg_platform_data *pdata;
>   	struct resource *res;
>   	struct msm_otg *motg;
>   	struct usb_phy *phy;
>
> -	dev_info(&pdev->dev, "msm_otg probe\n");
> -	if (!dev_get_platdata(&pdev->dev)) {
> -		dev_err(&pdev->dev, "No platform data given. Bailing out\n");
> -		return -ENODEV;
> -	}
> -
>   	motg =3D devm_kzalloc(&pdev->dev, sizeof(struct msm_otg), GFP_KERN=
EL);
>   	if (!motg) {
>   		dev_err(&pdev->dev, "unable to allocate msm_otg\n");
>   		return -ENOMEM;
>   	}
>
> +	pdata =3D dev_get_platdata(&pdev->dev);
> +	if (!pdata) {
shouldn=92t this be
if (np) {
> +		ret =3D msm_otg_read_dt(pdev, motg);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	motg->phy.otg =3D devm_kzalloc(&pdev->dev, sizeof(struct usb_otg),
>   				     GFP_KERNEL);
>   	if (!motg->phy.otg) {
> @@ -1369,17 +1434,17 @@ static int msm_otg_probe(struct platform_devi=
ce *pdev)
>   		return -ENOMEM;
>   	}
>
> -	motg->pdata =3D dev_get_platdata(&pdev->dev);
>   	phy =3D &motg->phy;
>   	phy->dev =3D &pdev->dev;
>
> -	motg->phy_reset_clk =3D devm_clk_get(&pdev->dev, "usb_phy_clk");
> +	motg->phy_reset_clk =3D devm_clk_get(&pdev->dev,
> +					   np ? "phy" : "usb_phy_clk");
Not sure why should it be different in dt and non-dt.
>   	if (IS_ERR(motg->phy_reset_clk)) {
>   		dev_err(&pdev->dev, "failed to get usb_phy_clk\n");
>   		return PTR_ERR(motg->phy_reset_clk);
>   	}
>
> -	motg->clk =3D devm_clk_get(&pdev->dev, "usb_hs_clk");
> +	motg->clk =3D devm_clk_get(&pdev->dev, np ? "core" : "usb_hs_clk");

Not sure why should it be different in dt and non-dt.
>   	if (IS_ERR(motg->clk)) {
>   		dev_err(&pdev->dev, "failed to get usb_hs_clk\n");
>   		return PTR_ERR(motg->clk);
> @@ -1391,7 +1456,7 @@ static int msm_otg_probe(struct platform_device=
 *pdev)
>   	 * operation and USB core cannot tolerate frequency changes on
>   	 * CORE CLK.
>   	 */
> -	motg->pclk =3D devm_clk_get(&pdev->dev, "usb_hs_pclk");
> +	motg->pclk =3D devm_clk_get(&pdev->dev, np ? "iface" : "usb_hs_pclk=
");
>   	if (IS_ERR(motg->pclk)) {
>   		dev_err(&pdev->dev, "failed to get usb_hs_pclk\n");
>   		return PTR_ERR(motg->pclk);
> @@ -1402,7 +1467,8 @@ static int msm_otg_probe(struct platform_device=
 *pdev)
>   	 * clock is introduced to remove the dependency on AXI
>   	 * bus frequency.
>   	 */
> -	motg->core_clk =3D devm_clk_get(&pdev->dev, "usb_hs_core_clk");
> +	motg->core_clk =3D devm_clk_get(&pdev->dev,
> +				      np ? "alt_core" : "usb_hs_core_clk");
>
>   	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	motg->regs =3D devm_ioremap(&pdev->dev, res->start, resource_size(=
res));
> @@ -1490,8 +1556,7 @@ static int msm_otg_probe(struct platform_device=
 *pdev)
>   	platform_set_drvdata(pdev, motg);
>   	device_init_wakeup(&pdev->dev, 1);
>
> -	if (motg->pdata->mode =3D=3D USB_DR_MODE_OTG &&
> -			motg->pdata->otg_control =3D=3D OTG_USER_CONTROL) {
> +	if (motg->pdata->mode =3D=3D USB_DR_MODE_OTG) {

How is this change related to DT?
>   		ret =3D msm_otg_debugfs_init(motg);
>   		if (ret)
>   			dev_dbg(&pdev->dev, "Can not create mode change file\n");
> @@ -1637,6 +1702,8 @@ static const struct dev_pm_ops msm_otg_dev_pm_o=
ps =3D {
>   				msm_otg_runtime_idle)
>   };
>
> +MODULE_DEVICE_TABLE(of, msm_otg_dt_match);
> +
>   static struct platform_driver msm_otg_driver =3D {
>   	.probe =3D msm_otg_probe,
>   	.remove =3D msm_otg_remove,
> @@ -1644,6 +1711,7 @@ static struct platform_driver msm_otg_driver =3D=
 {
>   		.name =3D DRIVER_NAME,
>   		.owner =3D THIS_MODULE,

>   		.pm =3D &msm_otg_dev_pm_ops,
> +		.of_match_table =3D msm_otg_dt_match,
>   	},
>   };
>

[snip --
> diff --git a/include/linux/usb/msm_hsusb.h b/include/linux/usb/msm_hs=
usb.h
> index 262ed80..bd68299 100644
> --- a/include/linux/usb/msm_hsusb.h
> +++ b/include/linux/usb/msm_hsusb.h
> @@ -100,8 +100,9 @@ enum usb_chg_type {
>   /**
>    * struct msm_otg_platform_data - platform device data
>    *              for msm_otg driver.
> - * @phy_init_seq: PHY configuration sequence. val, reg pairs
> - *              terminated by -1.
> + * @phy_init_seq: PHY configuration sequence values. Value of -1 is =
reserved as
> + *              "do not overwrite default vaule at this address".
> + * @phy_init_sz: PHY configuration sequence size.
>    * @vbus_power: VBUS power on/off routine.
>    * @power_budget: VBUS power budget in mA (0 will be treated as 500=
mA).
>    * @mode: Supported mode (OTG/peripheral/host).
> @@ -109,6 +110,7 @@ enum usb_chg_type {
>    */
>   struct msm_otg_platform_data {
>   	int *phy_init_seq;
> +	int phy_init_sz;
>   	void (*vbus_power)(bool on);
>   	unsigned power_budget;
>   	enum usb_dr_mode mode;
> --
---]

I think, this changeset should be a new patch.

thanks,
srini
> 1.8.3.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-m=
sm" in
> the body of a message tomajordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info athttp://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
