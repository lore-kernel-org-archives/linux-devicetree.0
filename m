Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA4FC433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:46:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D774B21548
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:46:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XDyZS+++"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgFQWpz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 18:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbgFQWpy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 18:45:54 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6170FC0613ED
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 15:45:54 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id g139so1502143lfd.10
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 15:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yawPnxDk49botwMdb+iaW6FZN+F8UQyFiiskYiOSfeQ=;
        b=XDyZS+++Zkn6BIBUSi9kkFoJ/8TqtbS8h/v3gA9xSe3Ij7PK8at9hy2SlW/d1Jfo6o
         7eNj2kG5JhYecfrqlAgHCWpgrSHi8DGUbTKdHWVoVf7ojfbVlbjRIAT7t4jjxX49kfTo
         BkeSsnuxB03xXOKCVfjEVFSMvjQrIdu1Q1qV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yawPnxDk49botwMdb+iaW6FZN+F8UQyFiiskYiOSfeQ=;
        b=e00TicKb4T1Kb5rb2YgsoKG1lOlXe05MB/UnAzGkKua77O4TBF/UjNukZOurFnNwjY
         wK3wA4XtY0zymwXW63yVsrYmwt+LCSuLBgC3d0G2yvINPchRtYxLKkY83XSyIaU6QcFJ
         FQe0Vjrv0FUV0beP/0I0UR7vj3MLg6auXhayHSpKusNZoZbEnV8lt5fuREQQBviCeRGb
         8LEAH108vTAWM+RPaN35b4pjNTWoe2pbYg1MLDsNsEHfsvm7+gN7Qmwdg1ho3nWUICqv
         iqyBVAiI/DTBWvrPXqc7vM1NaBsIUblgtpdbvbFg7KrDxAEeEb2ZU03z4IbL2fEC9lU5
         8vyA==
X-Gm-Message-State: AOAM532a7m0MZvoxQ+KW7bgIUxjIviwVtL48HfsSLDtNGof/67hQdRFr
        u8Kltax8lvreH25Xe5m/8PusuFPxuLE=
X-Google-Smtp-Source: ABdhPJxSB/dZZXgHHzHRqsbHqParny2rhIjQ6gXuxgELGwGizNGNBkKn9uvKG/IDkfUz6mi7iN8YFg==
X-Received: by 2002:a05:6512:60b:: with SMTP id b11mr640889lfe.116.1592433952279;
        Wed, 17 Jun 2020 15:45:52 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id o16sm255055ljg.90.2020.06.17.15.45.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 15:45:51 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id x18so4914758lji.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 15:45:51 -0700 (PDT)
X-Received: by 2002:a05:651c:1181:: with SMTP id w1mr707524ljo.432.1592433950682;
 Wed, 17 Jun 2020 15:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <1589946996-31264-1-git-send-email-pillair@codeaurora.org> <CAE=gft5pcHwK8yjObNSSH=U_B6Pz++bDaeUxZhPyJfG2E7LRAg@mail.gmail.com>
In-Reply-To: <CAE=gft5pcHwK8yjObNSSH=U_B6Pz++bDaeUxZhPyJfG2E7LRAg@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 17 Jun 2020 15:45:14 -0700
X-Gmail-Original-Message-ID: <CAE=gft5So9Uk2UqRWs2zFO_iD+6ofMy97bKP4HpgM1Wu6Duxvw@mail.gmail.com>
Message-ID: <CAE=gft5So9Uk2UqRWs2zFO_iD+6ofMy97bKP4HpgM1Wu6Duxvw@mail.gmail.com>
Subject: Re: [PATCH v11] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
To:     Rakesh Pillai <pillair@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Thu, May 21, 2020 at 9:19 AM Evan Green <evgreen@chromium.org> wrote:
>
> On Tue, May 19, 2020 at 8:57 PM Rakesh Pillai <pillair@codeaurora.org> wrote:
> >
> > Add device node for the ath10k SNOC platform driver probe
> > and add resources required for WCN3990 on sc7180 soc.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
>
> Reviewed-by: Evan Green <evgreen@chromium.org>

Looks like this never landed anywhere. Is it blocked on something?
-Evan
