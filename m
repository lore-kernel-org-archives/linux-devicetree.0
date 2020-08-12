Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63420C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 13:38:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DCC5207F7
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 13:38:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yDBDdIyN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgHLNiR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 09:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbgHLNiP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 09:38:15 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F98C06174A
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 06:38:14 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id t14so1978993wmi.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 06:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U6a+d3dtYp0KjTU5EEF1X/oH34jCVu+NBd+4qq9Ixtw=;
        b=yDBDdIyN79nLSMZt2ii6ECd0ccqcb4C9/zsl/VF4QcmYRhUqFZTNGn8S1O05yLbG8m
         ubDQCxhglZD3VIDoqHNTs9nrCaRyzEAwfy56sy+jta0zY4ozoKLFQi8y/RL6LbyXtsg7
         vPPzvQUdqo40z1n1oftLgNHQDjSWftJjjBDsQhvTEzJKLV/UljBn1O8TgzytjsFt9w8U
         TJcSCoUGsmpvlQAouUYl2WNa4NJG9STXIifpmKWhao4D+DxMBSRLDd4A1cuJ2pp1KVzb
         6SjO2F73k6YQ1HGycCizuxtmTBUcGfkSqURV3MFuAbgx20pDncLVyrW2c/POdaOxoRFd
         /XpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U6a+d3dtYp0KjTU5EEF1X/oH34jCVu+NBd+4qq9Ixtw=;
        b=radLQuZoRd6z0xKjRGulLPgL9JrtwjKSpPZ3rkHQiqs4leku5JhZUinAXtbR9cvzWI
         8hGhGHJoa9S7TqJW4y1EmS15PMx8kE22zCzyCTxqC+/Sjl6HB32R81gycMkP75yMGJZK
         bGfPGNoS9CfSwz/LPfP+2tcEXfzf3c3FxxP5gfS72zRkrzvyX1zdrNOQWvG797H8AI6F
         xqaOFq44NWL/3+ebshzWC4/abR6ls8GaWu45zU8Ct1/ML1TvBh6KnNoBX/qJeLMBTy4k
         SLZdPU5CoRn3GSZUoYu/Z5spHEcqOLweTMkqi7hYVu9vNKKlzzHVdKB/mU1WYnFf9nK+
         xJOg==
X-Gm-Message-State: AOAM533ZeNscsef1VuxKiQFddr716fPr+oJhrqXxDdhoheO/AX3feHyX
        sC8kXsTdVTF6mAH3z0yr5RS6TlS7/hrBuE/IJ6fOdg==
X-Google-Smtp-Source: ABdhPJwqMh6ofIFWi0PgnalLBz97O6pS4TLZaTLUZpUxWvbz7fQU77ZzO8rJnHikMk86N01F3K2+jUdwRSWt3HpDtNI=
X-Received: by 2002:a1c:3dd6:: with SMTP id k205mr8592936wma.21.1597239491828;
 Wed, 12 Aug 2020 06:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAMi1Hd3Dv_T7kgThLTk2QLtfS7LBvhJ5R=6C3seUYK0GvNV6eA@mail.gmail.com>
 <20200806223134.42748-1-konradybcio@gmail.com>
In-Reply-To: <20200806223134.42748-1-konradybcio@gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Wed, 12 Aug 2020 19:07:35 +0530
Message-ID: <CAMi1Hd2P47PWjnRaACE9oyxRpZZwFwTamwCCxufN6qW+8SKFrA@mail.gmail.com>
Subject: Re:
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dt <devicetree@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 7 Aug 2020 at 04:02, Konrad Dybcio <konradybcio@gmail.com> wrote:
>
> Subject: Re: [PATCH v4] arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)
>
> >// This removed_region is needed to boot the device
> >               // TODO: Find out the user of this reserved memory
> >               removed_region: memory@88f00000 {
>
> This region seems to belong to the Trust Zone. When Linux tries to access it, TZ bites and shuts the device down.

That is totally possible. Plus it falls right in between TZ and QSEE
reserved-memory regions. However, I do not find any credible source
of information which can confirm this. So I'm hesitant to update the
TODO item in the above comment.

>
> Konrad
