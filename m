Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D11C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 17:28:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 848EB20657
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 17:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gpu1742R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389511AbgHQR2K (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 13:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389352AbgHQRMk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 13:12:40 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6472C061389
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 10:12:39 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id l2so15720599wrc.7
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 10:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AueLUpVNwOplEaRIeklXnlMpQk/hv9PNTq+/4iLo0R0=;
        b=Gpu1742R6bQKiE7BaePK5diMLvF+iZfSSkZ0BOARPwt42lhi8nz00uW6K89/MGg4zm
         hZXZDUrk/4N+XUcR0wbbQo713rcnKWaOX9p4s60ZhAx89+KzEZhhA4saULYqOxNRGYdx
         hUyQy65h8Dy4+B9yFynN1Kh1R/12oHa6Gs3j4u3Q4o3r9uQOP6RgH+35nG01K9CZdK68
         rzoGzIXjOR9WHXTKTHVQO9vD4+jdCw3iMYQLPoCTJcpW+4tvowsYeLvIo21HjWRa2vmV
         04Cx09aiVDy2hFLu9lZ+jRZdQNHnPp6FILixg0q9oSK7M9y8md8BFE7vFrK7eGa8X8yl
         WMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AueLUpVNwOplEaRIeklXnlMpQk/hv9PNTq+/4iLo0R0=;
        b=gZudH98jnn1Ib8Xu3MKVUwvSy4dK8WGfjPlpgE+vTFWFWTVCg7RESCXPB8Wi8H21D9
         J9ifLPJnM5NfQvXS/YISa9Yic2LKeKnCNP7bOeK39PH8nL8vNJ4YIJ+kXi8Z5FiPm2UL
         IY0oJ2jftvuSDCtKmCy6tj7oAcUWlrcN33ksDx4yF5er31Dts5Qhwdzrc8rByu0v9L2N
         niCkM3IsCA+iFCclQyvU1IXDxen1w1noqb8CPx8F5K7iMIy/bVnQwiEnaPbWtdy+0VNH
         ol4ntWvbM9Jgv+ayiP7Bnil6d4FJP+91pAL3QfxC4Lvy3PKzRInefdOL1vKt6gtliMlN
         nZmQ==
X-Gm-Message-State: AOAM533lryh/g+9TmbQ5z8Mi0ofVAr2caP046pctWzQv2RlzsN173tMW
        atWZ0kItdPLjY7AZw9cnvy0anKLAqP5wGzWTQC9JdQ==
X-Google-Smtp-Source: ABdhPJwzzJqqKP8Dz57WEH4mjrx29gWDTGQSyhqQk/3EQMn3h+P+wfHkvWUG7jnjma/rWD/FdEgspqJzfrhXMf85F+M=
X-Received: by 2002:adf:fc06:: with SMTP id i6mr16257949wrr.79.1597684357045;
 Mon, 17 Aug 2020 10:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAMi1Hd3Dv_T7kgThLTk2QLtfS7LBvhJ5R=6C3seUYK0GvNV6eA@mail.gmail.com>
 <20200806223134.42748-1-konradybcio@gmail.com> <20200813070448.GA499758@builder.lan>
In-Reply-To: <20200813070448.GA499758@builder.lan>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Mon, 17 Aug 2020 22:42:00 +0530
Message-ID: <CAMi1Hd3j-A1Se9swD0TQ9YzTBGicPDc1nFZbf4uisVk5A+u1GQ@mail.gmail.com>
Subject: Re: your mail
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
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

On Thu, 13 Aug 2020 at 12:38, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 06 Aug 15:31 PDT 2020, Konrad Dybcio wrote:
>
> > Subject: Re: [PATCH v4] arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)
> >
> > >// This removed_region is needed to boot the device
> > >               // TODO: Find out the user of this reserved memory
> > >               removed_region: memory@88f00000 {
> >
> > This region seems to belong to the Trust Zone. When Linux tries to access it, TZ bites and shuts the device down.
> >
>
> This is in line with what the documentation indicates and then it would
> be better to just bump &tz_mem to a size of 0x4900000.

Hi, so just to be sure that I got this right, you want me to extend
&tz_mem to the size of 0x4900000 from the default size of 0x2D00000 by
including this downstream &removed_region (of size 0x1A00000) +
previously unreserved downstream memory region (of size 0x200000), to
align with the starting address of &qseecom_mem?

I just gave this &tz_mem change a spin and I do not see any obvious
regression in my limited smoke testing (Boots AOSP to UI with
v5.9-rc1. Touch/BT/WiFi works) so far, with 20+ out-of-tree patches.

Regards,
Amit Pundir

>
> Regards,
> Bjorn
