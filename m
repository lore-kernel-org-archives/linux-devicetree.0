Return-Path: <SRS0=ZMZy=67=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6B3C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 May 2020 11:56:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CEAD20727
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 May 2020 11:56:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfoWxHBp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgEQL44 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 May 2020 07:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727833AbgEQL44 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 17 May 2020 07:56:56 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0985CC061A0C
        for <devicetree@vger.kernel.org>; Sun, 17 May 2020 04:56:56 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id s21so6430957ejd.2
        for <devicetree@vger.kernel.org>; Sun, 17 May 2020 04:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n2zu9JqKU5bD9sWT2p4LZR3ZmrdpAMY3DJ+tw0eadKI=;
        b=QfoWxHBpfNJW5n5jO+SfP+ueYUTnzn93yioe/AsSefpOShVmtxDv3cL/k+BYJzZjj4
         loieYc/Q/FcRVoUHHeotMND7sImOYHIoviE3FL8yIzu4US/1bHhoOcZP+2pgzt5J4EsO
         Rqc9UsDZ74x5UX8eXAVrtFiiXy35g0V6+tD7S4CyXim+O5+la6H+e6hTeyZeThhIu/Ft
         V+D/hkxsUR/Pt79mjclETYLMGe9a4fUWw+uuQyHCclwnP6/+mtDinfpBpAXtab5pJ/vc
         mYyaZxirHk5YTr8deDgu2Rge972T3kys/KPxmQLvoBKAKDwPtJPI6EhkgabNln8mEx+1
         lEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n2zu9JqKU5bD9sWT2p4LZR3ZmrdpAMY3DJ+tw0eadKI=;
        b=R2FSPJ1W+qRRzYASJvboErr+flsXnGmNc+cH+5ew6kacWn1VggN7UTQhPFJcJe1rHM
         TyzqoM5myqjpTggrKaFMv8DQTcAJTs5t1Jis/a5tNdYeVpUuW/IP6riDyV5Eny30hci2
         yXcLDKuJiHCfqGYMyJHkX1ZMQzaFEfbzISn0LRbswtXqYQ5acEvZn+IjOTPUKVWKodng
         zc+4/TayD89q1sAZUfH6MneF1By+gTwhJK2QhsD2+3fFfGYaImIECEIR5chPgKwkX5d2
         v6c1Fm7L1d5702C8g1swKR1Z+3vH8/Sp13u3di0YFDkGkqyoIsKCt8eAryI3yjfxn45g
         X5MQ==
X-Gm-Message-State: AOAM533E5AcVJ8zN2MgE3Y3QDtHlI+iilUSz+AdtRLQHfoewFqlQgQWA
        fYZl6G95ZTlSlEckLrjtcUqhEaCLKMXG5hZqzoLRWwv2LSg=
X-Google-Smtp-Source: ABdhPJzZ/QScx0gQ2p297ajwfhl1LwTq7Gispx4C00yR1Em6K9vahsl5Aaq2FRtkVMhA4PtTiZTacouGjS+1fUspoqA=
X-Received: by 2002:a17:906:d8c1:: with SMTP id re1mr11417735ejb.184.1589716614442;
 Sun, 17 May 2020 04:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
 <1589472657-3930-9-git-send-email-amittomer25@gmail.com> <b2ad8a81-619f-5f35-9596-c2061ae15e4c@arm.com>
In-Reply-To: <b2ad8a81-619f-5f35-9596-c2061ae15e4c@arm.com>
From:   Amit Tomer <amittomer25@gmail.com>
Date:   Sun, 17 May 2020 17:26:17 +0530
Message-ID: <CABHD4K9yjUGuo0w-RfhdZQJm3Wtj6bU2H4DXcp4Jjp=e0fFeyA@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] arm64: dts: actions: Add MMC controller support
 for S700
To:     =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, cristian.ciocaltea@gmail.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

> So, using "actions,s700-mmc", "actions,owl-mmc" here, adding this combo
> to the binding, but leaving the driver alone for now.

But if we leave this new string from driver , there would be DT
validation issue.
Are we okay with it ?

Thanks
-Amit
