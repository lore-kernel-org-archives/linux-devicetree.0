Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACBFC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 23:22:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 968F52067B
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 23:22:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mgvbJhQR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgFBXWp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 19:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgFBXWo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 19:22:44 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4B5C08C5C2
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 16:22:44 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id w20so214232uaa.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 16:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rui6nfEXkR9RNeNeTRrsaME99AQHMk8K/AUIJ5I/AMI=;
        b=mgvbJhQRav73RcCysfGBhLfjII+KzTEIxOz5wXi5BzuaVgVxxYssljthV0APDBLs6m
         CwORb6IW9136cyU59Jxtnyhi3QGu0gv5oIuQ/Uyi0UQvVyMn065B93SdLGu8BzalAOhv
         rXRLgD6nB8CDNniy7aeJauFOEhHjz8j8gim2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rui6nfEXkR9RNeNeTRrsaME99AQHMk8K/AUIJ5I/AMI=;
        b=F8MFbIaYfNmchbiIngdBYt/yG4TfXCp3ejpSWGUhJOCHjzLbykRIuv/RK6kRGXP3GZ
         iwRA3ac0erAVzTt3shPrrRXGfR5hyn/KXhKLT5206hbkh55Q/g/OoYSRFyrNrSRO+HBv
         8Qqc/0yT5Qc9hI+IcFZcvQB2vkKfUm1tOH8C8KLJ6Kvy3VIQUDObq5b7nEx+Ojf0oSAx
         eCNeN2gy1DkEgYCdtFYomMI5lbfDPSE4ZQNwxQZCRJlBVxjifkv1G6m6GgI2Ean7lVs7
         3tCPf7lgmO/S6XYjQdtokF6ObGEGj+dQ/Fj6dHCzbvhlLjfm0Jelks/9eioOwqgcsuNO
         n/Lg==
X-Gm-Message-State: AOAM530Q3O+huPwB7oxQ1NUQNl4a7AuNsJtJLRKSbGVy0lgGkgkkyvDU
        UsckbjbtJwF/UyeI9T10D4QFr7Ukt3g=
X-Google-Smtp-Source: ABdhPJwvgFV3+MVdPxiw4c9psVNjZL6JmSX8Ek9PfDr0NNcEQnu/RK1mJXziInNvvPxo5/FbKX9dHQ==
X-Received: by 2002:ab0:6044:: with SMTP id o4mr19118459ual.117.1591140163400;
        Tue, 02 Jun 2020 16:22:43 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id p75sm70166vkf.1.2020.06.02.16.22.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 16:22:42 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id s192so19779vkh.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 16:22:42 -0700 (PDT)
X-Received: by 2002:ac5:c54e:: with SMTP id d14mr204225vkl.30.1591140161937;
 Tue, 02 Jun 2020 16:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200602052104.7795-1-lukas.bulwahn@gmail.com>
 <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net> <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
In-Reply-To: <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Wed, 3 Jun 2020 09:22:16 +1000
X-Gmail-Original-Message-ID: <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
Message-ID: <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
To:     Julius Werner <jwerner@chromium.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Apologies for that slip up.

Reviewed-by: Evan Benn <evanbenn@chromium.org>

On Wed, Jun 3, 2020 at 6:16 AM Julius Werner <jwerner@chromium.org> wrote:
>
> Reviewed-by: Julius Werner <jwerner@chromium.org>
