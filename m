Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-db9lp0248.outbound.messaging.microsoft.com ([213.199.154.248]:57638
	"EHLO db9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753061Ab3HVLlA (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Thu, 22 Aug 2013 07:41:00 -0400
Date: Thu, 22 Aug 2013 19:40:28 +0800
From: Nicolin Chen <b42378@freescale.com>
Subject: Re: [PATCH v10 2/2] ASoC: fsl: Add S/PDIF machine driver
Message-ID: <20130822114027.GA4258@MrMyself>
References: <cover.1377054540.git.b42378@freescale.com>
 <e9cf5e37f858dea78319720f007f66c8c063885f.1377054540.git.b42378@freescale.com>
 <52150763.8020707@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <52150763.8020707@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: broonie@kernel.org, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, tomasz.figa@gmail.com, mark.rutland@arm.com, R65777@freescale.com
List-ID: <devicetree@vger.kernel.org>

Hi Stephen,

On Wed, Aug 21, 2013 at 12:30:59PM -0600, Stephen Warren wrote:
> I still don't think those two properties are correct.
> 
> Exactly what node will those phandles point at?
> 
> There definitely should not be a DT node for any "dummy CODEC",
> irrespective of whether this binding calls the other node a "CODEC" or a
> "dummy CODEC".
> 
> If these properties are to contain phandles, it would be acceptable for
> the referenced node to be:
> 
> * A node representing the physical connector/jack on the board.
> 
> * A node representing some other IP block on the board, such as an HDMI
> encoder/display-controller
> 
> I think those options are unlikely in general, so I think instead these
> properties should just be Boolean indicating that "something" is
> connector to the S/PDIF RX/TX, without specifying what that "something"
> is. It doesn't matter what at least in the connector/jack case, although
> perhaps it does in the HDMI encoder/display-controller?

Documentation/devicetree/bindings/sound/spdif-receiver.txt
If I understand correctly, this doc for the dummy codec should be invalid?

But this patch, the spdif machine driver, is based on this codec driver,
pls check the following code:

164 +       codec_rx_np = of_parse_phandle(np, "spdif-receiver", 0);
165 +       if (codec_rx_np) {
169 +               data->dai[num_links].codec_of_node = codec_rx_np;
173 +       }

Accordingly, the binding I planned to add in DT:

27 +       spdif_rx_codec: spdif-receiver {
28 +               compatible = "linux,spdif-dir";
29 +       };
30 +
31 +       sound-spdif {
32 +               compatible = "fsl,imx-audio-spdif",
33 +                          "fsl,imx-sabreauto-spdif";
34 +               model = "imx-spdif";
35 +               spdif-controller = <&spdif>;
37 +               spdif-receiver = <&spdif_rx_codec>;
38 +       };


So if the DT can't allow me to include this codec node, how could I
handle it in the current baseline.

Could you please directly provide me a nicer means? Or maybe just an
eclectic way for everyone, since it doesn't look like we have a perfect
solution right now.

Thank you so much.
Nicolin



