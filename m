Return-Path: <devicetree-owner@vger.kernel.org>
Received: from [213.199.154.253] ([213.199.154.253]:20101 "EHLO
	db9outboundpool.messaging.microsoft.com" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751736Ab3HNFpT (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Wed, 14 Aug 2013 01:45:19 -0400
Date: Wed, 14 Aug 2013 13:30:17 +0800
From: Nicolin Chen <b42378@freescale.com>
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Message-ID: <20130814053016.GF31651@MrMyself>
References: <1376308870-14232-1-git-send-email-b42378@freescale.com>
 <1376308870-14232-2-git-send-email-b42378@freescale.com>
 <CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com>
 <20130814032658.GA16915@S2101-09.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20130814032658.GA16915@S2101-09.ap.freescale.net>
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>, broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, timur@tabi.org, rob.herring@calxeda.com
List-ID: <devicetree@vger.kernel.org>

Hi Shwan,

On Wed, Aug 14, 2013 at 11:27:00AM +0800, Shawn Guo wrote:
> I do not think we need this general compatible string.  Device tree
> compatible should be specific.

So I should just use 'fsl,<chip>-spdif" and list all <chip>-spdif
in compatible list?

I added 'fsl,fsl-spdif' just for those not-in-list chips, Vybrid
for example. So you think I should add all the possible chips to 
the list? But what if some chip I don't know right now that also
uses this spdif controller? Add them to the list later?

Thank you.



