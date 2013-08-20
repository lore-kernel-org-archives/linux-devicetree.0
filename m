Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:43246 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751718Ab3HTTA7 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 15:00:59 -0400
Message-ID: <5213BCDF.2010705@wwwdotorg.org>
Date: Tue, 20 Aug 2013 13:00:47 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [alsa-devel] [PATCH v9 2/2] ASoC: fsl: Add S/PDIF machine driver
References: <cover.1376972170.git.b42378@freescale.com> <ede222d17047e863da34a78069ceead2668bd5d2.1376972170.git.b42378@freescale.com> <52139680.1010800@wwwdotorg.org> <CAGoOwPQ_7F1-3AetKBF35pwO_-LNY6yUtx_r8Mn+HZia_WqyoA@mail.gmail.com>
In-Reply-To: <CAGoOwPQ_7F1-3AetKBF35pwO_-LNY6yUtx_r8Mn+HZia_WqyoA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Nicole Otsuka <nicoleotsuka@gmail.com>
Cc: Nicolin Chen <b42378@freescale.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de, festevam@gmail.com, s.hauer@pengutronix.de, timur@tabi.org, rob.herring@calxeda.com, tomasz.figa@gmail.com, broonie@kernel.org, p.zabel@pengutronix.de, R65777@freescale.com, shawn.guo@linaro.org, linuxppc-dev@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

On 08/20/2013 10:54 AM, Nicole Otsuka wrote:
> Hi Stephen,
> 
> I have a whole changelist in the cover letter (PATCH 0/2). Please take a
> look at it.
> 
> And about the codec dummy things.. I do that only because the codec
> driver's doc say so.

The DT binding document is not meant to be influenced by internal driver
architecture.
