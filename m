Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:40438 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756313Ab3HWTId (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 23 Aug 2013 15:08:33 -0400
Message-ID: <5217B32C.5070300@wwwdotorg.org>
Date: Fri, 23 Aug 2013 13:08:28 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v11] ASoC: fsl: Add S/PDIF machine driver
References: <fac39ed91818630e03f81a5f0cf9ddde0e6a3c3a.1377244995.git.b42378@freescale.com>
In-Reply-To: <fac39ed91818630e03f81a5f0cf9ddde0e6a3c3a.1377244995.git.b42378@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>
Cc: broonie@kernel.org, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, rob.herring@calxeda.com, shawn.guo@linaro.org, tomasz.figa@gmail.com, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On 08/23/2013 02:04 AM, Nicolin Chen wrote:
> This patch implements a device-tree-only machine driver for Freescale
> i.MX series Soc. It works with spdif_transmitter/spdif_receiver and
> fsl_spdif.c drivers.

The binding looks reasonable to me now. Thanks.

> diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c

> +	if (of_property_read_bool(np, "spdif-out")) {

I'd be tempted to safe those property values into a variable so that ...

> +	data->txdev = platform_device_register_simple("spdif-dit", -1, NULL, 0);
...
> +	data->rxdev = platform_device_register_simple("spdif-dir", -1, NULL, 0);

... those two statements could be conditional upon whether TX/RX were
required too.

However, this isn't a big deal, and could be cleaned up later.
