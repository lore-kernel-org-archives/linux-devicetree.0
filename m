From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 06/10] soc: Add SoC specific driver support for nuc900
Date: Mon, 11 Jul 2016 12:24:21 +0200
Message-ID: <1606219.BzcByuFgJm@wuerfel>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <4765191.NGpMC1JR46@wuerfel> <578361B5.7010803@iommu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <578361B5.7010803@iommu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Wan Zongshun <vw@iommu.org>
Cc: linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, jason@lakedaemon.net, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>, Wan Zongshun <mcuos.com@gmail.com>
List-Id: devicetree@vger.kernel.org

On Monday, July 11, 2016 5:07:01 PM CEST Wan Zongshun wrote:
>=20
> On 2016=E5=B9=B407=E6=9C=8811=E6=97=A5 16:03, Arnd Bergmann wrote:
> > On Sunday, July 10, 2016 3:27:26 PM CEST Wan Zongshun wrote:
> >> +       ret =3D of_property_read_string(np, "compatible", &soc_dev=
_attr->soc_id);
> >> +       if (ret)
> >>                return -EINVAL;
> >> +
> >> +       soc_dev_attr->machine =3D "NUC900EVB";
> >> +       soc_dev_attr->family =3D "NUC900";
> >> +       soc_dev =3D soc_device_register(soc_dev_attr);
> >> +       if (IS_ERR(soc_dev)) {
> >> +               kfree(soc_dev_attr);
> >> +               return -ENODEV;
> >> +       }
> >> +
> >> +       ret =3D regmap_read(syscon_regmap, GCR_CHIPID, &nuc900_chi=
pid);
> >> +       if (ret)
> >> +               return -ENODEV;
> >> +
> >> +       device_create_file(soc_device_to_device(soc_dev), &nuc900_=
chipid_attr);
> >> +       device_create_file(soc_device_to_device(soc_dev), &nuc900_=
version_attr);
> >> +
> >> +       dev_info(&pdev->dev, "Nuvoton Chip ID: 0x%x, Version ID:0x=
%x\n",
> >> +                nuc900_chipid & GCR_CHIPID_MASK,
> >> +                (nuc900_chipid >> 24) & 0xff);
> >
> > I'm still a bit unsure about the set of attributes here.
> >
> > - The "soc_id" is read from the device tree from the field that con=
tains
> >    the board name, I think for consistency you should try to map th=
e
> >    GCR_CHIPID to the name of the SoC and assign that here
>=20
> I will try to get chipid and map it to soc name like: =E2=80=9Cnuc970=
=E2=80=9D, "nuc910".
>=20
> And I will set this soc name to soc_id, ok?

Ok.

> > - The "machine" is hardcoded to "NUC900EVB", which in turn looks li=
ke
> >    a particular board but not the one you are running on. Maybe rea=
d
> >    that from the DT instead?
>=20
> Should I read nuc970-evb.dts's "model" or "compatible" properties?

I think "model" is best here, but see what the others do.

	Arnd
