Return-Path: <SRS0=+VAQ=M4=nxp.com=peter.chen@kernel.org>
From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH 2/4] usb: chipidea: imx: add HSIC support
Date: Tue, 16 Oct 2018 06:07:40 +0000
Message-ID: 
 <VI1PR04MB5327B589773C8E0A1A232AD48BFE0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20181016045846.2345-3-peter.chen@nxp.com>
 <201810161316.INkZNcrC%fengguang.wu@intel.com>
In-Reply-To: <201810161316.INkZNcrC%fengguang.wu@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: kbuild test robot <lkp@intel.com>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

=20
> Hi Peter,
>=20
> I love your patch! Yet something to improve:
>=20
> [auto build test ERROR on peter.chen-usb/ci-for-usb-next] [also build tes=
t ERROR
> on v4.19-rc8 next-20181012] [if your patch is applied to the wrong git tr=
ee, please
> drop us a note to help improve the system]
>=20
> url:
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com
> %2F0day-ci%2Flinux%2Fcommits%2FPeter-Chen%2Fusb-chipidea-imx-add-HSIC-
> support%2F20181016-
> 130840&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com%7C50f2cf2d6d5341bf72
> cc08d6332ba794%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63675
> 2662551616821&amp;sdata=3DclbCGj%2BrgTz56IKDM0DVVyL3e4q79FsCv3vn%2F7
> TSrQI%3D&amp;reserved=3D0
> base:
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.=
kernel.o
> rg%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpeter.chen%2Fusb.git&amp;data
> =3D02%7C01%7Cpeter.chen%40nxp.com%7C50f2cf2d6d5341bf72cc08d6332ba794
> %7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636752662551616821
> &amp;sdata=3D6Bp7JvbXAsJ%2FGZCOn0VmtZQSnWUCYhgqlbG8ZrbzBoE%3D&a
> mp;reserved=3D0 ci-for-usb-next
> config: x86_64-randconfig-x017-201841 (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64
>=20

Will fix it by adding #include <linux/pinctrl/consumer.h>, it is strange I =
did not meet this error.

Peter

> All errors (new ones prefixed by >>):
>=20
>    drivers/usb/chipidea/ci_hdrc_imx.c: In function 'ci_hdrc_imx_notify_ev=
ent':
> >> drivers/usb/chipidea/ci_hdrc_imx.c:261:10: error: implicit
> >> declaration of function 'pinctrl_select_state'; did you mean
> >> 'inc_node_state'? [-Werror=3Dimplicit-function-declaration]
>        ret =3D pinctrl_select_state(data->pinctrl,
>              ^~~~~~~~~~~~~~~~~~~~
>              inc_node_state
>    drivers/usb/chipidea/ci_hdrc_imx.c: In function 'ci_hdrc_imx_probe':
>    drivers/usb/chipidea/ci_hdrc_imx.c:317:18: error: implicit declaration=
 of function
> 'devm_pinctrl_get'; did you mean 'devm_clk_get'? [-Werror=3Dimplicit-func=
tion-
> declaration]
>      data->pinctrl =3D devm_pinctrl_get(dev);
>                      ^~~~~~~~~~~~~~~~
>                      devm_clk_get
>    drivers/usb/chipidea/ci_hdrc_imx.c:317:16: warning: assignment makes p=
ointer
> from integer without a cast [-Wint-conversion]
>      data->pinctrl =3D devm_pinctrl_get(dev);
>                    ^
> >> drivers/usb/chipidea/ci_hdrc_imx.c:322:23: error: implicit
> >> declaration of function 'pinctrl_lookup_state'; did you mean
> >> 'inc_node_state'? [-Werror=3Dimplicit-function-declaration]
>       pinctrl_hsic_idle =3D pinctrl_lookup_state(data->pinctrl, "idle");
>                           ^~~~~~~~~~~~~~~~~~~~
>                           inc_node_state
>    drivers/usb/chipidea/ci_hdrc_imx.c:322:21: warning: assignment makes p=
ointer
> from integer without a cast [-Wint-conversion]
>       pinctrl_hsic_idle =3D pinctrl_lookup_state(data->pinctrl, "idle");
>                         ^
>    drivers/usb/chipidea/ci_hdrc_imx.c:338:29: warning: assignment makes p=
ointer
> from integer without a cast [-Wint-conversion]
>       data->pinctrl_hsic_active =3D pinctrl_lookup_state(data->pinctrl,
>                                 ^
>    cc1: some warnings being treated as errors
>=20
> vim +261 drivers/usb/chipidea/ci_hdrc_imx.c
>=20
>    250
>    251	static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned i=
nt event)
>    252	{
>    253		struct device *dev =3D ci->dev->parent;
>    254		struct ci_hdrc_imx_data *data =3D dev_get_drvdata(dev);
>    255		int ret =3D 0;
>    256
>    257		switch (event) {
>    258		case CI_HDRC_IMX_HSIC_ACTIVE_EVENT:
>    259			if (!IS_ERR(data->pinctrl) &&
>    260				!IS_ERR(data->pinctrl_hsic_active)) {
>  > 261				ret =3D pinctrl_select_state(data->pinctrl,
>    262						data->pinctrl_hsic_active);
>    263				if (ret)
>    264					dev_err(dev,
>    265						"hsic_active select failed, err=3D%d\n",
>    266						ret);
>    267				return ret;
>    268			}
>    269			break;
>    270		case CI_HDRC_IMX_HSIC_SUSPEND_EVENT:
>    271			if (data->usbmisc_data) {
>    272				ret =3D imx_usbmisc_hsic_set_connect(data-
> >usbmisc_data);
>    273				if (ret)
>    274					dev_err(dev,
>    275						"hsic_set_connect failed, err=3D%d\n",
>    276						ret);
>    277				return ret;
>    278			}
>    279			break;
>    280		default:
>    281			break;
>    282		}
>    283
>    284		return ret;
>    285	}
>    286
>    287	static int ci_hdrc_imx_probe(struct platform_device *pdev)
>    288	{
>    289		struct ci_hdrc_imx_data *data;
>    290		struct ci_hdrc_platform_data pdata =3D {
>    291			.name		=3D dev_name(&pdev->dev),
>    292			.capoffset	=3D DEF_CAPOFFSET,
>    293			.notify_event	=3D ci_hdrc_imx_notify_event,
>    294		};
>    295		int ret;
>    296		const struct of_device_id *of_id;
>    297		const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
>    298		struct device_node *np =3D pdev->dev.of_node;
>    299		struct device *dev =3D &pdev->dev;
>    300		struct pinctrl_state *pinctrl_hsic_idle;
>    301
>    302		of_id =3D of_match_device(ci_hdrc_imx_dt_ids, dev);
>    303		if (!of_id)
>    304			return -ENODEV;
>    305
>    306		imx_platform_flag =3D of_id->data;
>    307
>    308		data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>    309		if (!data)
>    310			return -ENOMEM;
>    311
>    312		platform_set_drvdata(pdev, data);
>    313		data->usbmisc_data =3D usbmisc_get_init_data(dev);
>    314		if (IS_ERR(data->usbmisc_data))
>    315			return PTR_ERR(data->usbmisc_data);
>    316
>  > 317		data->pinctrl =3D devm_pinctrl_get(dev);
>    318		if (IS_ERR(data->pinctrl)) {
>    319			dev_dbg(dev, "pinctrl get failed, err=3D%ld\n",
>    320							PTR_ERR(data->pinctrl));
>    321		} else {
>  > 322			pinctrl_hsic_idle =3D pinctrl_lookup_state(data->pinctrl, "idle"=
);
>    323			if (IS_ERR(pinctrl_hsic_idle)) {
>    324				dev_dbg(dev,
>    325					"pinctrl_hsic_idle lookup failed, err=3D%ld\n",
>    326							PTR_ERR(pinctrl_hsic_idle));
>    327			} else {
>    328				ret =3D pinctrl_select_state(data->pinctrl,
>    329							pinctrl_hsic_idle);
>    330				if (ret) {
>    331					dev_err(dev,
>    332						"hsic_idle select failed, err=3D%d\n",
>    333										ret);
>    334					return ret;
>    335				}
>    336			}
>    337
>    338			data->pinctrl_hsic_active =3D pinctrl_lookup_state(data->pinctrl=
,
>    339									"active");
>    340			if (IS_ERR(data->pinctrl_hsic_active))
>    341				dev_dbg(dev,
>    342					"pinctrl_hsic_active lookup failed, err=3D%ld\n",
>    343						PTR_ERR(data->pinctrl_hsic_active));
>    344		}
>    345
>    346		ret =3D imx_get_clks(dev);
>    347		if (ret)
>    348			return ret;
>    349
>    350		ret =3D imx_prepare_enable_clks(dev);
>    351		if (ret)
>    352			return ret;
>    353
>    354		data->phy =3D devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
>    355		if (IS_ERR(data->phy)) {
>    356			ret =3D PTR_ERR(data->phy);
>    357			/* Return -EINVAL if no usbphy is available */
>    358			if (ret =3D=3D -ENODEV)
>    359				ret =3D -EINVAL;
>    360			goto err_clk;
>    361		}
>    362
>    363		pdata.usb_phy =3D data->phy;
>    364
>    365		if ((of_device_is_compatible(np, "fsl,imx53-usb") ||
>    366		     of_device_is_compatible(np, "fsl,imx51-usb")) && pdata.usb_p=
hy
> &&
>    367		    of_usb_get_phy_mode(np) =3D=3D
> USBPHY_INTERFACE_MODE_ULPI) {
>    368			pdata.flags |=3D CI_HDRC_OVERRIDE_PHY_CONTROL;
>    369			data->override_phy_control =3D true;
>    370			usb_phy_init(pdata.usb_phy);
>    371		}
>    372
>    373		pdata.flags |=3D imx_platform_flag->flags;
>    374		if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
>    375			data->supports_runtime_pm =3D true;
>    376
>    377		if (of_usb_get_phy_mode(dev->of_node) =3D=3D
> USBPHY_INTERFACE_MODE_HSIC) {
>    378			pdata.flags |=3D CI_HDRC_IMX_IS_HSIC;
>    379			data->usbmisc_data->hsic =3D 1;
>    380			data->hsic_pad_regulator =3D devm_regulator_get(dev, "hsic");
>    381			if (PTR_ERR(data->hsic_pad_regulator) =3D=3D -
> EPROBE_DEFER) {
>    382				ret =3D -EPROBE_DEFER;
>    383				goto err_clk;
>    384			} else if (PTR_ERR(data->hsic_pad_regulator) =3D=3D -ENODEV)
> {
>    385				/* no pad regualator is needed */
>    386				data->hsic_pad_regulator =3D NULL;
>    387			} else if (IS_ERR(data->hsic_pad_regulator)) {
>    388				dev_err(dev, "Get hsic pad regulator error: %ld\n",
>    389						PTR_ERR(data->hsic_pad_regulator));
>    390				ret =3D PTR_ERR(data->hsic_pad_regulator);
>    391				goto err_clk;
>    392			}
>    393
>    394			if (data->hsic_pad_regulator) {
>    395				ret =3D regulator_enable(data->hsic_pad_regulator);
>    396				if (ret) {
>    397					dev_err(dev,
>    398						"Fail to enable hsic pad regulator\n");
>    399					goto err_clk;
>    400				}
>    401			}
>    402		}
>    403
>    404		ret =3D imx_usbmisc_init(data->usbmisc_data);
>    405		if (ret) {
>    406			dev_err(dev, "usbmisc init failed, ret=3D%d\n", ret);
>    407			goto disable_hsic_regulator;
>    408		}
>    409
>    410		data->ci_pdev =3D ci_hdrc_add_device(dev,
>    411					pdev->resource, pdev->num_resources,
>    412					&pdata);
>    413		if (IS_ERR(data->ci_pdev)) {
>    414			ret =3D PTR_ERR(data->ci_pdev);
>    415			if (ret !=3D -EPROBE_DEFER)
>    416				dev_err(dev, "ci_hdrc_add_device failed, err=3D%d\n",
>    417						ret);
>    418			goto disable_hsic_regulator;
>    419		}
>    420
>    421		ret =3D imx_usbmisc_init_post(data->usbmisc_data);
>    422		if (ret) {
>    423			dev_err(dev, "usbmisc post failed, ret=3D%d\n", ret);
>    424			goto disable_device;
>    425		}
>    426
>    427		if (data->supports_runtime_pm) {
>    428			pm_runtime_set_active(dev);
>    429			pm_runtime_enable(dev);
>    430		}
>    431
>    432		device_set_wakeup_capable(dev, true);
>    433
>    434		return 0;
>    435
>    436	disable_device:
>    437		ci_hdrc_remove_device(data->ci_pdev);
>    438	disable_hsic_regulator:
>    439		if (data->hsic_pad_regulator)
>    440			ret =3D regulator_disable(data->hsic_pad_regulator);
>    441	err_clk:
>    442		imx_disable_unprepare_clks(dev);
>    443		return ret;
>    444	}
>    445
>=20
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist=
s.01.org
> %2Fpipermail%2Fkbuild-
> all&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com%7C50f2cf2d6d5341bf72cc08
> d6332ba794%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636752662
> 551616821&amp;sdata=3DFeXt%2BW7Jnl%2B%2BihbZjlVj5vZddN2C%2Fuf63PeBJv
> MQ6TA%3D&amp;reserved=3D0                   Intel Corporation
