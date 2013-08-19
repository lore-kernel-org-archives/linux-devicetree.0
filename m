Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:37760 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751153Ab3HSJZC (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Mon, 19 Aug 2013 05:25:02 -0400
Date: Mon, 19 Aug 2013 10:24:58 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v7 2/2] ASoC: fsl: Add S/PDIF machine driver
Message-ID: <20130819092458.GE3719@e106331-lin.cambridge.arm.com>
References: <cover.1376901081.git.b42378@freescale.com>
 <e7ceef74714bb4ead624b333ee3969225b4c5cb5.1376901081.git.b42378@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7ceef74714bb4ead624b333ee3969225b4c5cb5.1376901081.git.b42378@freescale.com>
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "lars@metafoo.de" <lars@metafoo.de>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "timur@tabi.org" <timur@tabi.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "R65777@freescale.com" <R65777@freescale.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Aug 19, 2013 at 09:35:22AM +0100, Nicolin Chen wrote:
> This patch implements a device-tree-only machine driver for Freescale
> i.MX series Soc. It works with spdif_transmitter/spdif_receiver and
> fsl_spdif.c drivers.
> 
> Signed-off-by: Nicolin Chen <b42378@freescale.com>
> ---
>  .../devicetree/bindings/sound/imx-audio-spdif.txt  |   29 +++++
>  sound/soc/fsl/Kconfig                              |   11 ++
>  sound/soc/fsl/Makefile                             |    2 +
>  sound/soc/fsl/imx-spdif.c                          |  134 ++++++++++++++++++++
>  4 files changed, 176 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-spdif.txt
>  create mode 100644 sound/soc/fsl/imx-spdif.c
> 
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-spdif.txt b/Documentation/devicetree/bindings/sound/imx-audio-spdif.txt
> new file mode 100644
> index 0000000..9a3fa26
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-spdif.txt
> @@ -0,0 +1,29 @@
> +Freescale i.MX audio complex with S/PDIF transceiver
> +
> +Required properties:
> +
> +  - compatible : "fsl,imx-audio-spdif"
> +
> +  - model : The user-visible name of this sound complex

Is this used semantically, or is it a completely arbitrary string?  In
either case I don't see why the compatible string doesn't give the
driver enough to have a sensible value.

I'm confused as to why we need this. The phrase "user-visible" in a
device description seems very odd.

> +
> +  - spdif-controller : The phandle of the i.MX S/PDIF controller
> +
> +
> +Optional properties:
> +
> +  - spdif-transmitter : The phandle of the spdif-transmitter dummy codec
> +
> +  - spdif-receiver : The phandle of the spdif-receiver dummy codec
> +
> +* Note: At least one of these two properties should be set in the DT binding.

Are all four units (comlpex,controller,transmitter,receiver) really
separate blocks?

Thanks,
Mark.
