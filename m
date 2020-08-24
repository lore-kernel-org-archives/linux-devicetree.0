Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D20C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 23:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5759A20702
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 23:50:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eKUrinQ6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgHXXuw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 19:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgHXXus (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 19:50:48 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17884C061755
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 16:50:48 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id n12so2413834vkk.11
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 16:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RpNbOLmyVly5rQt5gm+Vds/mrJ6L/yJijI7cBZKl+DY=;
        b=eKUrinQ6cqWF1TJCKRqfwUJ7Kh9JtC7c/z89jyLKI8FY/tvbQK05Fby0sd+WY1xnP8
         urnHhPjl7uVTBy0TGxtzjX/WGFD14mYONx2CyrPYDkaSEn69+CYfXCqZ3tFM2QgVkBC2
         X0QqIA4UpKkNqJM6JnCVfmRdvNcVjI+GNmr7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RpNbOLmyVly5rQt5gm+Vds/mrJ6L/yJijI7cBZKl+DY=;
        b=tkfg/IQOdZKkT4pzAhVg/TEmUVuVQtynd+vNtYsXSWoJp8iTVX+Ox+4DR/X82gEGLH
         dEHGWx9qLISSFNgqo2tHOOu/j4+7u7WuVZh99wYRDlM8QDuDDT7hYpsrI5CtPDI3QJPO
         fXbuAna3lek+eZSWclmWwDq3IMLPkj3090B98Hdce2/UjtqPODSSQ9BS9xRbYkpLvs6e
         DKwEbGL8/OUKdEl/iguGEkqYSBSQRDuXhdkwyFGcgu9s7pqV+SUYkq+Rb1dQAxvWkYNj
         eEX2QO8Xt2eWjvPHJGWIFEH4mSU6q9BUGC+aJHFY+JabPv5Zp749mIPn3QflJE2mcZVp
         f0bA==
X-Gm-Message-State: AOAM531ER8GDB3TLMRI7qR/c94PdxswrIgoilnkTUBJbNrAzBaE/U3b8
        zPIyASDKzxyPySPW0ouftsLzN6euD0LDqQ==
X-Google-Smtp-Source: ABdhPJwflwLiHB4pLlMHUfOwfad6J+py10DgZqRsq4pxxzdgf4Ef2nzbbXGGpULn1WkH6CS1QYSxbQ==
X-Received: by 2002:a1f:f848:: with SMTP id w69mr4312052vkh.86.1598313046973;
        Mon, 24 Aug 2020 16:50:46 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a26sm1883451uaq.19.2020.08.24.16.50.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 16:50:45 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id b26so5400493vsa.13
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 16:50:45 -0700 (PDT)
X-Received: by 2002:a05:6102:213a:: with SMTP id f26mr3942441vsg.6.1598313045280;
 Mon, 24 Aug 2020 16:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <1593194502-13164-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1593194502-13164-1-git-send-email-pillair@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 24 Aug 2020 16:50:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WTnULQs5skJiXfp+srsx5e8DeqW3uu2SEDVGoEmP2O1g@mail.gmail.com>
Message-ID: <CAD=FV=WTnULQs5skJiXfp+srsx5e8DeqW3uu2SEDVGoEmP2O1g@mail.gmail.com>
Subject: Re: [PATCH 0/2] ath10k: Add chain-1 voltage regulator voting
To:     Rakesh Pillai <pillair@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>
Cc:     ath10k <ath10k@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Fri, Jun 26, 2020 at 11:02 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Add the support to vote for the chain-1
> voltage regulator for WCN3990. This is
> added as an optional property.
>
> Rakesh Pillai (2):
>   dt: bindings: Add new regulator as optional property for WCN3990
>   ath10k: Add support for chain1 regulator supply voting
>
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 4 +++-
>  drivers/net/wireless/ath/ath10k/snoc.c                         | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)

This series is marked as "Awaiting Upstream" in patchwork.  I don't
see anything blocking it landing now.

-Doug
