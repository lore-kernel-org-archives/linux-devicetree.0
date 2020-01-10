Return-Path: <SRS0=Jntx=27=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553D8C282DD
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jan 2020 17:41:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C1D2206ED
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jan 2020 17:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="RKyYJqPd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgAJRlX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jan 2020 12:41:23 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:45863 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbgAJRlW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jan 2020 12:41:22 -0500
Received: by mail-io1-f67.google.com with SMTP id i11so2924406ioi.12
        for <devicetree@vger.kernel.org>; Fri, 10 Jan 2020 09:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZbQyo97E12JiQyYySbTSdZx19yjj8JSBt+Y0Mb9k/oE=;
        b=RKyYJqPd9zuWTcr8+5KldE2tUJzeO2CN3ViQHERbo0EJnK2GKt99YpaYTAiJb4Ru7V
         L8jtDu76+CEmTMv/62SLLtA8lhEBzxkCF73LFgIxoIsYtEdYhrLfX3WWUJvzkxnV+PlD
         mY/KFBBHoV3tFwOisY9SqD34FzfRtJwFsIk+FQMKE8iZ0H8xlTySuNZDVTzQaGrcxTKk
         hiz1QSdziqkh/JXGLpAlkHsD8uJvusD+mkaWRJmUG/BAV27rUpTMCCJRDD/eDgRq8ct9
         Ht8ybkxZGyzWdDDy42ylwsuJy1Unws2UoLugSiKDK8AhAtZ+93BVEQKajyLwFEqBjKyE
         +jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZbQyo97E12JiQyYySbTSdZx19yjj8JSBt+Y0Mb9k/oE=;
        b=rRsKzRrrJRU+7YFFNDofvOv72ytf4LqxB4wGVeMhbIQ5ssD8fG75659HGa1E4YD3jf
         cwOjkpWmJTaPn4hWyAIihWLtxUoepDnmwKWIDLwF+e9z9yHig+W4g80fGSKgbU59+/2C
         E1JAiGnPukAGevyY/sxtlcBKWDiaUCLnotj8kkLSdDzE0GFKjsPT5cvPJJ8Cz5dPReFS
         8TJL8kG22AuYo8lenIvoj/I6Z5vcmS1D1wEFimXDM8DWL4ClIpgN9OyOHH5hVN4sCVbB
         aUGt6nkynmH/hg9+6kKuYSccGnSKRB4gK1fdPwvEf9TK0nZrLnf36IvblKjegNdIgp0s
         hZ8Q==
X-Gm-Message-State: APjAAAV/WJQso9be9chwkw23I9dm+BI6whtYVo3DT/NRa+be1kz/OSZz
        fuqBrD5P7oJdzrsh4IsOtNoicEKVZ5AZJbq4Pp+46g==
X-Google-Smtp-Source: APXvYqzxTQ4SoPYj84MBP2256b9N8PKJf0z7eKjlQ4rhKSqiQW9tWF5+C8Bg+6bi9ottTHxKKTZIFAGBUbF/pJe2gXs=
X-Received: by 2002:a6b:3a8a:: with SMTP id h132mr3396308ioa.207.1578678080202;
 Fri, 10 Jan 2020 09:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20200110063755.19804-1-zhang.lyra@gmail.com> <20200110063755.19804-3-zhang.lyra@gmail.com>
In-Reply-To: <20200110063755.19804-3-zhang.lyra@gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 10 Jan 2020 09:41:08 -0800
Message-ID: <CAOesGMjNkVpTOhSrLUKjNZnKFk55DTgg29QzVBEFVh3Z=Ra+cQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: Add Unisoc's SC9863A SoC support
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Jan 9, 2020 at 10:38 PM Chunyan Zhang <zhang.lyra@gmail.com> wrote:
>
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
>
> Add basic DT to support Unisoc's SC9863A, with this patch,
> the board sp9863a-1h10 can run into console.
>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>

You reposting a patch that we have already applied, and there's also
no changelog for it in the description.

If you need to change the contents to fix something, you need to send
a patch for the delta by now, with the usual expectations of
explaining why the fix is needed, etc.


Thanks,

-Olof
