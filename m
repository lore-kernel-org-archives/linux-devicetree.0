From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v6 11/19] usb: phy: msm: Add device tree support and
 binding information
Date: Wed, 23 Apr 2014 10:48:29 +0300
Message-ID: <1398239309.4724.200.camel@iivanov-dev>
References: <1398158438-21579-1-git-send-email-iivanov@mm-sol.com>
	 <1398158438-21579-12-git-send-email-iivanov@mm-sol.com>
	 <53569352.3050101@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <53569352.3050101@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Felipe Balbi <balbi@ti.com>, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Brown <davidb@codeaurora.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Hi Srini,

On Tue, 2014-04-22 at 17:05 +0100, Srinivas Kandagatla wrote:
> Hi Ivan,
>=20
> On 22/04/14 10:20, Ivan T. Ivanov wrote:
> > From: "Ivan T. Ivanov"<iivanov@mm-sol.com>
> >
> > Allows MSM OTG controller to be specified via device tree.
> >
> > Signed-off-by: Ivan T. Ivanov<iivanov@mm-sol.com>
> > ---
> >   .../devicetree/bindings/usb/msm-hsusb.txt          |  67 ++++++++=
+++++
> >   drivers/usb/phy/phy-msm-usb.c                      | 108 ++++++++=
+++++++++----
> >   include/linux/usb/msm_hsusb.h                      |   6 +-
> >   3 files changed, 159 insertions(+), 22 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/msm-hsusb.txt b/=
Documentation/devicetree/bindings/usb/msm-hsusb.txt

<snip>

> > +Optional properties:
> > +- dr_mode:      One of "host", "peripheral" or "otg". Defaults to =
"otg"
> > +
> > +- qcom,phy-init-sequence: PHY configuration sequence values. This =
is related to Device
> > +                Mode Eye Diagram test. Start address at which thes=
e values will be
> > +                written is ULPI_EXT_VENDOR_SPECIFIC. Value of -1 i=
s reserved as
> > +                "do not overwrite default value at this address".
> > +                For example: qcom,phy-init-sequence =3D < -1 0x63 =
>;
> > +                Will update only value at address ULPI_EXT_VENDOR_=
SPECIFIC + 1.
>=20
> I don=E2=80=99t think DT maintainers will like the sound of it.
> Sorry If I missed some old discussion on this.
> But I don't this this is the correct way.
>=20
> DT should describe the system hardware layout rather than initializat=
ion=20
> sequence.
>=20
> The initialization code with magic values should go directly into the=
=20
> driver and depending on the dt-compatible driver should select the ri=
ght=20
> sequence.

While I agree in general, this sequence is board depended. It is relate=
d
to Eye diagrams tests.

>=20
> /phy-msm-usb.c
> > +++ b/drivers/usb/phy/phy-msm-usb.c
> > @@ -30,9 +30,12 @@
> >   #include <linux/debugfs.h>
> >   #include <linux/seq_file.h>
> >   #include <linux/pm_runtime.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> >
> >   #include <linux/usb.h>
> >   #include <linux/usb/otg.h>
> > +#include <linux/usb/of.h>
> >   #include <linux/usb/ulpi.h>
> >   #include <linux/usb/gadget.h>
> >   #include <linux/usb/hcd.h>
> > @@ -217,16 +220,16 @@ static struct usb_phy_io_ops msm_otg_io_ops =3D=
 {
> >   static void ulpi_init(struct msm_otg *motg)
> >   {
> >   	struct msm_otg_platform_data *pdata =3D motg->pdata;
> > -	int *seq =3D pdata->phy_init_seq;
> > +	int *seq =3D pdata->phy_init_seq, idx;
> > +	u32 addr =3D ULPI_EXT_VENDOR_SPECIFIC;
> >
> > -	if (!seq)
> > -		return;
> > +	for (idx =3D 0; idx < pdata->phy_init_sz; idx++) {
> > +		if (seq[idx] =3D=3D -1)
> > +			continue;
> >
> > -	while (seq[0] >=3D 0) {
> >   		dev_vdbg(motg->phy.dev, "ulpi: write 0x%02x to 0x%02x\n",
> > -				seq[0], seq[1]);
> > -		ulpi_write(&motg->phy, seq[0], seq[1]);
> > -		seq +=3D 2;
> > +				seq[idx], addr + idx);
> > +		ulpi_write(&motg->phy, seq[idx], addr + idx);
> >   	}
> >   }
>=20
> How is above change related to device trees?

It is related to above "qcom,phy-init-sequence" parameter.

> >
> > @@ -1343,25 +1346,87 @@ static void msm_otg_debugfs_cleanup(void)
> >   	debugfs_remove(msm_otg_dbg_root);
> >   }
> >
> > +static struct of_device_id msm_otg_dt_match[] =3D {
> > +	{
> > +		.compatible =3D "qcom,usb-otg-ci",
> > +		.data =3D (void *) CI_45NM_INTEGRATED_PHY
> > +	}, {
> > +		.compatible =3D "qcom,usb-otg-snps",
> > +		.data =3D (void *) SNPS_28NM_INTEGRATED_PHY
> > +	}, {}
> > +};
> > +
> > +static int msm_otg_read_dt(struct platform_device *pdev, struct ms=
m_otg *motg)
> > +{
> > +	struct msm_otg_platform_data *pdata;
> > +	const struct of_device_id *id;
> > +	struct device_node *node =3D pdev->dev.of_node;
> > +	struct property *prop;
> > +	int len, ret;
> > +	u32 val;
> > +
> > +	pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> > +	if (!pdata)
> > +		return -ENOMEM;
> > +
> > +	motg->pdata =3D pdata;
> > +
> > +	id =3D of_match_device(msm_otg_dt_match, &pdev->dev);
> > +	pdata->phy_type =3D (int) id->data;
> > +
> > +	pdata->mode =3D of_usb_get_dr_mode(node);
> > +	if (pdata->mode =3D=3D USB_DR_MODE_UNKNOWN)
> > +		pdata->mode =3D USB_DR_MODE_OTG;
> > +
> > +	pdata->otg_control =3D OTG_PHY_CONTROL;
> > +	if (!of_property_read_u32(node, "qcom,otg-control", &val))
> > +		if (val =3D=3D OTG_PMIC_CONTROL)
> > +			pdata->otg_control =3D val;
> > +
> > +	prop =3D of_find_property(node, "qcom,phy-init-sequence", &len);
> > +	if (!prop || !len)
> > +		return 0;
> > +
> > +	pdata->phy_init_seq =3D devm_kzalloc(&pdev->dev, len, GFP_KERNEL)=
;
> > +	if (!pdata->phy_init_seq)
> > +		return 0;
> return -ENOMEM;

This is optional parameter, but probably I could at least
log the event?!

> > +
> > +	len /=3D sizeof(u32);
> > +
> > +	if (len >=3D ULPI_EXT_VENDOR_SPECIFIC) {
> > +		dev_warn(&pdev->dev, "Too big PHY init sequence %d\n", len);
> > +		return 0;
> > +	}
> > +
> > +	ret =3D of_property_read_u32_array(node, "qcom,phy-init-sequence"=
,
> > +					 pdata->phy_init_seq, len);
> > +	if (!ret)
> > +		pdata->phy_init_sz =3D len;
>=20
> empty line before return would be nice.

Sure.

> > +	return 0;
> > +}
> > +
> >   static int msm_otg_probe(struct platform_device *pdev)
> >   {
> >   	int ret =3D 0;
> > +	struct device_node *np =3D pdev->dev.of_node;
> > +	struct msm_otg_platform_data *pdata;
> >   	struct resource *res;
> >   	struct msm_otg *motg;
> >   	struct usb_phy *phy;
> >
> > -	dev_info(&pdev->dev, "msm_otg probe\n");
> > -	if (!dev_get_platdata(&pdev->dev)) {
> > -		dev_err(&pdev->dev, "No platform data given. Bailing out\n");
> > -		return -ENODEV;
> > -	}
> > -
> >   	motg =3D devm_kzalloc(&pdev->dev, sizeof(struct msm_otg), GFP_KE=
RNEL);
> >   	if (!motg) {
> >   		dev_err(&pdev->dev, "unable to allocate msm_otg\n");
> >   		return -ENOMEM;
> >   	}
> >
> > +	pdata =3D dev_get_platdata(&pdev->dev);
> > +	if (!pdata) {
> shouldn=E2=80=99t this be
> if (np) {

Yep, probably=20

if (!pdata && np) {

> > +		ret =3D msm_otg_read_dt(pdev, motg);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >   	motg->phy.otg =3D devm_kzalloc(&pdev->dev, sizeof(struct usb_otg=
),
> >   				     GFP_KERNEL);
> >   	if (!motg->phy.otg) {
> > @@ -1369,17 +1434,17 @@ static int msm_otg_probe(struct platform_de=
vice *pdev)
> >   		return -ENOMEM;
> >   	}
> >
> > -	motg->pdata =3D dev_get_platdata(&pdev->dev);
> >   	phy =3D &motg->phy;
> >   	phy->dev =3D &pdev->dev;
> >
> > -	motg->phy_reset_clk =3D devm_clk_get(&pdev->dev, "usb_phy_clk");
> > +	motg->phy_reset_clk =3D devm_clk_get(&pdev->dev,
> > +					   np ? "phy" : "usb_phy_clk");
> Not sure why should it be different in dt and non-dt.

Why not? "usb" and "clk" are too much for a USB clock name in
context of this driver.

> >   	if (IS_ERR(motg->phy_reset_clk)) {
> >   		dev_err(&pdev->dev, "failed to get usb_phy_clk\n");
> >   		return PTR_ERR(motg->phy_reset_clk);
> >   	}
> >
> > -	motg->clk =3D devm_clk_get(&pdev->dev, "usb_hs_clk");
> > +	motg->clk =3D devm_clk_get(&pdev->dev, np ? "core" : "usb_hs_clk"=
);
>=20
> Not sure why should it be different in dt and non-dt.

"hs" doesn't make any sense This clock is a core clock
for LINK controller.


> >   	if (IS_ERR(motg->clk)) {
> >   		dev_err(&pdev->dev, "failed to get usb_hs_clk\n");
> >   		return PTR_ERR(motg->clk);
> > @@ -1391,7 +1456,7 @@ static int msm_otg_probe(struct platform_devi=
ce *pdev)
> >   	 * operation and USB core cannot tolerate frequency changes on
> >   	 * CORE CLK.
> >   	 */
> > -	motg->pclk =3D devm_clk_get(&pdev->dev, "usb_hs_pclk");
> > +	motg->pclk =3D devm_clk_get(&pdev->dev, np ? "iface" : "usb_hs_pc=
lk");
> >   	if (IS_ERR(motg->pclk)) {
> >   		dev_err(&pdev->dev, "failed to get usb_hs_pclk\n");
> >   		return PTR_ERR(motg->pclk);
> > @@ -1402,7 +1467,8 @@ static int msm_otg_probe(struct platform_devi=
ce *pdev)
> >   	 * clock is introduced to remove the dependency on AXI
> >   	 * bus frequency.
> >   	 */
> > -	motg->core_clk =3D devm_clk_get(&pdev->dev, "usb_hs_core_clk");
> > +	motg->core_clk =3D devm_clk_get(&pdev->dev,
> > +				      np ? "alt_core" : "usb_hs_core_clk");
> >
> >   	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >   	motg->regs =3D devm_ioremap(&pdev->dev, res->start, resource_siz=
e(res));
> > @@ -1490,8 +1556,7 @@ static int msm_otg_probe(struct platform_devi=
ce *pdev)
> >   	platform_set_drvdata(pdev, motg);
> >   	device_init_wakeup(&pdev->dev, 1);
> >
> > -	if (motg->pdata->mode =3D=3D USB_DR_MODE_OTG &&
> > -			motg->pdata->otg_control =3D=3D OTG_USER_CONTROL) {
> > +	if (motg->pdata->mode =3D=3D USB_DR_MODE_OTG) {
>=20
> How is this change related to DT?

Yep, it is not really related, will revert.

> >   		ret =3D msm_otg_debugfs_init(motg);
> >   		if (ret)
> >   			dev_dbg(&pdev->dev, "Can not create mode change file\n");
> > @@ -1637,6 +1702,8 @@ static const struct dev_pm_ops msm_otg_dev_pm=
_ops =3D {
> >   				msm_otg_runtime_idle)
> >   };
> >
> > +MODULE_DEVICE_TABLE(of, msm_otg_dt_match);
> > +
> >   static struct platform_driver msm_otg_driver =3D {
> >   	.probe =3D msm_otg_probe,
> >   	.remove =3D msm_otg_remove,
> > @@ -1644,6 +1711,7 @@ static struct platform_driver msm_otg_driver =
=3D {
> >   		.name =3D DRIVER_NAME,
> >   		.owner =3D THIS_MODULE,
>=20
> >   		.pm =3D &msm_otg_dev_pm_ops,
> > +		.of_match_table =3D msm_otg_dt_match,
> >   	},
> >   };
> >
>=20
> [snip --
> > diff --git a/include/linux/usb/msm_hsusb.h b/include/linux/usb/msm_=
hsusb.h
> > index 262ed80..bd68299 100644
> > --- a/include/linux/usb/msm_hsusb.h
> > +++ b/include/linux/usb/msm_hsusb.h
> > @@ -100,8 +100,9 @@ enum usb_chg_type {
> >   /**
> >    * struct msm_otg_platform_data - platform device data
> >    *              for msm_otg driver.
> > - * @phy_init_seq: PHY configuration sequence. val, reg pairs
> > - *              terminated by -1.
> > + * @phy_init_seq: PHY configuration sequence values. Value of -1 i=
s reserved as
> > + *              "do not overwrite default vaule at this address".
> > + * @phy_init_sz: PHY configuration sequence size.
> >    * @vbus_power: VBUS power on/off routine.
> >    * @power_budget: VBUS power budget in mA (0 will be treated as 5=
00mA).
> >    * @mode: Supported mode (OTG/peripheral/host).
> > @@ -109,6 +110,7 @@ enum usb_chg_type {
> >    */
> >   struct msm_otg_platform_data {
> >   	int *phy_init_seq;
> > +	int phy_init_sz;
> >   	void (*vbus_power)(bool on);
> >   	unsigned power_budget;
> >   	enum usb_dr_mode mode;
> > --
> ---]
>=20
> I think, this changeset should be a new patch.

It is part of "qcom,phy-init-sequence" DT property.

Regards,
Ivan

>=20
> thanks,
> srini
> > 1.8.3.2
