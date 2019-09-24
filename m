From: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V3 4/4] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Date: Tue, 24 Sep 2019 09:05:52 +0000
Message-ID: <AM0PR04MB646870B1F74898098D4018C9E3840@AM0PR04MB6468.eurprd04.prod.outlook.com>
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
>=20
> One issue for error-out and some nit-pickings inline. Thanks.
>=20
> On Thu, Sep 19, 2019 at 08:11:42PM +0800, Shengjiu Wang wrote:
> > There is error "aplay: pcm_write:2023: write error: Input/output error"
> > on i.MX8QM/i.MX8QXP platform for S24_3LE format.
> >
> > In i.MX8QM/i.MX8QXP, the DMA is EDMA, which don't support 24bit
> > sample, but we didn't add any constraint, that cause issues.
> >
> > So we need to query the caps of dma, then update the hw parameters
> > according to the caps.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c     |  4 +--
> >  sound/soc/fsl/fsl_asrc.h     |  3 +++
> >  sound/soc/fsl/fsl_asrc_dma.c | 52
> > +++++++++++++++++++++++++++++++-----
> >  3 files changed, 50 insertions(+), 9 deletions(-)
> >
> > @@ -276,6 +274,11 @@ static int fsl_asrc_dma_startup(struct
> snd_pcm_substream *substream)
> >       struct device *dev =3D component->dev;
> >       struct fsl_asrc *asrc_priv =3D dev_get_drvdata(dev);
> >       struct fsl_asrc_pair *pair;
> > +     bool tx =3D substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK;
> > +     u8 dir =3D tx ? OUT : IN;
> > +     struct dma_chan *tmp_chan;
> > +     struct snd_dmaengine_dai_dma_data *dma_data;
>=20
> Nit: would it be possible to reorganize these a bit? Usually we put struc=
t
> things together unless there is a dependency, similar to
> fsl_asrc_dma_hw_params().
>=20
> > @@ -285,9 +288,44 @@ static int fsl_asrc_dma_startup(struct
> > snd_pcm_substream *substream)
> >
> >       runtime->private_data =3D pair;
> >
> > +     /* Request a temp pair, which is release in the end */
>=20
> Nit: "which will be released later" or "and will release it later"? And c=
ould
> we use a work like "dummy"? Or at least I would love to see the comments
> explaining the parameter "1"
> in the function call below.
>=20
> > +     ret =3D fsl_asrc_request_pair(1, pair);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to request asrc pair\n");
> > +             return ret;
> > +     }
> > +
> > +     tmp_chan =3D fsl_asrc_get_dma_channel(pair, dir);
> > +     if (!tmp_chan) {
> > +             dev_err(dev, "can't get dma channel\n");
>=20
> Could we align with other error messages using "failed to"?
>=20
> > +     ret =3D snd_soc_set_runtime_hwparams(substream,
> &snd_imx_hardware);
> > +     if (ret)
> > +             return ret;
> > +
> [...]
> > +     dma_release_channel(tmp_chan);
> > +     fsl_asrc_release_pair(pair);
>=20
> I think we need an "out:" here for those error-out routines to goto.
> Otherwise, it'd be a pair leak?
>=20
> > +
>=20
> Could we drop this? There is a blank line below already :)
>=20

Will update them.

Best regards
Wang Shengjiu
