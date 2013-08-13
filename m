Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:36111 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757453Ab3HMR62 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 13 Aug 2013 13:58:28 -0400
Received: by mail-vc0-f173.google.com with SMTP id id13so4124444vcb.4
        for <devicetree@vger.kernel.org>; Tue, 13 Aug 2013 10:58:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1376308870-14232-2-git-send-email-b42378@freescale.com>
References: <1376308870-14232-1-git-send-email-b42378@freescale.com>
	<1376308870-14232-2-git-send-email-b42378@freescale.com>
Date: Tue, 13 Aug 2013 14:58:26 -0300
Message-ID: <CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
From: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>
Cc: broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, timur@tabi.org, rob.herring@calxeda.com, Shawn Guo <shawn.guo@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Aug 12, 2013 at 9:01 AM, Nicolin Chen <b42378@freescale.com> wrote:
> +Required properties:
> +
> +  - compatible : Compatible list, contains "fsl,<chip>-spdif". Using general

Can't we just use "fsl,fsl-spdif" instead?

> +  "fsl,fsl-spdif" will get the default SoC type -- imx6q-spdif.
> +

I think this is not the usual approach we do with dt.

> +static const struct of_device_id fsl_spdif_dt_ids[] = {
> +       { .compatible = "fsl,fsl-spdif", },

Isn't only the first entry enough here?

> +       { .compatible = "fsl,imx6q-spdif", },
> +       { .compatible = "fsl,imx6sl-spdif", },
> +       { .compatible = "fsl,imx53-spdif", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, fsl_spdif_dt_ids);
> +
> +static struct platform_driver fsl_spdif_driver = {
> +       .driver = {
> +               .name = "fsl-spdif-dai",
> +               .owner = THIS_MODULE,
> +               .of_match_table = fsl_spdif_dt_ids,
> +       },
> +       .probe = fsl_spdif_probe,
> +       .remove = fsl_spdif_remove,
> +};
> +
> +module_platform_driver(fsl_spdif_driver);
> +
> +MODULE_AUTHOR("Freescale Semiconductor, Inc.");
> +MODULE_DESCRIPTION("Freescale S/PDIF CPU DAI Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:fsl_spdif");

This MODULE_ALIAS name does not match the name you provided earlier:

.name = "fsl-spdif-dai"
