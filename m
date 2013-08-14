Return-Path: <devicetree-owner@vger.kernel.org>
Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]:24626
	"EHLO va3outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752942Ab3HNG74 (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Wed, 14 Aug 2013 02:59:56 -0400
Date: Wed, 14 Aug 2013 14:34:45 +0800
From: Nicolin Chen <b42378@freescale.com>
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Message-ID: <20130814063444.GG31651@MrMyself>
References: <1376308870-14232-1-git-send-email-b42378@freescale.com>
 <1376308870-14232-2-git-send-email-b42378@freescale.com>
 <CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com>
 <20130814032658.GA16915@S2101-09.ap.freescale.net>
 <20130814053016.GF31651@MrMyself>
 <20130814063931.GB31141@S2101-09.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20130814063931.GB31141@S2101-09.ap.freescale.net>
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>, broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, timur@tabi.org, rob.herring@calxeda.com
List-ID: <devicetree@vger.kernel.org>

On Wed, Aug 14, 2013 at 02:39:33PM +0800, Shawn Guo wrote:
> We only need to maintain those versions that require different
> programming model in the list.  For example, if S/PDIF on Vybrid
> is completely compatible with imx6q one and uses the exactly same
> programming model, we do not need to maintain a compatible string
> for Vybrid S/PDIF at all.  Instead, we only need to have something
> like below in Vybrid dts file, and S/PDIF driver will just work for it.
> 
> 	compatible = "fsl,vf600-spdif", "fsl,imx6q-spdif";
> 
> Shawn

Clear. Thank you for the explain.

Then I think I can merely remain "fsl,imx6q-spdif" here,
because all other cases should be completely compatible
with this one. They are only different in the clock source
names list, which's already being specified in dts file.

Please correct me if you think this still isn't proper.

Best regards,
Nicolin Chen



