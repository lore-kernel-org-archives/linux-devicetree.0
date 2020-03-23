Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD35C4332B
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 08:46:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9ED4C20736
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 08:46:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbgCWIqR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 04:46:17 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57285 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbgCWIqR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 04:46:17 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MAwPZ-1j5YA22XqT-00BHrD for <devicetree@vger.kernel.org>; Mon, 23 Mar
 2020 09:46:15 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 5BBCA65021C
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 08:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7CY6RWBuN_G8 for <devicetree@vger.kernel.org>;
        Mon, 23 Mar 2020 09:46:14 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id EFB2064CA14
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 09:46:14 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 09:46:14 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id D7DA3804FB; Mon, 23 Mar 2020 09:45:43 +0100 (CET)
Date:   Mon, 23 Mar 2020 09:45:43 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
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
Message-ID: <20200323084543.GD4298@pflmari>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200323084011.GC4298@pflmari>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:JuJ/8RfW0VmzaiktAmHDkGIrzU2Py8XVrJibov0m9nlTWbE2EyY
 jzQKku3XefWLUnjp3Q1n6SD0KOAwFWwl8BNxyhVPDNSDzURZNcy1396yWUYFVTS3Zlwa3Me
 enIPiS7iF6fxx9mkWyGq1Io403za5GNMceICKkSiIYnWNmpeKM6YHZ2Udpy6KgE7T1J5I5e
 9vDLqiR8qQJysAV/JC6ew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u0Y5QIufjgM=:G2HhfGM8IsMF6qxdATr+54
 CKcSHcHsULxZZa7xQXnGcDqlZsHCiJCiInDr6l8+/+PduMr1FMI4xYmbZVebg+jcb09JzKP62
 8VQtoYWPj9OGXYiiMTCQvixwLCGZL2Ztfwj4J94nxlKW7qtutQuY+O2RMEASfg3uK+zIdV8K9
 1WHKPkBRpXuKUlO+salsjwEVYV1G86AAX/F6DVRjwuoNcolGCMOCK3YkUjfzzjmLI1hMalvn7
 uY5ayQMczTmycBVOYx6WLIrTClyw+MjqlAA4ZsP7tAcCzc7H2Vv/3JeSzbYXdtn7Ujm/hXPI+
 nn01sUwzHCEo5ITP88ybqRXBYto/uSxwHrdBUwnHYV/B1ZMQYMuOnFSnBaa3H/vC30QM7E83H
 3RHSKEIvueXPTWFjADuqDj4g/G7yhVnqMMinxoAJEC+1tuOHFpv5Ldh7JwDDOEyi6P6bguHvi
 UKwdr4GphjoF1aeWQ/BIyRYpkSklhMpN2eJHs7f2fYkpHeXVmAFBBtT36SjC608mYrOy2m8PX
 SHZgryczFOxhJdVxNFg5e5nxxpunxovLzqkNp69Er28F4Egfnai2Y1QQWfq61AnbZJm0dnYoV
 Kl6+uN3uOn43IQvwMEOAwtrV28/M37KOeD7q4dQ3NTLbitJ127XZGjr9OoJryu07BQ6iqEt8q
 KRBhidDIKCSeoaQE7T2aMK+DF0VPzGPCPasqHooT/4j9dJZPNT9GbbD7B+/HFi8pTyQKFmv+3
 Xi2ZA9A3FwHnNLdbumpDTi+ugeXPH/OHh1E4ZSBe+rGq1lfDjthJcP0Va6zQZwOzMdjATPa31
 QE9TB41cPJci4azCdmHw6FPR+UogpUa/DZD3exGOD3hD4U12zAaBbwl1Kl3OJ4aU+09+0Yk
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Alex Riesen, Mon, Mar 23, 2020 09:40:11 +0100:
> Geert Uytterhoeven, Mon, Mar 23, 2020 09:34:45 +0100:
> > On Fri, Mar 20, 2020 at 5:43 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > As all known variants of the Salvator board have the HDMI decoder
> > > chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> > > endpoint and the connection definitions are placed in the common board
> > > file.
> > > For the same reason, the CLK_C clock line and I2C configuration (similar
> > > to the ak4613, on the same interface) are added into the common file.
> > >
> > > Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> > > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > 
> > Did I provide a Reviewed-by?
> > 
> > > The driver provides only MCLK clock, not the SCLK and LRCLK,
> > > which are part of the I2S protocol.
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Perhaps you mixed it up with Laurent's?
> 
> Sorry. I actually did: he did provded Reviewed-by in his email, and you
> did not. I was ... a little overwhelmed.

It's even worse: even Laurent didn't provide his Reviewed-by for this
particular patch (it was bindings). Corrected.

Regards,
Alex

