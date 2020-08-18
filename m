Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D155C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 20:34:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB72C206B5
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 20:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vMH3l0Ot"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgHRUec (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 16:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgHRUec (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 16:34:32 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95466C061389
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 13:34:31 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id i10so22932224ljn.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 13:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UeUYhEvCfw9NOl+HERmOJ7DFqr0ihgPwcoKjXBohN+Y=;
        b=vMH3l0Otm34KNm6QlC3O1t2+MgmBN2zcfJtiK+7wZFQkr0T4ZQU/Jl1nyjchTu3lP2
         Bm1MBEt8tsGPrmkVtSGS6bIvcXt5BNZPnqIoL4tNYBB5J3BvQ275f8GvVyM2O1tHeuSE
         ciAEfI4sSL2ZFY9FEUfV1Ksg9GtaFdUA4J/rTp7Y+TjJmB5kgWMvEN0VEflJwyNV5Gb2
         /R+fuXcCMGWwdZ34P0b9GJE0yY5iuEzjXw/8OEOOnh4OsjrsAvox20nTKHp9F6AEI2Eg
         stH0xdwSxBxzGoCm0pvVGakDdG9Hm2T8WierYzuALP9qF8AsIRk+SGX9yisFQOc1pW/g
         0LPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UeUYhEvCfw9NOl+HERmOJ7DFqr0ihgPwcoKjXBohN+Y=;
        b=DvBMKBXe8Q5VvTZK3Tbzl3EbgM2guMxfa3zCIC5NekpSQna1eeh35FxbHzJVbwZFKW
         29dwBd0CcXNiRrp8SiRP93iEbAZYj39hiWiCVXxuB7QAErmo8bNEqmJ7UdmeDn4mELiy
         KPrfIOsfl7F23PZ2GVqZ41ytozUpc8A6bwX84O9pbHSPnkLL4nlP3Pk+JOQv2jto6lXb
         fNF3BTQb41TP82xWJXoxzcsJbKwNr4C5MD1kd5xHLgAy18WLd22O+gy6PukacLhH/kSJ
         tkOG2lUEHRrBmG98At/0c7/ABOM6QZcXULPjM8VY6Wxr8AHtTgHdtzu9dNZi7dhYekpN
         LFLQ==
X-Gm-Message-State: AOAM533RezQprzU2KnImsE7/M/JroKBSS1i/tx8jOtOdJ+6V2NM9M4jK
        DMqoKhpo+qoyIASjvk8nlHDYiGDoWyq3BL7hAKk88fD6
X-Google-Smtp-Source: ABdhPJw9bWurw0wSsz+vxkH09BzA49CNJ8gKNur6PoZXCJKoVuUbJKP0yl70WwkpqOlrbaMUbrQCK0jgcMBO92q+uBM=
X-Received: by 2002:a2e:80d3:: with SMTP id r19mr11149774ljg.310.1597782869771;
 Tue, 18 Aug 2020 13:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200818202531.3918168-1-robh@kernel.org>
In-Reply-To: <20200818202531.3918168-1-robh@kernel.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 18 Aug 2020 17:34:18 -0300
Message-ID: <CAOMZO5A+qJWC-08nx4w_U9UXphEARJ2Gb-X06Dw8yfYRHQztwA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx: Add missing imx8mm-beacon-kit.dtb to build
To:     Rob Herring <robh@kernel.org>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Aug 18, 2020 at 5:25 PM Rob Herring <robh@kernel.org> wrote:
>
> The imx8mm-beacon-kit.dtb was never added to dtbs-y and wasn't getting
> built. Fix it.
>
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
