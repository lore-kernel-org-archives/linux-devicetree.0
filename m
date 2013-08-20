Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:60831 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751255Ab3HTQRJ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 12:17:09 -0400
Message-ID: <52139680.1010800@wwwdotorg.org>
Date: Tue, 20 Aug 2013 10:17:04 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 2/2] ASoC: fsl: Add S/PDIF machine driver
References: <cover.1376972170.git.b42378@freescale.com> <ede222d17047e863da34a78069ceead2668bd5d2.1376972170.git.b42378@freescale.com>
In-Reply-To: <ede222d17047e863da34a78069ceead2668bd5d2.1376972170.git.b42378@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>
Cc: broonie@kernel.org, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, tomasz.figa@gmail.com, mark.rutland@arm.com, R65777@freescale.com
List-ID: <devicetree@vger.kernel.org>

On 08/19/2013 10:32 PM, Nicolin Chen wrote:
> This patch implements a device-tree-only machine driver for Freescale
> i.MX series Soc. It works with spdif_transmitter/spdif_receiver and
> fsl_spdif.c drivers.
> 
> Signed-off-by: Nicolin Chen <b42378@freescale.com>
> ---
>  .../devicetree/bindings/sound/imx-audio-spdif.txt  |   29 +++++

What changed between v8 and v9?

> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-spdif.txt b/Documentation/devicetree/bindings/sound/imx-audio-spdif.txt

> +Optional properties:
> +
> +  - spdif-transmitter : The phandle of the spdif-transmitter dummy codec
> +
> +  - spdif-receiver : The phandle of the spdif-receiver dummy codec
> +
> +* Note: At least one of these two properties should be set in the DT binding.

I still don't think "dummy CODEC" is an appropriate thing to have in DT.
