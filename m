Return-Path: <SRS0=vtFV=5K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0689C1975A
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Mar 2020 16:04:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C0EF520772
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Mar 2020 16:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NgTT4k5j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbgCYQEN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 25 Mar 2020 12:04:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39600 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbgCYQEN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 25 Mar 2020 12:04:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id i20so3056966ljn.6
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2020 09:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pn2KqvNFk/Kh/oN0XHQ6BHDkBBBhQ3u1DOedSWlNkfQ=;
        b=NgTT4k5jlKQgS4xPUfrNeL4uN7tSr+FEjGTa0+opI2N8PJO6UtRhuIb/sfAji0iY5E
         rpYPeEVdAQ+nQvJJF5LweKq2TJ1MRLDae7RaM6LxnVdeeulKZjz1ZsvXv8uVrZ1V3THB
         uSYPP1p5vjzUNLwlKM728XMoTGFMLF7FmKOv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pn2KqvNFk/Kh/oN0XHQ6BHDkBBBhQ3u1DOedSWlNkfQ=;
        b=mo0An+8msynbO7hteA2Z7oj9dLaQZhVlLMyJRA+BUE6rXd1KVFqIokCfMSALLhD1ct
         8N84YyO+SLLLvWDI5fNSz3UAjw+MNQYmhZDvTiJytARdum5ropUvsFlcwhjsWxRMoxB4
         EqJcXXIEv/5UZtm44keVCV7VqPQeI5NQyXDvXh5o2IGZk0NIPYEfipwBj/BtvwcEuntn
         +33xLbY5lxpXqzCj+uF1N4XZ099BS25BN4cLycsrv2+kK8EQcX2z5oELp0cs4hfubpwA
         BX+7sS7JIhRu/ssD0gVZHwKNrfsalvbW/A4bp9gxhBycLM5aRVhUI9K4hTL9HLdrvQFY
         YYlQ==
X-Gm-Message-State: AGi0PuYMnnFNlqh7nwATk8wfFL9YIDz0rhEnrY9HMBq1e3/OC7W+eMMx
        psd6tg1lU4DpHMmVbk2ea189IMOia7c=
X-Google-Smtp-Source: APiQypLkYqYxl/ipY10MyrRanEWWmmF/KZBlH5K6j0hZuVC2gK3WjC57y7HpV3rMuPjQXA87u5h1wQ==
X-Received: by 2002:a2e:8109:: with SMTP id d9mr1968914ljg.31.1585152249102;
        Wed, 25 Mar 2020 09:04:09 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id f26sm2350743lfc.76.2020.03.25.09.04.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 09:04:08 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id g27so3016321ljn.10
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2020 09:04:08 -0700 (PDT)
X-Received: by 2002:a2e:9216:: with SMTP id k22mr2471412ljg.278.1585152247655;
 Wed, 25 Mar 2020 09:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <1580822300-4491-1-git-send-email-pillair@codeaurora.org>
 <CAE=gft7EOALEMUWzoR3+pjoxCUTYWbiXoXY=dXH1BDhS3KwBzg@mail.gmail.com> <000901d60295$3acc79b0$b0656d10$@codeaurora.org>
In-Reply-To: <000901d60295$3acc79b0$b0656d10$@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 25 Mar 2020 09:03:31 -0700
X-Gmail-Original-Message-ID: <CAE=gft7zqbUnx+BULDD+35z2p1=545=jF0=n6kFXZgo3ZTdCHQ@mail.gmail.com>
Message-ID: <CAE=gft7zqbUnx+BULDD+35z2p1=545=jF0=n6kFXZgo3ZTdCHQ@mail.gmail.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
To:     pillair@codeaurora.org
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Mar 25, 2020 at 4:05 AM <pillair@codeaurora.org> wrote:
>
> Hi Evan,
>
> I will send out a v7 for this patchset.
> Since I have to configure the S2 SIDs, it is dependent on below ath10k patchset.
> https://patchwork.kernel.org/project/linux-wireless/list/?series=261367

Ah, right. Thanks for the info, I'll check out that series as well.
-Evan
