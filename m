Return-Path: <SRS0=NbWy=4X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDAEC10F26
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 12:12:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D88C4217F4
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 12:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=verdurent-com.20150623.gappssmtp.com header.i=@verdurent-com.20150623.gappssmtp.com header.b="zRbWoylh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgCFMM1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Mar 2020 07:12:27 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:38088 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgCFMM1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Mar 2020 07:12:27 -0500
Received: by mail-vs1-f67.google.com with SMTP id k26so1358153vso.5
        for <devicetree@vger.kernel.org>; Fri, 06 Mar 2020 04:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ihNSuWG2TnbFd2RAi0QRsgsGZeaoV3jdGLUwn7e+PnM=;
        b=zRbWoylh99LeZ5Qz+jFtXkrPFLjVN+lTnUL2Q1BMfQA9VnpUzWPZAOQHFE/miP/oJt
         vtnjVK2+Hz0KkUXzcLwAZEtrS8PJEUU8hz8iTl/jmN3jTkESOK4Nm1m5KO/RC3A8b7BX
         Rd0ADhPQ61XpOp/MT1rFJOmbYJpVwmnxQFIBOTe4Fc7PehkJv4HdamdpzXgh7U3tbdDn
         SyjNpbbKb0LVniF3K+UzA/tXoJl0RQXUMMesboKdfx8LxogV+nhTdKPPEWul6xerCi7R
         is0sD5va+lzIYK4tJT2LAslxxjqnPhtzwDB7c01jWRHItOn54e+UQqblg/KuvPadxpAa
         md9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ihNSuWG2TnbFd2RAi0QRsgsGZeaoV3jdGLUwn7e+PnM=;
        b=IqGO9EVEb0Gya1Vg48PNK9zqr2Gpn5c8E2wqA3LGKlpejKZo/ECMD1vODm6iw3TFWR
         14y4LU/4YSlk1/O1rHigmukiq+7HwRUvNAy/dS4lRVwUsZXVDYRXxAJOPTokSlveQALc
         EK+Meaj20JZ6tXIWFF5sBeFqoFEq9L4B/Cco8p2n/iqsvP4zbdlZ4M/3ymU/V92RTqCI
         vU7TzyAHttPl4hOPbmzDz2jQj/4/tkRwVA/y4JRjQlCY9iDi6VpFTlxaGaHWer6SEcpO
         NlTuUFboUNhR6XpjWgwXOZnARg4zqOr/Z1SItR8LCitA/nu/CgHMNhrOvP0gsjBGK9/0
         qBMw==
X-Gm-Message-State: ANhLgQ3LDtyzmDkdZpIW9tYXWO1uqDwKjQPTZP9Eogp96Ad6E6Qer4f9
        TNUDD1gygziN44xiMnWbzXqY2upB/DUis6E+O56nmg==
X-Google-Smtp-Source: ADFU+vsSR47Zpizcdzhr125rCceK+nGi35On+g9szLVw50VpNWy0RoTP6XPVBPSvnCxvFQle/Yn97GxufTwYi7YrQFk=
X-Received: by 2002:a67:fb09:: with SMTP id d9mr1959744vsr.182.1583496745860;
 Fri, 06 Mar 2020 04:12:25 -0800 (PST)
MIME-Version: 1.0
References: <20200306105503.24267-1-geert+renesas@glider.be>
In-Reply-To: <20200306105503.24267-1-geert+renesas@glider.be>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Fri, 6 Mar 2020 17:41:00 +0530
Message-ID: <CAHLCerNuh+JiydP7WOD9KCRm=R7qF4h41MSsadG6PgcteQkFwQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] thermal: Add support for Renesas R-Car M3-W+
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 6, 2020 at 4:25 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi,
>
> This patch series adds support for the Thermal Sensor/Chip Internal
> Voltage Monitor in the R-Car M3-W+ (R8A77961) SoC.
>
> It has been tested on a Salvator-XS development board with R-Car M3-W+.
>
> Geert Uytterhoeven (2):
>   dt-bindings: thermal: rcar-gen3-thermal: Add r8a77961 support
>   thermal: rcar_gen3_thermal: Add r8a77961 support
>
>  .../devicetree/bindings/thermal/rcar-gen3-thermal.txt         | 1 +
>  drivers/thermal/rcar_gen3_thermal.c                           | 4 ++++
>  2 files changed, 5 insertions(+)

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>


> --
> 2.17.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds
