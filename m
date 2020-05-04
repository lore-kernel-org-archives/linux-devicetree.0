Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1695C3A5A9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 20:01:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8474520707
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 20:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="PQLxh8Bx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbgEDUBa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 16:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728045AbgEDUB3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 16:01:29 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC77C061A0F
        for <devicetree@vger.kernel.org>; Mon,  4 May 2020 13:01:28 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id r16so14711776edw.5
        for <devicetree@vger.kernel.org>; Mon, 04 May 2020 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a3/e8Z9+7dUAsUY2FABXXWSYilV/IhKWhqiAxe7AB0w=;
        b=PQLxh8BxfRVNbGhoMqQ+SidqGRLgyNwgg8AMxdhr+hQzfTeHVr36B+yHinyk4RO/N4
         Y6or3TT0f0D5Fk2htAjerP0VkNsQmuf+6kdiRqGxrmqzFx4LeKaq2tJJyV4BLREtMGXz
         OYg6bJ8gAXk19xxFW/6JajQ6o5OgEmm+BlSXGcHzftgStQevaAhOKN4SIQzOWZsmtA2M
         sHN7uXi6oTRnaDA0P8KsZ+qN+PRH+Bz2jlGhskWtqMnQT4Akn2iBxP70/9YiOy2/UExj
         h7tIFeuI5HvEEkvt4yCaBpVupn252Kup6VLqULCGJqBRmjdtUTAeOXz58YCUjCCiXISr
         3d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a3/e8Z9+7dUAsUY2FABXXWSYilV/IhKWhqiAxe7AB0w=;
        b=XDGosIfJLdYBldj+LpeHNNnJZ1V+VlY48uqtZybjpw2DLzONXrFsAx/T0xuB2FCA+P
         T23vSz4azwqdjUGBw468qVk3wbl6WPSJIN1HYNNs3JrHxoc/6aEa1Aw0sy5UeaU2vBd9
         E7QMvcO9lTsMwzEdf3kRu9pyYJOJzcnCkBzAJ7psU7R1t6JrvnLLOJHxL/dtpEluqLIU
         cOywpgip/6OmZFmD9/yW2Kx0GbhUmE41B8JHuU+t2BS3V1J+Qu96Jp7Iae9Bd9mShpl0
         m19zYQHIWsX09QRnaA+iiR32Zh8eu7a6VoQKXiN5fFAL+HAmV0nEr3aaRvZFIGfAYyut
         nZqA==
X-Gm-Message-State: AGi0Pua1MCqd+dqGT+bo9Is5um8fayYb+sWaGADM6xCXJQo0el6ALRhw
        lv+KXoRnPGl9OwIx4HgEjL2C0Q5ueJFpnHeQzXBg+g==
X-Google-Smtp-Source: APiQypJuGrmkU0XtajGtCW6+tnsEvDAvqoXPAkujg8EqXPfFARkabTI9PH5qgtjx1yu+XzN1nobAPxrfByxFFM1kmdk=
X-Received: by 2002:a05:6402:356:: with SMTP id r22mr17037164edw.3.1588622487633;
 Mon, 04 May 2020 13:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200502143555.543636-1-pasha.tatashin@soleen.com>
 <202005041112.F3C8117F67@keescook> <CA+CK2bBDzbXdH23aDxqGzMoxPppNcVmitrYJ00tJqympMBVJOg@mail.gmail.com>
 <202005041211.040A1C65C8@keescook> <CA+CK2bAJgKR+=Tby91gU-ZKy29Juv_oJinCTFAWRaKiiro2vkg@mail.gmail.com>
 <202005041230.806B1581D@keescook>
In-Reply-To: <202005041230.806B1581D@keescook>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Mon, 4 May 2020 16:00:51 -0400
Message-ID: <CA+CK2bBFQYnFWeDxegR+7rz2nepbK-upqBnRjLgO9JH7oUJoQw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] allow ramoops to collect all kmesg_dump events
To:     Kees Cook <keescook@chromium.org>
Cc:     James Morris <jmorris@namei.org>, Sasha Levin <sashal@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>, anton@enomsg.org,
        ccross@android.com, Tony Luck <tony.luck@intel.com>,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> > pstore /mnt/console-ramoops-0 outputs only messages below the console
> > loglevel, and our console loglevel is set to 3 due to slowness of
> > serial console. Which means only errors and worse types of messages
> > are recorded. AFAIK, there is no way to have different log levels for
> > different consoles.
>
> Ah-ha! Okay, thanks. Please include this rationale in the v2 changelog.
> That makes perfect sense; I just didn't see it and maybe others will
> need the same clarity too. Thanks!

I will add this explanation to v2.

Thank you,
Pasha

>
> -Kees
>
> --
> Kees Cook
