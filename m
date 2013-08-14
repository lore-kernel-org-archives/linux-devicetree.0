Return-Path: <devicetree-owner@vger.kernel.org>
Received: from [216.32.180.12] ([216.32.180.12]:37544 "EHLO
	va3outboundpool.messaging.microsoft.com" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1758878Ab3HNCY5 (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Tue, 13 Aug 2013 22:24:57 -0400
Date: Wed, 14 Aug 2013 10:09:12 +0800
From: Nicolin Chen <b42378@freescale.com>
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Message-ID: <20130814020911.GA31651@MrMyself>
References: <1376308870-14232-1-git-send-email-b42378@freescale.com>
 <1376308870-14232-2-git-send-email-b42378@freescale.com>
 <CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, timur@tabi.org, rob.herring@calxeda.com, Shawn Guo <shawn.guo@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Hi Fabio,

   Thank you for the comments.

On Tue, Aug 13, 2013 at 02:58:26PM -0300, Fabio Estevam wrote:
> On Mon, Aug 12, 2013 at 9:01 AM, Nicolin Chen <b42378@freescale.com> wrote:
> > +Required properties:
> > +
> > +  - compatible : Compatible list, contains "fsl,<chip>-spdif". Using general
> 
> Can't we just use "fsl,fsl-spdif" instead?
> 
> > +  "fsl,fsl-spdif" will get the default SoC type -- imx6q-spdif.
> > +
> 
> I think this is not the usual approach we do with dt.
> 
> > +static const struct of_device_id fsl_spdif_dt_ids[] = {
> > +       { .compatible = "fsl,fsl-spdif", },
> 
> Isn't only the first entry enough here?

I just saw Mark's words as well. So I don't need to change this part right?
But I'd like to add imx35 on it.


> This MODULE_ALIAS name does not match the name you provided earlier:
> 
> .name = "fsl-spdif-dai"
>

I'll fix it in v5.

Best regards,
Nicolin Chen



