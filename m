Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:44560 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751351Ab3HTQQc (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 12:16:32 -0400
Message-ID: <5213965C.6010908@wwwdotorg.org>
Date: Tue, 20 Aug 2013 10:16:28 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
References: <cover.1376972170.git.b42378@freescale.com> <03182ed7464c156ec6345194d3f7ec920f753c2f.1376972170.git.b42378@freescale.com>
In-Reply-To: <03182ed7464c156ec6345194d3f7ec920f753c2f.1376972170.git.b42378@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>
Cc: broonie@kernel.org, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, tomasz.figa@gmail.com, mark.rutland@arm.com, R65777@freescale.com
List-ID: <devicetree@vger.kernel.org>

On 08/19/2013 10:32 PM, Nicolin Chen wrote:
> This patch implements a device-tree-only CPU DAI driver for Freescale
> S/PDIF controller that supports stereo playback and record feature.
> 
> Signed-off-by: Nicolin Chen <b42378@freescale.com>
> ---
>  .../devicetree/bindings/sound/fsl,spdif.txt        |   54 +

What changed between v8 and v9?
