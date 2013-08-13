Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ve0-f175.google.com ([209.85.128.175]:51384 "EHLO
	mail-ve0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757843Ab3HMTBP (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 13 Aug 2013 15:01:15 -0400
Received: by mail-ve0-f175.google.com with SMTP id oy10so7011221veb.34
        for <devicetree@vger.kernel.org>; Tue, 13 Aug 2013 12:01:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com>
References: <1376308870-14232-1-git-send-email-b42378@freescale.com>
	<1376308870-14232-2-git-send-email-b42378@freescale.com>
	<CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com>
Date: Tue, 13 Aug 2013 16:01:14 -0300
Message-ID: <CAOMZO5AqUcKYD8Rx_NV5=r3soBaScDY5PxD0SS_HEyYpf_PpbQ@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
From: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>
Cc: broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, timur@tabi.org, rob.herring@calxeda.com, Shawn Guo <shawn.guo@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 13, 2013 at 2:58 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Mon, Aug 12, 2013 at 9:01 AM, Nicolin Chen <b42378@freescale.com> wrote:
>> +Required properties:
>> +
>> +  - compatible : Compatible list, contains "fsl,<chip>-spdif". Using general
>
> Can't we just use "fsl,fsl-spdif" instead?

Or maybe "fsl,imx35-spdif", since mx35 was the first imx SoC with this
spdif IP block.
