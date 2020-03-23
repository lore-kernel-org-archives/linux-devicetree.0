Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E02C4C4332E
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 08:40:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B642A2072D
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 08:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgCWIkp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 04:40:45 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:40945 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbgCWIkp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 04:40:45 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Ml76o-1jfhpv1rOG-00lTq8 for <devicetree@vger.kernel.org>; Mon, 23 Mar
 2020 09:40:43 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 3A2B46503F9
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 08:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Q4_XsKtadR2G for <devicetree@vger.kernel.org>;
        Mon, 23 Mar 2020 09:40:42 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id DE98764ED8C
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 09:40:42 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 09:40:42 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id C14E8804FB; Mon, 23 Mar 2020 09:40:11 +0100 (CET)
Date:   Mon, 23 Mar 2020 09:40:11 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 09/11] arm64: dts: renesas: salvator: add a connection
 from adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200323084011.GC4298@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
 <077a97942890b79fef2b271e889055fc07c74939.1584720678.git.alexander.riesen@cetitec.com>
 <CAMuHMdXiG1upHQrCcuZgNLFOEoeDVcb0zWxh1BZZST5TOURDBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXiG1upHQrCcuZgNLFOEoeDVcb0zWxh1BZZST5TOURDBQ@mail.gmail.com>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:7LWdgejStwHZdXtgIXkLnZprsT3RBlB0JA7bs1x+7Ilf541cRFk
 XZ6eIDsnAm+O5D9qX0yBSpCjhDACkHYutqZBmZr7J6MMqUeFDtiGUDPewOT0zAxuPV8bHBW
 fvZxl1+KfALtWGr1C9S+yQ5Ysznb9+3m4es0vonnFvNiu9lX3f2D7VunLJijYjYj4CVZ68q
 QwzoGToeEWKoHXyK7zhUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b5MwLMVrPow=:RUWHYzlW9IBzWJl+9e0cpk
 g1BWDhush4SwzLvR78V86z+yPQgHtBR1nm54vIzhkwVjtptEcBU0zytU00Iv+/P580DYQfOs0
 hHTmJ6GAmNfr2PbPygqpYekl+UHukPIhptrHk2isPzpY1iC7ZBAxHHK2R2WTJfbgjxo43ibRO
 gKvlGgP7WOLI6mEYHN1kxPsj5Ow7kXa+YmcCvyPUNbMdi8PuAh+ZMRpya8BGmGy8l839t9q0T
 h85/ymPHeaOx2v8fbSITRFv/T6L50Z1c8l0oKyFoHasw9U8YtELB1f/F37C1++83j5DyhcK/k
 kvtaNwgGA1Pj6Jb54WcLiX1Hl/bBuuLGIzgPHE663pqMId2d8ECedq+lWLpwmEjnEjxJmafp5
 uTmTTQg5tNB3eSxCfMVGpJhb/qbToYl4wU7We1SJGr10NUlotrUjuTeM17t5NO64gZbzsog6l
 ZxKbg3n6LMABf24b/dQk5nyA82s5psl/QCFkOizdLykOR//2kevQmKwonPTIkrgdGhRo4QH7h
 fohbD1L9Dc+0jjVl+WI1r7gC7IHx0DTEwQABwi6skI/ZtUmJqHoNfk3WGmxAhylJr+UdVd7FO
 FQ3GkBBOs+Stjw/NtEdq0bQqoO5ryY8UgJN08eFO9yU0fBLNd9CCJxQBfEg88MfAb4tkZ1UGM
 /wfR2pb929yH0WR7UkaV2fgmjohwEdTkZVPmYFxmoJAywWCI+DFBhCRs2J5rD6vD29jzIeQJO
 mBzyPCyfCru4MG0obbU+Rm2CbXfyNTAPyGydmAwHnb+m5cp+W27GmZB1P0UCyk2V6fAREavJt
 PxhqWXbAWs8S88SQP0gMve1Sa6tMZJIhWOScdYwO5wkCJx+SCmy+td3Kih6/92BuZ6ObZHp
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Geert Uytterhoeven, Mon, Mar 23, 2020 09:34:45 +0100:
> On Fri, Mar 20, 2020 at 5:43 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > As all known variants of the Salvator board have the HDMI decoder
> > chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> > endpoint and the connection definitions are placed in the common board
> > file.
> > For the same reason, the CLK_C clock line and I2C configuration (similar
> > to the ak4613, on the same interface) are added into the common file.
> >
> > Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Did I provide a Reviewed-by?
> 
> > The driver provides only MCLK clock, not the SCLK and LRCLK,
> > which are part of the I2S protocol.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Perhaps you mixed it up with Laurent's?

Sorry. I actually did: he did provded Reviewed-by in his email, and you
did not. I was ... a little overwhelmed.

But you really did provide a lot of very useful information and it did help
to improve the code. Shall I remove the tag still?

Regards,
Alex


