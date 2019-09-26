From: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V5 4/4] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Date: Thu, 26 Sep 2019 03:57:16 +0000
Message-ID: <AM6PR04MB6470AFE4170063A6F1429C33E3860@AM6PR04MB6470.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: "timur@kernel.org" <timur@kernel.org>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>
List-Id: devicetree@vger.kernel.org

Hi

> Just a small concern...
>=20
> On Thu, Sep 26, 2019 at 09:29:51AM +0800, Shengjiu Wang wrote:
> >  static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
> > {
> > +
> > +     release_pair =3D false;
> > +     ret =3D snd_soc_set_runtime_hwparams(substream,
> > + &snd_imx_hardware);
>=20
> This set_runtime_hwparams() always returns 0 for now, but if one day it
> changes and it fails here, kfree() will be still ignored although the sta=
rtup()
> gets error-out.
>=20
> We could avoid this if we continue to ignore the return value like the
> current code. Or we may check ret at kfree() also?

I like to ignore the return value.

Best regards
Wang shengjiu
