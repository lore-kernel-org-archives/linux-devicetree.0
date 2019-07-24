From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [Sound-open-firmware] [PATCH v2 3/5] ASoC: SOF: Add DT DSP device
 support
Date: Wed, 24 Jul 2019 10:04:38 +0300
Message-ID: <CAEnQRZDr+gj_eiESLNbVUVy1rreRE1nnDgtb3g=CjaRF5Aq9Vw@mail.gmail.com>
References: <20190723084104.12639-1-daniel.baluta@nxp.com>
 <20190723084104.12639-4-daniel.baluta@nxp.com>
 <d85909d6-c7cb-c64b-dfa9-6cee6c0da2cb@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d85909d6-c7cb-c64b-dfa9-6cee6c0da2cb@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>, Anson Huang <anson.huang@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Olaru <paul.olaru@nxp.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, sound-open-firmware@alsa-project.org
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
>
> >       help
> >             This adds support for Sound Open Firmware for NXP i.MX8 platforms
> >             Say Y if you have such a device.
> > diff --git a/sound/soc/sof/sof-dt-dev.c b/sound/soc/sof/sof-dt-dev.c
> > new file mode 100644
> > index 000000000000..31429bbb5c7e
> > --- /dev/null
> > +++ b/sound/soc/sof/sof-dt-dev.c
> > @@ -0,0 +1,159 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> > +//
> > +// Copyright 2019 NXP
> > +//
> > +// Author: Daniel Baluta <daniel.baluta@nxp.com>
> > +//
> > +
> > +#include <linux/firmware.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <sound/sof.h>
> > +
> > +#include "ops.h"
> > +
> > +extern struct snd_sof_dsp_ops sof_imx8_ops;
> > +
> > +static char *fw_path;
> > +module_param(fw_path, charp, 0444);
> > +MODULE_PARM_DESC(fw_path, "alternate path for SOF firmware.");
> > +
> > +static char *tplg_path;
> > +module_param(tplg_path, charp, 0444);
> > +MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
> > +
> > +/* platform specific devices */
> > +#if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
> > +static struct sof_dev_desc sof_dt_imx8qxp_desc = {
> > +     .default_fw_path = "imx/sof",
> > +     .default_tplg_path = "imx/sof-tplg",
> > +     .nocodec_fw_filename = "sof-imx8.ri",
> > +     .nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
> > +     .ops = &sof_imx8_ops,
> > +};
> > +#endif
> > +
> > +static const struct dev_pm_ops sof_dt_pm = {
> > +     SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
> > +     SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
> > +                        NULL)
> > +};
> > +
> > +static void sof_dt_probe_complete(struct device *dev)
> > +{
> > +     /* allow runtime_pm */
> > +     pm_runtime_set_autosuspend_delay(dev, SND_SOF_SUSPEND_DELAY_MS);
> > +     pm_runtime_use_autosuspend(dev);
> > +     pm_runtime_enable(dev);
> > +}
> > +
> > +static int sof_dt_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     const struct sof_dev_desc *desc;
> > +     /*TODO: create a generic snd_soc_xxx_mach */
> > +     struct snd_soc_acpi_mach *mach;
>
> I wonder if you really need to use the same structures. For Intel we get
> absolutely zero info from the firmware so rely on an ACPI codec ID as a
> key to find information on which firmware and topology to use, and which
> machine driver to load. You could have all this information in a DT blob?

Yes. I see your point. I will still need to make a generic structure for
snd_soc_acpi_mach so that everyone can use sof_nocodec_setup function.

Maybe something like this:

struct snd_soc_mach {
  union {
  struct snd_soc_acpi_mach acpi_mach;
  struct snd_soc_of_mach of_mach;
  }
};

and then change the prototype of sof_nocodec_setup.
