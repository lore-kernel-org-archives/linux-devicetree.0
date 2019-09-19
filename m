From: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: RE: [PATCH V2 3/4] ASoC: pcm_dmaengine: Extract
        snd_dmaengine_pcm_set_runtime_hwparams
Date: Thu, 19 Sep 2019 02:58:20 +0000
Message-ID: <VE1PR04MB64799DE6C384435C8AB1918DE3890@VE1PR04MB6479.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "S.j. Wang" <shengjiu.wang@nxp.com>, "timur@kernel.org" <timur@kernel.org>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>
List-Id: devicetree@vger.kernel.org

Hi

>=20
> When set the runtime hardware parameters, we may need to query the
> capability of DMA to complete the parameters.
>=20
> This patch is to Extract this operation from
> dmaengine_pcm_set_runtime_hwparams function to a separate function
> snd_dmaengine_pcm_set_runtime_hwparams, that other components
> which need this feature can call this function.
>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

kbuild test robot report compile issue, will resend v3 after fixing.

Best regards
Wang shengjiu
