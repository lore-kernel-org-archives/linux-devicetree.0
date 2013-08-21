Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:57458 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752545Ab3HUS06 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 14:26:58 -0400
Message-ID: <5215066D.5030603@wwwdotorg.org>
Date: Wed, 21 Aug 2013 12:26:53 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v10 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
References: <cover.1377054540.git.b42378@freescale.com> <03182ed7464c156ec6345194d3f7ec920f753c2f.1377054540.git.b42378@freescale.com>
In-Reply-To: <03182ed7464c156ec6345194d3f7ec920f753c2f.1377054540.git.b42378@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>
Cc: broonie@kernel.org, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, tomasz.figa@gmail.com, mark.rutland@arm.com, R65777@freescale.com
List-ID: <devicetree@vger.kernel.org>

On 08/20/2013 09:13 PM, Nicolin Chen wrote:
> This patch implements a device-tree-only CPU DAI driver for Freescale
> S/PDIF controller that supports stereo playback and record feature.

The DT bindings part of this patch,
Acked-by: Stephen Warren <swarren@nvidia.com>

