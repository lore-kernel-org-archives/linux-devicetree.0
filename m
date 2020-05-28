Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4165CC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 21:37:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A7722072D
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 21:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hQE6rkU9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436664AbgE1Vhy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 17:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436637AbgE1Vhv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 17:37:51 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 425E6C08C5C6
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 14:37:50 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id g34so71474uah.4
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6EBXP08UfA+20wnVaOt/Z0KcauZvdNBVCxlQRkCKiaE=;
        b=hQE6rkU9ZVc2K3wj2lHCfZ6PCW6mEVrt6pyiaSDGWcBIMcQg9CeU1m6QiV/RMjl/FO
         QW+xgDshAs1RIO/5kskBlpD5CGQInHMf4OK055PDNSV+BHB9yk9TxBI+8Xml915AGrxN
         CRVyAjb8Q9DR9q6ppylctJsVaX7mnSK1Ql2rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6EBXP08UfA+20wnVaOt/Z0KcauZvdNBVCxlQRkCKiaE=;
        b=Z314S4WVOH2Yr3Wd9YVJg/VrJLXAmy8AGLukhxzi9WNzYgQc9crXnQK+TSJ3yKKLQV
         8L22daUAtGgGBrYGwVzMZyD4m0jrhHCIGBC6Ei3vYLs4ocHyO6GAAjCKZ6IYP6lUhsKU
         01u7+BkGr7ZW0QWLYMbe+6QKm5jPfQvQFnbqkuEHQ7aV1Z396WVA3G4gfoRsn2PJJaGj
         E4U6IZcZt5aCxTV1lnPTgPgXmSO7yoRfvZVzXI5yS3OuGobaBKdab3lu5322Zggvz/p4
         VAWn8ogQkAG3B17QALMEFz2NFj35/2wa9LQ3Xp77kHs+gtAOMIsdPFnhksEkbifirv43
         paTA==
X-Gm-Message-State: AOAM532J4OkdORUkmRMYNXRm5jWR8rZdJVYU5ba76OUv0J3bIlJqc3xM
        Wu/Ejjn4DgfdrYEAy3MI9n3o76zQNn0=
X-Google-Smtp-Source: ABdhPJxhDO/WwOiUjh15tPVmkVqKdsFNCIk/DCKTFm5GFIIgjWdYzRL87XKq1oq8LUQxHKWG71neug==
X-Received: by 2002:ab0:6599:: with SMTP id v25mr3508015uam.87.1590701869311;
        Thu, 28 May 2020 14:37:49 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 21sm828142vkz.56.2020.05.28.14.37.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 14:37:48 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id z12so67646uap.6
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 14:37:48 -0700 (PDT)
X-Received: by 2002:ab0:1684:: with SMTP id e4mr3531314uaf.22.1590701867624;
 Thu, 28 May 2020 14:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200422090443.12529-1-harigovi@codeaurora.org> <158931520588.215346.14524550377627605126@swboyd.mtv.corp.google.com>
In-Reply-To: <158931520588.215346.14524550377627605126@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 May 2020 14:37:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLNuG7ZGN_yRe9zN3fahBKhevjkJDBTh7G4kozKvnDnQ@mail.gmail.com>
Message-ID: <CAD=FV=VLNuG7ZGN_yRe9zN3fahBKhevjkJDBTh7G4kozKvnDnQ@mail.gmail.com>
Subject: Re: [v1] drm/bridge: ensure bridge suspend happens during PM sleep
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>, nganji@codeaurora.org,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, May 12, 2020 at 1:26 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The subject is not specific enough. I'd expect it to be something like:
>
> drm/bridge: ti-sn65dsi86: ensure bridge suspend happens during PM sleep
>
> Quoting Harigovindan P (2020-04-22 02:04:43)
> > ti-sn65dsi86 bridge is enumerated as a runtime device.
> >
> > Adding sleep ops to force runtime_suspend when PM suspend is
> > requested on the device.
> >
> > This change needs to be taken along with the series:
> > https://patchwork.kernel.org/patch/11494309/
>
> Why? It doesn't seem like it should be required to go along with a qcom
> specific driver patch.
>
> >
> > Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> > ---
>
> Besides the subject:
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Are you planning to re-post with the changes Stephen requested?  Maybe
CC Sam too who was nice enough to help land some of my recent changes
to this driver.

-Doug
