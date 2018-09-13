From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v3 3/3] drivers: soc: xilinx: Add ZynqMP PM driver
Date: Thu, 13 Sep 2018 17:11:19 +0000
Message-ID: <CY1PR02MB2138E4213DF88A2CEDAFED2CB81A0@CY1PR02MB2138.namprd02.prod.outlook.com>
References: <1536701697-23949-4-git-send-email-jollys@xilinx.com>
 <20180912011003.GA14928@darwi-kernel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180912011003.GA14928@darwi-kernel>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Ahmed S. Darwish" <darwish.07@gmail.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, Michal Simek <michals@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Rajan Vaja <RAJANV@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>Rajan Vaja <RAJANV@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Ahmed,

Thanks for the review. I will take care of suggested changes in next versio=
n.

Thanks,
Jolly Shah


> -----Original Message-----
> From: Ahmed S. Darwish [mailto:darwish.07@gmail.com]
> Sent: Tuesday, September 11, 2018 6:10 PM
> To: Jolly Shah <JOLLYS@xilinx.com>
> Cc: matthias.bgg@gmail.com; andy.gross@linaro.org; shawnguo@kernel.org;
> geert+renesas@glider.be; bjorn.andersson@linaro.org;
> sean.wang@mediatek.com; m.szyprowski@samsung.com; Michal Simek
> <michals@xilinx.com>; robh+dt@kernel.org; mark.rutland@arm.com; Rajan
> Vaja <RAJANV@xilinx.com>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Rajan Vaja
> <RAJANV@xilinx.com>; Jolly Shah <JOLLYS@xilinx.com>
> Subject: Re: [PATCH v3 3/3] drivers: soc: xilinx: Add ZynqMP PM driver
>=20
> Hi!
>=20
> [ Thanks a lot for upstreaming this.. ]
>=20
> On Tue, Sep 11, 2018 at 02:34:57PM -0700, Jolly Shah wrote:
> > From: Rajan Vaja <rajan.vaja@xilinx.com>
> >
> > Add ZynqMP PM driver. PM driver provides power management support for
> > ZynqMP.
> >
> > Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> > Signed-off-by: Jolly Shah <jollys@xilinx.com>
> > ---
>=20
> [...]
>=20
> > +static irqreturn_t zynqmp_pm_isr(int irq, void *data) {
> > +	u32 payload[CB_PAYLOAD_SIZE];
> > +
> > +	zynqmp_pm_get_callback_data(payload);
> > +
> > +	/* First element is callback API ID, others are callback arguments */
> > +	if (payload[0] =3D=3D PM_INIT_SUSPEND_CB) {
> > +		if (work_pending(&zynqmp_pm_init_suspend_work-
> >callback_work))
> > +			goto done;
> > +
> > +		/* Copy callback arguments into work's structure */
> > +		memcpy(zynqmp_pm_init_suspend_work->args, &payload[1],
> > +		       sizeof(zynqmp_pm_init_suspend_work->args));
> > +
> > +		queue_work(system_unbound_wq,
> > +			   &zynqmp_pm_init_suspend_work->callback_work);
>=20
> We already have devm_request_threaded_irq() which can does this
> automatically for us.
>=20
> Use that method to register the ISR instead, then if there's more work to=
 do, just
> do the memcpy and return IRQ_WAKE_THREAD.
>=20
> > +	}
> > +
> > +done:
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +/**
> > + * zynqmp_pm_init_suspend_work_fn() - Initialize suspend
> > + * @work:	Pointer to work_struct
> > + *
> > + * Bottom-half of PM callback IRQ handler.
> > + */
> > +static void zynqmp_pm_init_suspend_work_fn(struct work_struct *work)
> > +{
> > +	struct zynqmp_pm_work_struct *pm_work =3D
> > +		container_of(work, struct zynqmp_pm_work_struct,
> callback_work);
> > +
> > +	if (pm_work->args[0] =3D=3D
> ZYNQMP_PM_SUSPEND_REASON_SYSTEM_SHUTDOWN) {
>=20
> we_really_seem_to_love_long_40_col_names_for_some_reason
>=20
> > +		orderly_poweroff(true);
> > +	} else if (pm_work->args[0] =3D=3D
> > +		   ZYNQMP_PM_SUSPEND_REASON_POWER_UNIT_REQUEST) {
>=20
> Ditto
>=20
> [...]
>=20
> > +/**
> > + * zynqmp_pm_sysfs_init() - Initialize PM driver sysfs interface
> > + * @dev:	Pointer to device structure
> > + *
> > + * Return: 0 on success, negative error code otherwise  */ static int
> > +zynqmp_pm_sysfs_init(struct device *dev) {
> > +	return sysfs_create_file(&dev->kobj, &dev_attr_suspend_mode.attr); }
> > +
>=20
> Sysfs file is created in platform driver's probe(), but is not removed an=
ywhere in
> the code.
>=20
> What happens if this is built as a module? Am I missing something obvious=
?
>=20
> Moreover, what's the wisdom of creating a one-liner function with a huge =
six-
> line comment that:
>=20
>     a) _purely_ wraps sysfs_create_file(); no extra logic
>     b) is called only once
>     c) and not passed as a function pointer anywhere
>=20
> IMO Such one-liner translators obfuscate the code and review process with=
 no
> apparent gain..
>=20
> > +/**
> > + * zynqmp_pm_probe() - Probe existence of the PMU Firmware
> > + *		       and initialize debugfs interface
> > + *
> > + * @pdev:	Pointer to the platform_device structure
> > + *
> > + * Return: Returns 0 on success, negative error code otherwise  */
>=20
> Again, huge 8-line comment that provide no value.
>=20
> If anyone wants to know what a platform driver probe() does, he or she be=
tter
> check the primary references at:
>=20
>     - Documentation/driver-model/platform.txt
>     - include/linux/platform_device.h
>=20
> and not the comment above..
>=20
> > +static int zynqmp_pm_probe(struct platform_device *pdev) {
> > +	int ret, irq;
> > +	u32 pm_api_version;
> > +
> > +	const struct zynqmp_eemi_ops *eemi_ops =3D
> zynqmp_pm_get_eemi_ops();
> > +
> > +	if (!eemi_ops || !eemi_ops->get_api_version || !eemi_ops-
> >init_finalize)
> > +		return -ENXIO;
> > +
> > +	eemi_ops->init_finalize();
> > +	eemi_ops->get_api_version(&pm_api_version);
> > +
> > +	/* Check PM API version number */
> > +	if (pm_api_version < ZYNQMP_PM_VERSION)
> > +		return -ENODEV;
> > +
> > +	irq =3D platform_get_irq(pdev, 0);
> > +	if (irq <=3D 0)
> > +		return -ENXIO;
> > +
> > +	ret =3D devm_request_irq(&pdev->dev, irq, zynqmp_pm_isr,
> IRQF_SHARED,
> > +			       dev_name(&pdev->dev), pdev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "request_irq '%d' failed with %d\n",
> > +			irq, ret);
> > +		return ret;
> > +	}
> > +
> > +	zynqmp_pm_init_suspend_work =3D
> > +		devm_kzalloc(&pdev->dev, sizeof(struct
> zynqmp_pm_work_struct),
> > +			     GFP_KERNEL);
> > +	if (!zynqmp_pm_init_suspend_work)
> > +		return -ENOMEM;
> > +
> > +	INIT_WORK(&zynqmp_pm_init_suspend_work->callback_work,
> > +		  zynqmp_pm_init_suspend_work_fn);
> > +
>=20
> Let's use devm_request_threaded_irq(). Then we can completely remove the
> work_struct, INIT_WORK(), and queuue_work() bits.
>=20
> > +	ret =3D zynqmp_pm_sysfs_init(&pdev->dev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "unable to initialize sysfs interface\n");
> > +		return ret;
> > +	}
> > +
> > +	return ret;
>=20
> Just return 0 please. BTW ret was declared without initialization.
>=20
> > +}
> > +
> > +static const struct of_device_id pm_of_match[] =3D {
> > +	{ .compatible =3D "xlnx,zynqmp-power", },
> > +	{ /* end of table */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, pm_of_match);
> > +
> > +static struct platform_driver zynqmp_pm_platform_driver =3D {
> > +	.probe =3D zynqmp_pm_probe,
> > +	.driver =3D {
> > +		.name =3D "zynqmp_power",
> > +		.of_match_table =3D pm_of_match,
> > +	},
> > +};
>=20
> .remove with a basic sysfs_remove_file() is needed.
>=20
> Thanks,
>=20
> --
> Darwi
> http://darwish.chasingpointers.com
