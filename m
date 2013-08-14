Return-Path: <devicetree-owner@vger.kernel.org>
Received: from [213.199.154.249] ([213.199.154.249]:46047 "EHLO
	db9outboundpool.messaging.microsoft.com" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1759305Ab3HND2I (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Tue, 13 Aug 2013 23:28:08 -0400
Date: Wed, 14 Aug 2013 11:27:00 +0800
From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Message-ID: <20130814032658.GA16915@S2101-09.ap.freescale.net>
References: <1376308870-14232-1-git-send-email-b42378@freescale.com>
 <1376308870-14232-2-git-send-email-b42378@freescale.com>
 <CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <b42378@freescale.com>, broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, timur@tabi.org, rob.herring@calxeda.com
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 13, 2013 at 02:58:26PM -0300, Fabio Estevam wrote:
> On Mon, Aug 12, 2013 at 9:01 AM, Nicolin Chen <b42378@freescale.com> wrote:
> > +Required properties:
> > +
> > +  - compatible : Compatible list, contains "fsl,<chip>-spdif". Using general
> 
> Can't we just use "fsl,fsl-spdif" instead?
> 
> > +  "fsl,fsl-spdif" will get the default SoC type -- imx6q-spdif.

I do not think we need this general compatible string.  Device tree
compatible should be specific.

Shawn

