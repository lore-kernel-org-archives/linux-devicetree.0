Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8AFC4332B
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 08:36:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 519832072D
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 08:36:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbgCWIgp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 04:36:45 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:32811 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbgCWIgo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 04:36:44 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mf0Nm-1jjZuS2X4k-00gWvP for <devicetree@vger.kernel.org>; Mon, 23 Mar
 2020 09:36:42 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 5BABF6500D1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 08:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2JIwlof0mzdX for <devicetree@vger.kernel.org>;
        Mon, 23 Mar 2020 09:36:42 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 054BF64FE83
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 09:36:42 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 09:36:41 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id C3AA1804FB; Mon, 23 Mar 2020 09:36:10 +0100 (CET)
Date:   Mon, 23 Mar 2020 09:36:10 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 05/11] media: adv748x: add support for HDMI audio
Message-ID: <20200323083610.GB4298@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
 <82828e89ccf4173de4e5e52dcecacc4d5168315c.1584720678.git.alexander.riesen@cetitec.com>
 <158475297119.125146.8177273856843293558@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <158475297119.125146.8177273856843293558@swboyd.mtv.corp.google.com>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:beoC41XBPkWoZR/14Zlwqz2wRtIfM/c+7uflSwbUMxivNb5PQoD
 aS6T1DiHZAlAVJf5kTmch7/MMMxbJd2B0ZtTe/PSdjuhBb3rYoGMtDxxgJDcipQ3e1XGbDn
 xK/UmmviymhSGSEqo4W/REc4ifJHgcaSkaB3q75y+RcKFstLX9jDGOnSAgylN7nm6DpBjt1
 PXXvhuQiMcrF3Nscn134Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u5SwqVuSjVk=:hBbwI3LsqOAC1s+2c8O9Qm
 USr8mR3MqwY6W34DtMeRHETeCP1A+OHLBCCFATLX4VVyYJji/C7TGmtc2WdBG2WNt2wSV5dIG
 +dyApSU+OqoFBZ1xYxuUF8K3bukyCMFawo5ykMR6qgP9EhbvOM6lu4b7b/dNSbLUqN9aDPqv5
 4o48UmgseEzMdz0Y/ZdxlkTCYqtb7DNDkm9IJh0dDhFbvcJK2Vhx3TEYJ9ulp4w7visjdrys2
 2IbO1Udd1sDzfy/1M5u5KnOsqwBwYAnqkTyWDQJ0a6JjDzwVEU/YsriTvZXUZrW6hgPjuzsic
 35mZO+IRubvTqokU8KwglMvwnQLPyTzRHzu6pt09sfWI+fqyCZlK0Evz+VyIwgdv15wfHbgiL
 PDgEmE2rtgeL5Kp1r7iWxq4N3lIaz2p4wk/qiwVxDmr5SssGAlsqbv1oFgtlBSzT6V/LuiOyD
 e1OBJlCNzfxP2XVny37Cs97xTLjapMpz6rMYEHTH0MYxyFNF4jK7WQd2K45IfS561aQv+QPue
 LVarICqd/iJoB95LCAPCDaStkWYBKTRoGklqgI58MHyC+CrLDQTZ2qenc8qePoUkAUEpytPym
 L+4nXeHCwgqHJvtb87O1AdiFfqahHVhf4CQOqbepdY80q1hchmJD8Fowh5kVPKp0VkgBIyTXj
 Y95SzdTmItcb+gnX/NLqRiifudPwehoMFZmZoVMCqyz15L5oZ/1ePkC+542hgewctN/Jk3Tjn
 PdxhirG4Zg3OiQmQiBsp6ec4mm3WSQQI24S6TVX8Tzuo+Vn0bKWoDSZp5yjiVp0gwNxhj2FS3
 SwQpziS0+2m2NsY5Bk4owoLBpSVj89MU33uuBW+obICCCT5NsaHKVHUOff7QeXXbx+5hQPJ
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Stephen Boyd, Sat, Mar 21, 2020 02:09:31 +0100:
> Quoting Alex Riesen (2020-03-20 09:12:00)
> > diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
> > new file mode 100644
> > index 000000000000..6fce7d000423
> > --- /dev/null
> > +++ b/drivers/media/i2c/adv748x/adv748x-dai.c
> > @@ -0,0 +1,265 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Driver for Analog Devices ADV748X HDMI receiver with AFE
> > + * The implementation of DAI.
> > + */
> > +
> > +#include "adv748x.h"
> > +
> > +#include <linux/clk.h>
> 
> Is this include used? Please try to make a clk provider or a clk
> consumer and not both unless necessary.

Yes, they're both used: I use clk_get_rate to get the frequency of the clock to validate
the master clock frequency configuration.

> > +int adv748x_dai_init(struct adv748x_dai *dai)
> > +{
> > +       int ret;
> > +       struct adv748x_state *state = adv748x_dai_to_state(dai);
> > +
> > +       dai->mclk_name = kasprintf(GFP_KERNEL, "%s.%s-i2s-mclk",
> > +                                  state->dev->driver->name,
> > +                                  dev_name(state->dev));
> > +       if (!dai->mclk_name) {
> > +               ret = -ENOMEM;
> > +               adv_err(state, "No memory for MCLK\n");
> > +               goto fail;
> > +       }
> > +       dai->mclk = clk_register_fixed_rate(state->dev,
> 
> Please register with clk_hw_register_fixed_rate() instead.

Ok, I see the clk_register_fixed_rate isn't even commented...
I shall change it to used clk_hw_register_fixed_rate.

But could you please point me at some documentation, example, or just add a
few words to explain the preference?

BTW, the clock which the driver attempts to provide can actually be switched
on and off (it output pad can be even tristated). As the device is connected
by I2C to the how, I seems to be unable to use the existing gated clock
implementation because of the mmio register it requires. Or am I wrong?

> > +                                           dai->mclk_name,
> > +                                           NULL /* parent_name */,
> > +                                           0 /* flags */,
> > +                                           12288000 /* rate */);
> 
> Not sure these comments are useful.

You're right. Removed.

> > +       dai->drv.name = ADV748X_DAI_NAME;
> > +       dai->drv.ops = &adv748x_dai_ops;
> > +       dai->drv.capture = (struct snd_soc_pcm_stream){
> 
> Can this be const?

It can. Fixed.

> Please drop extra newline at end of file.

Done.

Thanks a lot for the review and commentary!

Regards,
Alex
