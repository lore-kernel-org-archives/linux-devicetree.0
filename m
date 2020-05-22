Return-Path: <SRS0=I+Xt=7E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6FAC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 21:24:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1569920757
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 21:24:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731027AbgEVVYy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 May 2020 17:24:54 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:44353 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730976AbgEVVYy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 May 2020 17:24:54 -0400
Received: from mail-qv1-f48.google.com ([209.85.219.48]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M42Ss-1jcF9w2ncO-0004Q9 for <devicetree@vger.kernel.org>; Fri, 22 May
 2020 23:24:52 +0200
Received: by mail-qv1-f48.google.com with SMTP id l3so5409864qvo.7
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 14:24:52 -0700 (PDT)
X-Gm-Message-State: AOAM531JXT5cqxzlMNkDFsh2/YGRyJZEe9LIVruruJv2aFhH74CaVg2/
        QptdZQLcV8eq/67d1mQTA0mUEcaHlu5QRqfUMFk=
X-Google-Smtp-Source: ABdhPJyAzA5FWT+7ggHkGIJVW5G625DLGMQ+xLbcYfsvKmg5QVb1RfOKC7fxaBxax93WGvQZ7iy0FhEnP6ORQ5y2MIM=
X-Received: by 2002:a05:6214:3f0:: with SMTP id cf16mr5926205qvb.4.1590182691491;
 Fri, 22 May 2020 14:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <5ec7b744.ZcxrA/L/3+XSTqYO%lkp@intel.com> <5c53e7b7-4caa-06b9-8a9f-b3a29f008bb7@gmail.com>
In-Reply-To: <5c53e7b7-4caa-06b9-8a9f-b3a29f008bb7@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 22 May 2020 23:24:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2kz3ej1Kko6uBd5BxYW2CqN+X3kUJ2nDydbUg8Aqfx1w@mail.gmail.com>
Message-ID: <CAK8P3a2kz3ej1Kko6uBd5BxYW2CqN+X3kUJ2nDydbUg8Aqfx1w@mail.gmail.com>
Subject: Re: [soc:mediatek/dt] BUILD REGRESSION 189881af810d452b592ee958db43eb4c57df9803
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     kbuild test robot <lkp@intel.com>, arm-soc <arm@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0gx6TlmzR/k8KPFIjFvTdrz0IJfjw8p21d+0ntYdGkad6MoShDS
 S85cmJSviNAX65XyMWJ58eGbu4rCY58/hpsF990H/5TgC2rOS7V7kYn+5xjh+bmnCGMK9ft
 VANdz1YF4CWIveVJz09GGdQ0QcVeH9oOVqAxhZg6cqpeOJ7kBpwhwtdgNXNiqGFMeX6R5s3
 wxSKPGJM6Q4nFjvY58+3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/TCRIgHXU3U=:MD1+xGuM38VZc/Ndbjn+yw
 iYWjg976psdE/T76dWB/m8UP/GxmlGUFoTLtnETjiJQwwR9s2QPjWeMLZaq04CgNJNXtBAb26
 qBo0u6ePBvJs29a6v2Stqt9A0NwEQHqY/dBUwZGjoFWDT1BonWX0K42fANQMdsth2AG1yU5r/
 LpFmTpXmR0hZr7Skat2PVuRuxwTfa+jxRfCSDjKcnqSkXWiUiU4YH6GYFLZGbpB+44V/Izq5v
 3EN/29veCI+6ywUpObpCnKguNhO40UMa0pH//RIp29barNJShCHLPpSR/8q33DhoSR8uD+mbf
 WP9mulmUKfUkekVugdRZI48RtSrdKc5IoQerd0IjFfIXK/IKU3PGE3+ckH6w1sKsErNr/mihf
 /MXhlUI9nJ4f9V2YoKAAFsuLkp8/iYhfh1s3+mpquk2ueHjBCrwV18NWb9/2Z4Mi7HPqDbCRY
 xauh+QyemdYBMsLBieCeOLhxwLdmaomdem0x0hKIAnHLgLpiSezBiSw3rivZKnz5Gfgzb7aov
 xQSMQhBS/I8ptnb2uh8B0BgqIpnqxiGK+fCTixrHWLO3JLuXUdg0Pij8fedNcPlTIdGn/ZVhD
 G3LzJv6tPejaLrSFrQBd6kf9EXJXVAEBJtuCZk2O6MkoRnlVFTabfpn7y1S89GIUVikyECkoB
 KRsKCwCIFfMk5yub159RuJDFXJEUOAZtxbwXl8GO41G1vbkPDZlOqibeC2JMHmcJ4ve6cWnQY
 1aBJZFXA2l6k5+f1KAj1hZddiMtseOLF5ZYbiITkLoTO+xtLjeuawHjtWgg1oxG4rMfteZ+4J
 Xad0TUqYXuje7JjTyJG1bovK0TdYQWlepuT3ysadE0h6EPTOGA=
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 22, 2020 at 10:54 PM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
> Hi all,
> Hi Arnd and Olof,
>
> On 22/05/2020 13:28, kbuild test robot wrote:
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git  mediatek/dt
> > branch HEAD: 189881af810d452b592ee958db43eb4c57df9803  arm: dts: mt2701: Add usb2 device nodes
> >
> > Error/Warning in current branch:
> >
> > ERROR: Input tree has errors, aborting (use -f to force output)
> >
> > Error/Warning ids grouped by kconfigs:
> >
> > recent_errors
> > `-- arm-randconfig-r035-20200520
> >     `-- ERROR:Input-tree-has-errors-aborting-(use-f-to-force-output)
>
> Can you please explain me how to reproduce this. I'm not able to deduce that
> form this email. I can then look into this and how to fix it. Although up to now
> I don't understand where the relation with my dts32 changes is.

I don't see it either here, adding the devicetree list, in case anyone has more
information.

      Arnd
