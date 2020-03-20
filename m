Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26955C4332D
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:52:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05B3120739
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgCTQww (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 12:52:52 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53195 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgCTQww (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 12:52:52 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTiHd-1iqDM60p6j-00U3dg for <devicetree@vger.kernel.org>; Fri, 20 Mar
 2020 17:52:51 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id F2DAA650077
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 16:52:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7sRpzGf3qfU8 for <devicetree@vger.kernel.org>;
        Fri, 20 Mar 2020 17:52:50 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id AA7BD64EE64
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 17:52:50 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:52:50 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 6E020804FB; Fri, 20 Mar 2020 17:15:39 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:15:39 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 07/10] dt-bindings: adv748x: add information about
 serial audio interface (I2S/TDM)
Message-ID: <20200320161539.GM4344@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <c9ff553f804f178a247dca356306948e971432fb.1584639664.git.alexander.riesen@cetitec.com>
 <20200319180125.GJ14585@pendragon.ideasonboard.com>
 <20200320084406.GB4344@pflmari>
 <CAMuHMdUdVb0LwZDx-MH2FLYYPvgq=uj_3Nrzo9obWAi-Q-2ZnA@mail.gmail.com>
 <20200320090339.GD4344@pflmari>
 <20200320095907.GB5193@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200320095907.GB5193@pendragon.ideasonboard.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7660
X-Provags-ID: V03:K1:D4eS4e4xp1McIUFcMMxslR0mUoZ9Aw9KsNAweQjf2W9PJXvfubB
 SSzlO8n0SVh68jSO6E9Tk4N9U9O/nMOi0PANTTTtvdPmho6YMBSIluPTl5961niKd+b+bWF
 sAuAn4OkNXwiEsW3WmrP1JhdiZwxtKt66M1TR/A87IhtzYtvEFj2UxZwNXQBF7IWYFKciDZ
 JRkBYxCgtJRnn5pjnLFpA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tWCjiYKAreY=:oyTRBSXKeMVmdgikJPOKJW
 CoTaGsSUiiEWKVBf+rF4t/V/gzVRTA5CRgpnCxLnqyRhSInLSIX0zKiISRxpUZmzlXW39+r/I
 3npPQ4tOmIFj6VUdtPJru+ms3VQYHhb0MLXJxB+9wNYpYOeqfaOROfwsGbm8vP/gQFK9vK1na
 cfh4c4ARoa5UBMmun4jLUJ4bRbw3B/pnns2DXiMsy35pcHMEps6E2Egi3hInNHP9fOupwT62e
 4d+ucQwTWDBJhd3VmaBYHiAlffn3n5RiamPLBAh6LU5mQn03dquoqOxj1ETRROnJPiSPtsgbf
 yTmaoCaVU2IvTTXoHE5iPgPRWnwuD7/IBZzcBKRMm8q3I03UUGWacOdk1YcwsHdmhnHAdaAIb
 VtnUdLy/4XHj64T06MHNX0FTwzPt39NzZO7ejkohKJlz0scAZHSw8xACiql3TahVGyksl33MR
 bhsl3DDuSOi2OvxDia7JMvSDC6DYqEXIBJY0DSWuC7PA0oUqaDIFB0oph8qhXmmcpCjGPzGit
 jVUWVl5BTgVrmsPWrHDW5K3AF5xk8MDjDt+8KcrLc7ckfOpuOEBQZh3JoFVNOU1x2ygm0kXNa
 AELFMJ6rwLEZ4ORpSY5yj01OHy5bzf0WSDvk2Rztqtqjf7tlnaFnkW3WJ6p1M9DRNCDXfqwoE
 sFsgKPeh7dm6PVKwpJxxJnOcPTFhKKow7lc3vog7+Y7OhpaWSOS3sIPQtDN/+YRHdq5se/056
 JiTiZEjU5W8lDTN6Q/XQzqdT3hfulU8PDxgsXTpB3e8C4SZu8DgjHISUDXGj1TOPUyoBHsf5a
 snQsoa6jSQkzEFr+3u65E7Ppkh5W4enBl6fpZ0NJhBKDJsXpV89ZIpw2PK0jock9Ja3axo4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent,

Laurent Pinchart, Fri, Mar 20, 2020 10:59:07 +0100:
> On Fri, Mar 20, 2020 at 10:03:39AM +0100, Alex Riesen wrote:
> > Geert Uytterhoeven, Fri, Mar 20, 2020 09:48:14 +0100:
> > > 
> > > You'd be surprised how many board designers would consider this a cheap
> > > 12.288 MHz clock source, without using the I2S port ;-)
> > 
> > Well, I am :-)
> > 
> > Especially considering that the driver will not switch the MCLK pin aktive
> > (all I2S-related pins are tristate by default).
> 
> If the MCLK can't be output without enabling the I2S then I don't mind
> if we make the #clock-cells optional, although, as Geert mentioned,
> someone may still want to use it.

So I settled on just removing the option.

> > And how do I require it to be set unconditionally? By just removing the
> > "if ..." part of the statement?
> 
> Yes. For YAML it's easy too, the hard part is making properties
> conditional :-)

Converting it into YAML turned out a bit more than just reformatting:
some of the explicit bindings schema is only implied in the text format :-(

Takes a while to find out what is what.

Regards,
Alex
