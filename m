Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9B7C11D3D
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 15:28:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3EB7246A0
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 15:28:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBxy9CAM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbgB0P2r (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 10:28:47 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43283 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729174AbgB0P2q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 10:28:46 -0500
Received: by mail-lf1-f66.google.com with SMTP id s23so2374440lfs.10
        for <devicetree@vger.kernel.org>; Thu, 27 Feb 2020 07:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PcDag5KjPfbMjNOieZ/TtsOewuHdYm2EO2ojNLOAuag=;
        b=ZBxy9CAMLW+QGmiB06p3sBWXB9NP8ImNSQMEXiIuor8YO0FOLzLv4w8qUyfwhKAuoW
         ttQzB+lRSARU0sCOm2CpEaqUFz8nqI0nMIphuZ+oWBXCPJ4s1qaqdi3Vc5zwHjyQZGKL
         Ui2gyTOxL55SIZZJUzdsuWKROQVHYBPcqu86S0DIlw5n0jwJDZhhpVYueYhLxReyWXbz
         i5hnvSreCYJo0qm3qnSXnWobXksK+7RiyP11J21B1trpMb1S5YDhAc9LXVlPKwsZdqRF
         9hkwsTi+o9NBamj6ypbAUPdTz4Vuyzp0tdkbBEDjKrLsWEN627Yv8ippK/5+BNOFR0gp
         m6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PcDag5KjPfbMjNOieZ/TtsOewuHdYm2EO2ojNLOAuag=;
        b=g9rXdd0J+3M/8E9aP8kZEL1E60MxpsLTp4RNRfTtvuCcUg1rjuupi6HTSqoKQa36Fx
         FBTXwKWbfbGuE49rmliRk+WmfaOsQLZN/PkZ8smgYv8esvMh1FjgqbJKgD7KHDqZcidA
         0QMPhkw6ri4+QSG+Go2ouczhGef+MVQp6B6awtKy0yYKoAX9kdnqYvrWB4/OTpkgDe2l
         RFFV7iBupsF/gWRIh/W5A8OL9fm03XNhvF47ykeRPC/1oYfIHOOBHBMKoRk/ctYB3zgA
         JwbJVUl7Pzlvsgpg1vyVD3L9ZnfUwZumr9ThoJonDyxb3Sn7ycoKRmJp5cjpj4afZgZk
         AIZg==
X-Gm-Message-State: ANhLgQ0XGR6gKDO5kR5d4fXd9rx2zWJJ3Ls4Rzu1eGp/NCeokxnwvF5/
        2gkpcxeVgGb42EW4Dua6E0gBM8UCZlfcyUrjczLYPw==
X-Google-Smtp-Source: ADFU+vvFL72KdrVEoPcoecFuP1zt7WatO+w7PswkNjLy3IGs+erHykMuhfeDGNw7vCNh1YdhsfVzSWjyKVwXCqERODY=
X-Received: by 2002:a19:8b09:: with SMTP id n9mr89111lfd.7.1582817324693; Thu,
 27 Feb 2020 07:28:44 -0800 (PST)
MIME-Version: 1.0
References: <E1j7I7v-0004dS-5u@rmk-PC.armlinux.org.uk> <CAOMZO5A6os4myE41ZLBvW639bjRudg8Tax4yBa5JOyY5+oJW+g@mail.gmail.com>
 <20200227134538.GK25745@shell.armlinux.org.uk> <20200227151738.GM25745@shell.armlinux.org.uk>
In-Reply-To: <20200227151738.GM25745@shell.armlinux.org.uk>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 27 Feb 2020 12:28:42 -0300
Message-ID: <CAOMZO5BJdpow6zLapGd3jvx2UZbviW44dqzH5H_RKc9kCrFsCA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sr-som-ti: indicate powering off wifi
 is safe
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 27, 2020 at 12:17 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:

> Jon says:
>
> "It was changes to the mmc power handling.  Basically telling the
> controller that the card should be able to wake it up from a sleep
> state.
>
> "I think it has to do with the runtime PM addition.  This was added
> to the TI driver in commit, 9b71578de08748defb3bcae3ce8ed1a75cb6a8d7
> I don't know if that is what broke it, but that was the initial
> integration.
>
> "That was added after changes to the MMC layer were done I believe."
>
> Jon thinks the idea for fixing it came from a post on one of the
> mailing lists, but is unable to find it now.
>
> So, I think the cause is now lost in the mists of time.

Ok, thanks for checking:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
