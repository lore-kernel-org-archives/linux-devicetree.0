Return-Path: <SRS0=Zo2N=QA=nvidia.com=jonathanh@kernel.org>
Subject: Re: [PATCH V2 3/4] firmware: tegra: add bpmp driver for Tegra210
References: <1548073731-6449-1-git-send-email-talho@nvidia.com>
 <1548073731-6449-4-git-send-email-talho@nvidia.com>
 <09cb4df2-cd5d-9d74-c209-2ccec6cec2c8@nvidia.com>
 <ab9d0f38-a717-016f-6e80-2f18cbdfbee8@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <abdd2153-e8eb-7caf-2483-aeb43ed4c55d@nvidia.com>
Date: Thu, 24 Jan 2019 13:57:41 +0000
MIME-Version: 1.0
In-Reply-To: <ab9d0f38-a717-016f-6e80-2f18cbdfbee8@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Timo Alho <talho@nvidia.com>, treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On 24/01/2019 13:41, Timo Alho wrote:
> Hi Jon,
>=20
> Thanks for reviewing :)
>=20
> On 24.1.2019 14.16, Jon Hunter wrote:
>=20
> ...
>=20
>>> +static int tegra210_bpmp_ring_doorbell(struct tegra_bpmp *bpmp)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct tegra210_bpmp *priv =3D bpmp->priv;
>>> +=C2=A0=C2=A0=C2=A0 struct irq_data *irq_data;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Tegra Legacy Interrupt Controller (LIC) is used =
to notify
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * BPMP of available messages
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 irq_data =3D irq_get_irq_data(priv->txirq);
>>> +=C2=A0=C2=A0=C2=A0 if (!irq_data)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>
>> Why not check this in probe?
>>
>=20
> Indeed I can move irq_get_irq_data() to probe and store the return value
> directly to priv->txirq instead. I'll just do that then.
>=20
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return irq_data->chip->irq_retrigger(irq_data);
>>
>> We should check that the irq_retrigger is populated as well.
>=20
> I'll add a check.
>=20
>> In general, I am not sure if there is a better way to do this, but I
>> don't see an alternative.
>>
>=20
> I'd be also happy to hear if someone has good alternative.
>=20
> ...
>=20
>>> +static int tegra210_bpmp_init(struct tegra_bpmp *bpmp)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct platform_device *pdev =3D to_platform_device=
(bpmp->dev);
>>> +=C2=A0=C2=A0=C2=A0 struct tegra210_bpmp *priv;
>>> +=C2=A0=C2=A0=C2=A0 struct resource *res;
>>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>>> +=C2=A0=C2=A0=C2=A0 int err;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GF=
P_KERNEL);
>>> +=C2=A0=C2=A0=C2=A0 if (!priv)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 bpmp->priv =3D priv;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM,=
 0);
>>> +=C2=A0=C2=A0=C2=A0 priv->atomics =3D devm_ioremap_resource(&pdev->dev,=
 res);
>>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(priv->atomics))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(priv->atomic=
s);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM,=
 1);
>>> +=C2=A0=C2=A0=C2=A0 priv->arb_sema =3D devm_ioremap_resource(&pdev->dev=
, res);
>>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(priv->arb_sema))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(priv->arb_se=
ma);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 err =3D tegra210_bpmp_channel_init(bpmp->tx_channel=
, bpmp,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpmp->soc->channels.cpu=
_tx.offset);
>>> +=C2=A0=C2=A0=C2=A0 if (err < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 err =3D tegra210_bpmp_channel_init(bpmp->rx_channel=
, bpmp,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpmp->soc->channels.cpu=
_rx.offset);
>>> +=C2=A0=C2=A0=C2=A0 if (err < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>>
>> Don't we need to unmap any iomem on error that we mapped in
>> tegra210_bpmp_channel_init()?
>=20
> Good point. I'll just replace ioremap() with devm_ioremap(). I think
> that should do it.
>=20
> ...
>=20
>>> diff --git a/drivers/firmware/tegra/bpmp.c
>>> b/drivers/firmware/tegra/bpmp.c
>>> index c6716ec..22c91ab 100644
>>> --- a/drivers/firmware/tegra/bpmp.c
>>> +++ b/drivers/firmware/tegra/bpmp.c
>>> @@ -765,17 +765,23 @@ static int tegra_bpmp_probe(struct
>>> platform_device *pdev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err < 0)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto free_mrq;
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 err =3D tegra_bpmp_init_clocks(bpmp);
>>> -=C2=A0=C2=A0=C2=A0 if (err < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto free_mrq;
>>> +=C2=A0=C2=A0=C2=A0 if (of_find_property(pdev->dev.of_node, "#clock-cel=
ls", NULL)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D tegra_bpmp_init_clo=
cks(bpmp);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o free_mrq;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 err =3D tegra_bpmp_init_resets(bpmp);
>>> -=C2=A0=C2=A0=C2=A0 if (err < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto free_mrq;
>>> +=C2=A0=C2=A0=C2=A0 if (of_find_property(pdev->dev.of_node, "#reset-cel=
ls", NULL)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D tegra_bpmp_init_res=
ets(bpmp);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o free_mrq;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 err =3D tegra_bpmp_init_powergates(bpmp);
>>> -=C2=A0=C2=A0=C2=A0 if (err < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto free_mrq;
>>> +=C2=A0=C2=A0=C2=A0 if (of_find_property(pdev->dev.of_node, "#power-dom=
ain-cells",
>>> NULL)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D tegra_bpmp_init_pow=
ergates(bpmp);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o free_mrq;
>>> +=C2=A0=C2=A0=C2=A0 }
>>
>> Should we use soc_data for these rather than relying on the nodes to be
>> populated correctly in DT?
>=20
> There are some t210 systems where BPMP functions as clocks provider (for
> EMC), and some where it does not. So controlling this via device tree
> can be handier.

Is it the same T210 device or could the compatibility string be used
here for this?

Cheers
Jon

--=20
nvpublic
