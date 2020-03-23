Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F541C4332E
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 08:50:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FE8E20736
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 08:50:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727597AbgCWIue (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 04:50:34 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:46833 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbgCWIue (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 04:50:34 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MOiYD-1itwPf2FHL-00QBe4 for <devicetree@vger.kernel.org>; Mon, 23 Mar
 2020 09:50:32 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 56A8C6503FF
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 08:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ir1z0sJ8a1WG for <devicetree@vger.kernel.org>;
        Mon, 23 Mar 2020 09:50:32 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 0F0CC64F08E
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 09:50:32 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 09:50:32 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id ED162804FB; Mon, 23 Mar 2020 09:50:00 +0100 (CET)
Date:   Mon, 23 Mar 2020 09:50:00 +0100
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
Message-ID: <20200323085000.GE4298@pflmari>
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
 <20200323084011.GC4298@pflmari>
 <CAMuHMdXa96P+boX9HgGMBKEXLKK91t3Jgu-Sy8mP5A5--EeP=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXa96P+boX9HgGMBKEXLKK91t3Jgu-Sy8mP5A5--EeP=A@mail.gmail.com>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:DFLZLmgqPuDWhO//4gbyM5RUAOIcXg7M+LcHi6MvR6up9QvplWE
 Lwfuw3ux/QQIQnAmgFxh8pUt3GDl8cV0jXMJTY1ywWJmGRM15k7sqjk2ERo7L+cKN9+7EM+
 6lso+bxy1zbH8V61xRwgH1J+gGxGaOLUy9/vx/1ByHWdzQt4HMVg2h1ZyYkt3D+SQwoJIJR
 A5IwITBaNXbuH+7kvyTGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p87pKciZqlI=:ERtu0RRtuTuVd5GyWA7L+k
 3he/QuogvuacmfIt9mWkPKFulQ+1vXN3oiXfEuTiRtpKjOJMwNmFeRjq/RXBYhck9W5vNWIe5
 VDAf8+zbGDemoB8J8+kzx1EHNQaz1CYercys8Wup+RcTF7c+VHsACB/iVrAXIg8D7yZK7Vl6p
 YM3lgXKreRJpHmp/FmXM2Egn3mN1MiQKFp+BGHk0rBEHYfSh9VeAxUcTSIua9vhkkl4ZHARTS
 2EPFi+MgcJag6myqpI8vy78/BL1wPjwxixOBY5KO9ik99l3uwYYMJ4qkFPdzB74mT4jfQovNc
 RsCx3cwVt8am21grjmXUySCm7XIDYEQSvEup89F1LFGyJLdNdbj1C8vpnVS1XSs1za7qewk00
 0dCj1i/s12+dD/sT7uEW4xmifAfVx3V2WBGAtYQxJd87J+lyix8mNAEOT24IKWdsm6Z6bCEDR
 Dx4OydcNr1YoC6SKOGcqonH3TK43gD9XDsB+iTrE+M/zPw+X5YqaKZQSuMw0RYL+7VZgCdPiH
 bbV+rEnEUMI6alTxsOpHB/DBv40P0Ie6saUYCwXxWJZPSDEFgXGg2An7RaoopbIR0alni4tSx
 x4fUADudPXUnEY7+oqt5d7MffBCYzpWKDsiSjfdJoekCj6baAYVt871PybGizUmet+r3zmecI
 hKK+PD8wYmHK2Hf3iTLY9y4shhZXFxJ1LsrFWgAd1GXfPeveo0cRHL3Cj3mVEq6ZJ3xk15eIq
 NPGE0Bg43+SciKvWsfxsA6IkjGZU7Y67h6UyzgP0SmqX4tjZKA378LMQRF4Tfp6o0N9BAF1o+
 kpeR2ftHLgD83xb/1IH7rsDGuEVu95zcJ3ta45N1BGCMqO1uCy5ZTKhBKczRocSflIB+p3q
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

Geert Uytterhoeven, Mon, Mar 23, 2020 09:48:00 +0100:
> On Mon, Mar 23, 2020 at 9:41 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > Geert Uytterhoeven, Mon, Mar 23, 2020 09:34:45 +0100:
> > > On Fri, Mar 20, 2020 at 5:43 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > >
> > > Did I provide a Reviewed-by?
> > >
> > But you really did provide a lot of very useful information and it did help
> > to improve the code. Shall I remove the tag still?
> 
> Please do so.
> 
> While I can point out issues in audio patches, my audio-foo is not strong
> enough to provide an R-B, and I'll rely on the R-bs provided by others.

Done. I left the suggested-bys in the trailer. Hope those are alright.

Regards,
Alex

