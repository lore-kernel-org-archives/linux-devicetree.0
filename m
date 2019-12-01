Return-Path: <SRS0=kxJ0=ZX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B207FC432C0
	for <linux-devicetree@archiver.kernel.org>; Sun,  1 Dec 2019 22:20:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 763C320833
	for <linux-devicetree@archiver.kernel.org>; Sun,  1 Dec 2019 22:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="M6mSsQgJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfLAWUU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 1 Dec 2019 17:20:20 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37762 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbfLAWUU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 1 Dec 2019 17:20:20 -0500
Received: by mail-ot1-f68.google.com with SMTP id k14so13680954otn.4
        for <devicetree@vger.kernel.org>; Sun, 01 Dec 2019 14:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eKEklKYTxc74yeDIIDJ461WwDRlTuHaPEY6AUOAVqFo=;
        b=M6mSsQgJBmEfwwP+As7c0R5OhdjZuCgvUyD1CNLB1aBrxyiad8XFHPavJJufmLcToB
         zgDaRn9buJ79JIwJOC+lIwto8K/nOimCOLwb4IkZDQDK8wo+C7kJkNchSFNV8A4GBYyK
         AWfQ/JiqVN0qRupA1S5hwxBzyB4zlNKivSk4VFqDNXSJ9/CgVQdYS7pLhlC6hS5Ao8SX
         lYSt5JL8PMZi5UFLcHmyfhlQFOWPLCE4ZOfAhSnBW+mGVrtPxisS2D0qcWBT16iLuQYY
         mq4lEqsLZSYTQwNfxfOhQv6i4mOzkYb5f8CzQLgDkcmrTOVxF60VmoGmaXcwJEoOkFgL
         woYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eKEklKYTxc74yeDIIDJ461WwDRlTuHaPEY6AUOAVqFo=;
        b=H861SrwmyC5M+tGGTr4q8UT8lKIJ6hdmPENcY1Zc67xzjQ9fu6XL5DGIAqUII+hnaJ
         FQhoKRXkkhBbgoxBZmCpqd4hdmwecT8VZFiii0sRnzGYJ02X+MtJaXDIfLccEEuURDNV
         1NluHtsHspZLOlZUgVZPMj85+vjLHA4CtBxYukngE9moXCWDLlExT+EkjJlVG4YvAIyo
         73V89ErihNabDDXxcR1FyQOQtH/pDzu71RYWYjdj+9JodJ5NuW6hVbMNof7yUqCpnVW8
         LrJ0pSDMXXl4M4nulYmw5BTTBVyQsDwALY9sE15yx9H24baSkju2tiblCKv+J4ebDaK7
         4tmg==
X-Gm-Message-State: APjAAAUO9bIbzYo49I2vpWpAVzf1SJUbt/heHs52cd818eUJdovYKDbl
        m2mbj/KflFO0eTr20rLwlylxOh7MsOhcVHipUkU=
X-Google-Smtp-Source: APXvYqyfdpkFF4YhIZQRSz5QfKb+7xwwpWjgMUwb72eA2kC/+/yx1PlnF+tDpLJneT1VNUkYtsoIolusAGGeAm5vPAw=
X-Received: by 2002:a9d:5e0f:: with SMTP id d15mr18031458oti.96.1575238819567;
 Sun, 01 Dec 2019 14:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20191130195335.17740-1-mohammad.rasim96@gmail.com> <20191130195335.17740-3-mohammad.rasim96@gmail.com>
In-Reply-To: <20191130195335.17740-3-mohammad.rasim96@gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sun, 1 Dec 2019 23:20:08 +0100
Message-ID: <CAFBinCD=Q+z3A4wJVumKs0-hzCvSqDuT0V3tpRPL08bQaLMBCQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: amlogic: add Videostrong KII Pro bindings
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Nov 30, 2019 at 8:53 PM Mohammad Rasim
<mohammad.rasim96@gmail.com> wrote:
>
> Add the compatible for the Amlogic gxbb(s905) based kii pro
>
> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
