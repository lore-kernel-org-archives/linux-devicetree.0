Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC67BC10F26
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 07:36:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 799412070A
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 07:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgCWHgb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 03:36:31 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:35101 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgCWHgb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 03:36:31 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N63NQ-1jIXgr2LFI-016Qfa for <devicetree@vger.kernel.org>; Mon, 23 Mar
 2020 08:36:29 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 4B75264BFA1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 07:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ux2XnL0o8EJy for <devicetree@vger.kernel.org>;
        Mon, 23 Mar 2020 08:36:27 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 7EAC46503E9
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 08:36:27 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 08:36:27 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id A763D804FB; Mon, 23 Mar 2020 08:35:57 +0100 (CET)
Date:   Mon, 23 Mar 2020 08:35:57 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: salvator: add a connection
 from adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200323073557.GA4298@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <ebda055ae4c898b4ca29e518f89d8f3f4be4d27c.1584639664.git.alexander.riesen@cetitec.com>
 <87fte0lyjz.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87fte0lyjz.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:va1wzK6PBKSRwHS5e73QYYA4Cb2QHWz3oWoBY1XbANYIG+uSBPI
 DcPqLnR/ReaeRjOQ8FXBep7V12/ptwAF22S6N9UYrfBxWzCnxw+AypSFlupsEq8H+oSNLv1
 nhGsJDzNmdrGyOqLWIdFMJKnftQDF0M39MlK8w8IEnuvMt49K19bbwxvKE7/H2BvvVUbgv1
 DrVCdtpMT8qujmAeMWQ4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8VfE8jaZrI8=:KLugmrfPPa5HTQPus25riL
 Zg76uy8AvdbRaTMwx7O5OxIQhVhlvO7nNas3Wrwrn3MWDkBxBAPes+XWpVKg48dvhE7yDsh3F
 x0CUM6UAv/JjFhKTq7npIQt/NhBR6FI07wt6n1DIUmF1cEiiogbyOW4+w4xQePQ+FAFkoGFb1
 waQRy+483tBzVplITJYN2BEy5JVpRkinrsM5PyNsRz/S1EWr0VBmciohZu0dlOpCdK2ZIYi9/
 1v/6S4jzzy9a7SXFDBgtiAvHMhHC9sXLtyZ1+zGo2Qb/wy4PeNNd71YY0kr7A4tuor4PcF4YI
 X5CSFe/5CJrECMS+hQKojRISBANdtaQD6Bqw6+/WyklvOpNmnxBqwwO5cF31B/2VxEkW/sThE
 KHkxIT+KKYvKCUFMJcrZiM60QrZ6JC3ZfDJNHCm7O50tFjQtjkAPIsLdDrtGFtJ/irp8QctEj
 HSZ1rj5XfpEejnXlUwss/6bQ+wDcTQj0zZqNvE2XDdqWXNBWV+KgSqB89+UFDgjOEEfboXtY+
 +rDbEZNF0SHcfrUtjhF2N9/YN/cj+BhRsNBZpJ39FvhuvmEUcHbXVXy6+vIznK0XGpICsM8EL
 Q3jM7TFOiRsUZRPPvXVHseFnXNxm3/lnLit16UOsrV765QBkc4O1pYo/XGYHxh1u3XJBY0nPj
 BFTcElqQO2yYoN2Nz6b8g2pA6E8vBIVgo+Lco7Sbq+PaKMfB/EymTJX5px7NsrXHxYB5dwVXG
 Mg80cd98qFt1eVjnKChADcH8epYb+BXGxhFX4O2AFSxLF/7VqWoQTksaZSZ9hQm58RrvYpq6r
 EAY9X7i29tGo734w6CAj35D4VZpTRn27J+1+IRKGZRmxIPXd7G8DouXM0VYZaFnzCKquI+V
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Morimoto-san,

Kuninori Morimoto, Mon, Mar 23, 2020 01:12:00 +0100:
> > As all known variants of the Salvator board have the HDMI decoder
> > chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> > endpoint and the connection definitions are placed in the common board
> > file.
> > For the same reason, the CLK_C clock line and I2C configuration (similar
> > to the ak4613, on the same interface) are added into the common file.
> > 
> > Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> (snip)
> > @@ -758,8 +769,19 @@ &rcar_sound {
> >  		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> >  		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
> >  		 <&audio_clk_a>, <&cs2000>,
> > -		 <&audio_clk_c>,
> > +		 <&adv7482_hdmi_in>,
> >  		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
> > +	clock-names = "ssi-all",
> > +		      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
> > +		      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
> > +		      "ssi.1", "ssi.0",
> > +		      "src.9", "src.8", "src.7", "src.6",
> > +		      "src.5", "src.4", "src.3", "src.2",
> > +		      "src.1", "src.0",
> > +		      "mix.1", "mix.0",
> > +		      "ctu.1", "ctu.0",
> > +		      "dvc.0", "dvc.1",
> > +		      "clk_a", "clk_b", "clk_c", "clk_i";
> 
> I think you don't need to overwrite clock-names here in this case ?

I vaguely remember something using the names and failing to enable clk_c
without the list spelled out...

I shall re-test though, perhaps it was my own code (since removed) using it.

Regards,
Alex

