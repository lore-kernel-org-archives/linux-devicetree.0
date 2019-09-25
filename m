From: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V4 4/4] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Date: Wed, 25 Sep 2019 03:34:44 +0000
Message-ID: <AM0PR04MB6468B2731299F16400BD4601E3870@AM0PR04MB6468.eurprd04.prod.outlook.com>
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

> On Tue, Sep 24, 2019 at 06:52:35PM +0800, Shengjiu Wang wrote:
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
> >  sound/soc/fsl/fsl_asrc.h     |  3 ++
> >  sound/soc/fsl/fsl_asrc_dma.c | 59
> > +++++++++++++++++++++++++++++++-----
> >  3 files changed, 56 insertions(+), 10 deletions(-)
> >
> > @@ -270,12 +268,17 @@ static int fsl_asrc_dma_hw_free(struct
> > snd_pcm_substream *substream)
> >
> >  static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
> > {
> > +     bool tx =3D substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK;
> >       struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
> >       struct snd_pcm_runtime *runtime =3D substream->runtime;
> >       struct snd_soc_component *component =3D
> snd_soc_rtdcom_lookup(rtd,
> > DRV_NAME);
> > +     struct snd_dmaengine_dai_dma_data *dma_data;
> >       struct device *dev =3D component->dev;
> >       struct fsl_asrc *asrc_priv =3D dev_get_drvdata(dev);
> >       struct fsl_asrc_pair *pair;
> > +     struct dma_chan *tmp_chan =3D NULL;
> > +     u8 dir =3D tx ? OUT : IN;
> > +     int ret =3D 0;
> >
> >       pair =3D kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
>=20
> Sorry, I didn't catch it previously. We would need to release this memory
> also for all error-out paths, as the code doesn't have any error-out rout=
ine,
> prior to applying this change.
>=20
> >       if (!pair)
> > @@ -285,11 +288,51 @@ static int fsl_asrc_dma_startup(struct
> > snd_pcm_substream *substream)
>=20
> > +     /* Request a dummy pair, which will be released later.
> > +      * Request pair function needs channel num as input, for this
> > +      * dummy pair, we just request "1" channel temporary.
> > +      */
>=20
> "temporary" =3D> "temporarily"
>=20
> > +     ret =3D fsl_asrc_request_pair(1, pair);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to request asrc pair\n");
> > +             return ret;
> > +     }
> > +
> > +     /* Request a dummy dma channel, which will be release later. */
>=20
> "release" =3D> "released"

Ok, will update them.

Best regards
Wang shengjiu
