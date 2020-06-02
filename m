Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F33C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 18:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1A872068D
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 18:17:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V4aE8O7t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgFBSRu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 14:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgFBSRt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 14:17:49 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFD6C08C5C1
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 11:17:49 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id n5so1235341ybo.7
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XO5zhh03cD8xcnE7YG3/0qATRVY10NIoznHjKKdiQLs=;
        b=V4aE8O7tPeCEWTFG/9ZitIb9tWUY1xODTnLRXthXMlQuWF4vL6wU7lZD81h+JJoCR0
         xvhR24EB0sZ5I7AlSx7VyNCoqZDsL46wfYL6wCpVUtOBKqmm5nNhckZe+kfFQ1R3122+
         LcuE0rlS77CWnyIrOEQuEOuZra71juQIswQoGVIWhjlZuZRW77tykBwtPjqG6Hz/YVA+
         lAAgVXsY3zxAtNDpi4PUaTr6HUtWW/aeF7TBfdSgdKk+uvQK8BDWz5I+7gy3e47J31fG
         43aQOmgnp0UkUSMqrwqWvrzwrCkGaqGji+Ww0ZoQmSdxM72ORfbur61zlloqo6hR4NGy
         +U5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XO5zhh03cD8xcnE7YG3/0qATRVY10NIoznHjKKdiQLs=;
        b=s7QFNFdjyuVn9hJ7/ODjvROsrfViCIGCiN9f3vaum4IBLJ3+y6MxvKH+yojQWXnrUd
         I/A+7wcYwcBB8EW3HMjrIRzD7ARbxacK+8ojcX6ifZoyDX/OAlpAO/HMLqPWIqxBd5cy
         BfeKSNFzua2AyDuS35vdEzsetfEmFIzJTl9tlRa6fpKYaMTAnk6BKuf1+CMlmC0q5stY
         8DVOeENHyNVLjPWIn72T+1BOX0JSZdhbtRVCn8hzu0Dcxs61QcBRYBmV5/gSh23d4MrK
         eXYuYPSEJRWpN+6Z6jkGKdqC9gutYl5KMV5s7XgWnVeeVeN6Pgo7cY7AbEcKoJesO9la
         NHmQ==
X-Gm-Message-State: AOAM533ZHXgF5lzIv6PjuA6p8Aq92nNGO5yxs1aiQhaWyJO9tRirBH9Y
        WLiSh66PmkffKRQeSMPS3Kt/Dt+q9mz1mCB2bfgYJw==
X-Google-Smtp-Source: ABdhPJyvUcQzaoxP9Z7+NA0ayq3zt+AYQ/qtQiBSju3DDjPhcIvQogWwu9LOqruUSOLERNvMmPwP1B1X9R/Yr5Hmyvw=
X-Received: by 2002:a25:9ac4:: with SMTP id t4mr20795775ybo.356.1591121868222;
 Tue, 02 Jun 2020 11:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200529030012.254592-1-jnchase@google.com> <20200529030012.254592-3-jnchase@google.com>
 <CALTkaQ2OR+bc2QGeucA5aP3SiM5HLnx5=DoZQ51E_1d99Hb5Uw@mail.gmail.com>
 <CALTkaQ0NLgjS7H7De=7jy9jRG1xMFSbzdmxrFNerNU+o1rRzpg@mail.gmail.com> <d7e759d1-9bdf-0ab3-143a-f0e374667f04@xs4all.nl>
In-Reply-To: <d7e759d1-9bdf-0ab3-143a-f0e374667f04@xs4all.nl>
From:   Jeff Chase <jnchase@google.com>
Date:   Tue, 2 Jun 2020 14:17:36 -0400
Message-ID: <CALTkaQ3mq0iEPqSt92HVVkePRsUnuB2H=OZyp3O01jBSz=86_A@mail.gmail.com>
Subject: Re: Fwd: [PATCH v3 2/2] media: cec: i2c: ch7322: Add ch7322 CEC
 controller driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> > I haven't looked into the cec notifier mechanism yet but would it be
> > better to try to use that instead if possible and just ignore this
> > device's physical address detection? Then I could do more of a proper
> > reset in this enable op. But I'm not sure if I can properly associate
> > the device with an HDMI port on my platform unless I make some changes
> > to coreboot.
>
> I don't think this is useful: it's nice to have the CEC adapter do the
> physical address detection.
>
> One question about that though: if there is no physical address, can this
> driver still transmit CEC messages? Specifically Image View On. This is
> important to wake up displays that pull down the HPD when in standby.

Yes it can. I just verified this with the kwikwai analyzer.

Thanks,
Jeff
