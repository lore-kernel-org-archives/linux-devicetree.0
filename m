From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [Sound-open-firmware] [PATCH v2 3/5] ASoC: SOF: Add DT DSP device support
Date: Wed, 7 Aug 2019 18:29:36 +0300
Message-ID: <CAEnQRZARFQjutkvW3_xkQAQznNm8c5jSjtAG715VtrZnDxztoA@mail.gmail.com>
References: <20190723084104.12639-1-daniel.baluta@nxp.com> <20190723084104.12639-4-daniel.baluta@nxp.com>
 <d85909d6-c7cb-c64b-dfa9-6cee6c0da2cb@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d85909d6-c7cb-c64b-dfa9-6cee6c0da2cb@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, Anson Huang <anson.huang@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Olaru <paul.olaru@nxp.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, sound-open-firmware@alsa-project.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 23, 2019 at 6:19 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> > diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
> > index 61b97fc55bb2..2aa3a1cdf60c 100644
> > --- a/sound/soc/sof/Kconfig
> > +++ b/sound/soc/sof/Kconfig
> > @@ -36,6 +36,15 @@ config SND_SOC_SOF_ACPI
> >         Say Y if you need this option
> >         If unsure select "N".
> >
> > +config SND_SOC_SOF_DT
> > +     tristate "SOF DT enumeration support"
> > +     select SND_SOC_SOF
> > +     select SND_SOC_SOF_OPTIONS
> > +     help
> > +       This adds support for Device Tree enumeration. This option is
> > +       required to enable i.MX8 devices.
> > +       Say Y if you need this option. If unsure select "N".
> > +
>
> [snip]
>
> > diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> > index fff64a9970f0..fa35994a79c4 100644
> > --- a/sound/soc/sof/imx/Kconfig
> > +++ b/sound/soc/sof/imx/Kconfig
> > @@ -12,6 +12,7 @@ if SND_SOC_SOF_IMX_TOPLEVEL
> >
> >   config SND_SOC_SOF_IMX8
> >       tristate "SOF support for i.MX8"
> > +     select SND_SOC_SOF_DT
>
> This looks upside down. You should select SOF_DT first then include the
> NXP stuff.

One more thing: So this should be 'depends on SND_SOC_SOF_DT' right?
