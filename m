Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:57639 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758655Ab3HNPrY (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 11:47:24 -0400
Message-ID: <520BA687.4030905@wwwdotorg.org>
Date: Wed, 14 Aug 2013 09:47:19 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
References: <1376308870-14232-1-git-send-email-b42378@freescale.com> <1376308870-14232-2-git-send-email-b42378@freescale.com> <CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com> <20130814032658.GA16915@S2101-09.ap.freescale.net> <20130814053016.GF31651@MrMyself> <20130814063931.GB31141@S2101-09.ap.freescale.net> <20130814063444.GG31651@MrMyself> <20130814081445.GC31141@S2101-09.ap.freescale.net>
In-Reply-To: <20130814081445.GC31141@S2101-09.ap.freescale.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Nicolin Chen <b42378@freescale.com>, Fabio Estevam <festevam@gmail.com>, broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, timur@tabi.org, rob.herring@calxeda.com
List-ID: <devicetree@vger.kernel.org>

On 08/14/2013 02:14 AM, Shawn Guo wrote:
> On Wed, Aug 14, 2013 at 02:34:45PM +0800, Nicolin Chen wrote:
>> On Wed, Aug 14, 2013 at 02:39:33PM +0800, Shawn Guo wrote:
>>> We only need to maintain those versions that require different
>>> programming model in the list.  For example, if S/PDIF on Vybrid
>>> is completely compatible with imx6q one and uses the exactly same
>>> programming model, we do not need to maintain a compatible string
>>> for Vybrid S/PDIF at all.  Instead, we only need to have something
>>> like below in Vybrid dts file, and S/PDIF driver will just work for it.
>>>
>>> 	compatible = "fsl,vf600-spdif", "fsl,imx6q-spdif";
>>>
>>> Shawn
>>
>> Clear. Thank you for the explain.
>>
>> Then I think I can merely remain "fsl,imx6q-spdif" here,
>> because all other cases should be completely compatible
>> with this one. They are only different in the clock source
>> names list, which's already being specified in dts file.
>>
>> Please correct me if you think this still isn't proper.

If the clock source name list is different, then it needs a different
compatible value, so that each compatible value can specify which clock
names are required.

Also, the compatible value itself should always include the exact HW
that's present (most specific HW version), as well as any other HW it's
compatible with.

> And we generally prefer to use the soc that firstly integrates the IP to
> name the compatible.  For IMX series, I think imx35 is the one, so we
> would name it "fsl,imx35-spdif".

