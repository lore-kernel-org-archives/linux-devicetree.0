Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD85C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 17:36:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67C8920691
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 17:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PjCLvAgU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgFKRgf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 13:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgFKRge (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 13:36:34 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C173C08C5C2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 10:36:33 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id p70so6106903oic.12
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jrCOk7vsq1IE7uGd57AzoLSP1ALvkvtrfTao0LV5h+4=;
        b=PjCLvAgUk17O5rGvaRSULcAXIKgAeNPYfQj4+nc/jEDzvDt79xSOJ9y90gnyDsej57
         d6kv8CTeKJDW3tgsSbIhUH7B684pz0QDJS1PAC3ELlVYxup3lQZTLhIejtwsgQQWCbBm
         whcIjLz3Q4YA0rJbpmM7ez8cXb5PsSzB5hLw90jsFbfweSA0DgsHHTj0a3UpXNkTiXsK
         FHCNP6NH+PXkniJe6PD0IrUkKYLC/AfJYgTbByfESpbB7Eh6RWa3w2B8JexkbcgtqPsr
         BKFM8ErfoR7rUDwZJTpr2FypGZPTKX734j7VFNPPb3SuZIWCuP8HJJ3I2VIKp5nax4vd
         X7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jrCOk7vsq1IE7uGd57AzoLSP1ALvkvtrfTao0LV5h+4=;
        b=o6m42QV3Pp6Vxw5KnrvMWUDZuVWn11GPno9Kzh7/kbBE3pAsMsheLcATprFmggqzF1
         KE7w2L0jxS0Am+nRwrFTfeK4Dmq1qFDvfEfp8kEayhimEo4eXCerNzGNhCpJoioywcAN
         /0GHzCZOxusr80XUqnx89bWfE9Wt4g5KwVP1xY7lleayoIouEf3ERGXYpp5xr0dyfRMj
         o6gv+rb9CO8BRKlYzQeG4Ndb07RiN346TP/dbw7GK2pBzs2razcJGTqvC1p7NRj2h//K
         LmIE45P4MMPvSeZ25wzvqWoKtFzkvT0Uk6p+KmVCNXjrP9BSBbz8p9PPsqPQl7jbiEVm
         Owwg==
X-Gm-Message-State: AOAM533WFtlrn0bGI1iCeSLRSc+eMCNl98Itujlfp4lAsUMwtaiY5Qpi
        KZGINHbtgfoIZ18w8oawYCDdbG0/ArcHJn3tkXGsTg==
X-Google-Smtp-Source: ABdhPJzBOdT+Dsmoz25Sk2BkH7lQgOo+1veTThTfIOcpemZoPqBRr3Bokq20sHjcYAD8NriytacdHguqDLTVuu4eLUw=
X-Received: by 2002:aca:2108:: with SMTP id 8mr7354040oiz.10.1591896992417;
 Thu, 11 Jun 2020 10:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 11 Jun 2020 10:36:21 -0700
Message-ID: <CALAqxLWnXD4XzGU=7mkLCyAkN1ONB=NRne9y8PxPWGZg4hgX8Q@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: request for display color blocks based on hw
 catalog entry
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>, hoegsberg@chromium.org,
        nganji@codeaurora.org, Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>, abhinavk@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 11, 2020 at 5:55 AM Krishna Manikandan
<mkrishn@codeaurora.org> wrote:
>
> From: Kalyan Thota <kalyan_t@codeaurora.org>
>
> Request for color processing blocks only if they are
> available in the display hw catalog and they are
> sufficient in number for the selection.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

Tested-by: John Stultz <john.stultz@linaro.org>

Thanks so much for the quick fix!
-john
