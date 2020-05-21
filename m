Return-Path: <SRS0=MDPI=7D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B654C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 16:20:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5E2420748
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 16:20:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UUK/8ULW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729561AbgEUQU0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 May 2020 12:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgEUQUY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 May 2020 12:20:24 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCA0C061A0E
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 09:20:24 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id k5so8965087lji.11
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 09:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KhSteGsD4RiqQuK5YmLBZC6UpLmDwoaKdLBagEsgYl4=;
        b=UUK/8ULWjMB2mBygCKclhU6LqqpSWv9z30+t+BDLxfb3VTXARp03TokADV8sjD+Rm3
         OFL0u+IlZG9t7sz8xdVVkBlMtP35b0P9vK22Ys0vOVkK66J0NVlx301AHSdzgwFINPFm
         A8cTPxfFHhEdOwPW+3RdCzCQfr98gE40Qk7QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KhSteGsD4RiqQuK5YmLBZC6UpLmDwoaKdLBagEsgYl4=;
        b=Q6H1bYkCAjOf1alkRG7i+8rjaoENQkS2CtdCStO9LmA/UCLrkfW0GWNC1P5haT/mR2
         h2D5snp38Pt1SUSobRLduo+1TTz70lx95X28BfSniRmGkkLECm8gacEfm30lk81CEwHd
         UMd0+Nzs9C0HnJGm1Ve8zdgh1x/I3jARcand6+oXyIEB5ULcV3J5TLl7w8ZwVkwPryW/
         LnWQO0FOjQ0lYPQyl2Dt0T9kHi5xcLpd+r5ruGBbMfsRJOy6Cl+pmdyLsH0netabreLD
         4jlNp0LhegU8zzuWpY4nAoq3Vuk6ZjW7Qxh1yeBekSMZ3KXOMNpQaTJ6tD7puVJuIusl
         a/qQ==
X-Gm-Message-State: AOAM5322k84vm/i/byNTbipqGmDyNhqik6Gu806FYNvfuXbjvr7800zq
        I50h9VrIzp1Ede/E1UmEAlXrz/1C4I0=
X-Google-Smtp-Source: ABdhPJwxUb//b+2Bsakd5Kh+0uPuZae0u/qmBAfJjyu2Gf65BXhFc+oJt/OVbJlh+HuPEcjuLKnvwg==
X-Received: by 2002:a2e:9248:: with SMTP id v8mr3248636ljg.413.1590078022244;
        Thu, 21 May 2020 09:20:22 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id m13sm1880706lfk.12.2020.05.21.09.20.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 09:20:21 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id o14so9032034ljp.4
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 09:20:21 -0700 (PDT)
X-Received: by 2002:a2e:8018:: with SMTP id j24mr5189945ljg.99.1590078020706;
 Thu, 21 May 2020 09:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <1589946996-31264-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1589946996-31264-1-git-send-email-pillair@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 21 May 2020 09:19:43 -0700
X-Gmail-Original-Message-ID: <CAE=gft5pcHwK8yjObNSSH=U_B6Pz++bDaeUxZhPyJfG2E7LRAg@mail.gmail.com>
Message-ID: <CAE=gft5pcHwK8yjObNSSH=U_B6Pz++bDaeUxZhPyJfG2E7LRAg@mail.gmail.com>
Subject: Re: [PATCH v11] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
To:     Rakesh Pillai <pillair@codeaurora.org>
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

On Tue, May 19, 2020 at 8:57 PM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on sc7180 soc.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
