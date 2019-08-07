From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [Sound-open-firmware] [PATCH v2 3/5] ASoC: SOF: Add DT DSP device support
Date: Wed, 7 Aug 2019 18:28:25 +0300
Message-ID: <CAEnQRZCE3mxorYpL_nPXiU4MezGDaqUfuFDx8ci0WdXzDa68JA@mail.gmail.com>
References: <20190723084104.12639-1-daniel.baluta@nxp.com> <20190723084104.12639-4-daniel.baluta@nxp.com>
 <d85909d6-c7cb-c64b-dfa9-6cee6c0da2cb@linux.intel.com> <CAEnQRZDr+gj_eiESLNbVUVy1rreRE1nnDgtb3g=CjaRF5Aq9Vw@mail.gmail.com>
 <CAEnQRZDctjdzQ2RjJXhQh+s=d0y_j3Taa51hDaR4bqJ62C=7iQ@mail.gmail.com> <85b4a2c4-761e-bdcf-f05e-2fb16c06f11e@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <85b4a2c4-761e-bdcf-f05e-2fb16c06f11e@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, Anson Huang <anson.huang@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Olaru <paul.olaru@nxp.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, sound-open-firmware@alsa-project.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 7, 2019 at 6:22 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> >>>> +static int sof_dt_probe(struct platform_device *pdev)
> >>>> +{
> >>>> +     struct device *dev =3D &pdev->dev;
> >>>> +     const struct sof_dev_desc *desc;
> >>>> +     /*TODO: create a generic snd_soc_xxx_mach */
> >>>> +     struct snd_soc_acpi_mach *mach;
> >>>
> >>> I wonder if you really need to use the same structures. For Intel we =
get
> >>> absolutely zero info from the firmware so rely on an ACPI codec ID as=
 a
> >>> key to find information on which firmware and topology to use, and wh=
ich
> >>> machine driver to load. You could have all this information in a DT b=
lob?
> >>
> >> Yes. I see your point. I will still need to make a generic structure f=
or
> >> snd_soc_acpi_mach so that everyone can use sof_nocodec_setup function.
> >>
> >> Maybe something like this:
> >>
> >> struct snd_soc_mach {
> >>    union {
> >>    struct snd_soc_acpi_mach acpi_mach;
> >>    struct snd_soc_of_mach of_mach;
> >>    }
> >> };
> >>
> >> and then change the prototype of sof_nocodec_setup.
> >
> > Hi Pierre,
> >
> > I fixed all the comments except the one above. Replacing snd_soc_acpi_m=
ach
> > with a generic snd_soc_mach is not trivial task.
> >
> > I wonder if it is acceptable to get the initial patches as they are
> > now and later switch to
> > generic ACPI/OF abstraction.
> >
> > Asking this because for the moment on the i.MX side I have only
> > implemented no codec
> > version and we don't probe any of the machine drivers we have.
> >
> > So, there is this only one member of snd_soc_acpi_mach that imx
> > version is making use of:
> >
> >    mach->drv_name =3D "sof-nocodec";
> >
> > That's all.
> >
> > I think the change as it is now is very clean and non-intrusive. Later
> > we will get options to
> > read firmware name and stuff from DT.
> >
> > Anyhow, I don't think we can get rid of snd_dev_desc structure on
> > i.MX. This will be used
> > to store the information read from DT:
> >
> > static struct sof_dev_desc sof_of_imx8qxp_desc =3D {
> > =C2=BB       .default_fw_path =3D "imx/sof",
> > =C2=BB       .default_tplg_path =3D "imx/sof-tplg",
> > =C2=BB       .nocodec_fw_filename =3D "sof-imx8.ri",
> > =C2=BB       .nocodec_tplg_filename =3D "sof-imx8-nocodec.tplg",
> > =C2=BB       .ops =3D &sof_imx8_ops,
> > };
> >
> > For the moment we will only use the default values.
>
> Yes, that's fine for now. If you don't have a real machine driver then
> there's nothing urgent to change.
>
> Is the new version on GitHub?

Not yet, will push it today and ping you.
