Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:56133 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756274Ab3HWTxH (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 23 Aug 2013 15:53:07 -0400
Message-ID: <5217BD9F.1080704@wwwdotorg.org>
Date: Fri, 23 Aug 2013 13:53:03 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [alsa-devel] [PATCH v11] ASoC: fsl: Add S/PDIF machine driver
References: <fac39ed91818630e03f81a5f0cf9ddde0e6a3c3a.1377244995.git.b42378@freescale.com> <5217B32C.5070300@wwwdotorg.org> <20130823191353.GK25263@sirena.org.uk>
In-Reply-To: <20130823191353.GK25263@sirena.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Nicolin Chen <b42378@freescale.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de, s.hauer@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, p.zabel@pengutronix.de, shawn.guo@linaro.org, linuxppc-dev@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

On 08/23/2013 01:13 PM, Mark Brown wrote:
> On Fri, Aug 23, 2013 at 01:08:28PM -0600, Stephen Warren wrote:
>> On 08/23/2013 02:04 AM, Nicolin Chen wrote:
>>> This patch implements a device-tree-only machine driver for
>>> Freescale i.MX series Soc. It works with
>>> spdif_transmitter/spdif_receiver and fsl_spdif.c drivers.
> 
>> The binding looks reasonable to me now. Thanks.
> 
> Is that a Reviewed-by?

Sure, it can be,
Acked-by: Stephen Warren <swarren@nvidia.com>

