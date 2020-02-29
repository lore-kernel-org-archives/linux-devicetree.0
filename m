Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7E7C3F2D2
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 00:11:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46735246AE
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 00:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BA1m1yb8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgB2ALC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Feb 2020 19:11:02 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44190 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbgB2ALB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Feb 2020 19:11:01 -0500
Received: by mail-lj1-f196.google.com with SMTP id q8so5235277ljj.11
        for <devicetree@vger.kernel.org>; Fri, 28 Feb 2020 16:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fBJm70vbCm0LCgNvDsCCsjTJ9PBmdad0nZhpwK5OW30=;
        b=BA1m1yb8EjVa87IwqexlqG9YD5+1FxdNi0fybLqKTY1lr+JdaGhoGz1NnCbYNIuD70
         C97Mla/aSciSFJD84HLwuF8SH2rrgCGGGpmX7Sr76vnrhQw91k88N2suNg/2Qy6dsSBH
         wanttyosuVCvZi1KMU6VIIXDAxBgXsyUJKUQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fBJm70vbCm0LCgNvDsCCsjTJ9PBmdad0nZhpwK5OW30=;
        b=ZxmK5ViJrz/kVrOF1TjPfNABbjLUXp2T/FXJnU4TMiDljVQLWht822TgKGc0DT2Zbq
         /MdTOVKJs8v/Y9DhqOVLI4RnBuwuXHmByfUa283m4KjPXEoKI1e+hzbz+Fty6FjG7InJ
         qGP4b0ZiAbyuoCHB7XQdJFNOcUQhi3Y/f0Yem/BS1yCb9WzpSDdMHgCcUYbjyhWrzC2w
         cIKf5ECNOuxUntjQzhutSn36wQPCAjVipEiPIdNGk7z6wCml98qqJy2yV8tLQi+PvJLH
         a+3x88MK+lg0+oC+zxzNbGnCNTZMa3MHPKmcJ/OmQk4L7/hYSSH15Pkly+a9lUlh/UES
         f/gw==
X-Gm-Message-State: ANhLgQ0XnQlSUcj9savy9VsTNlXSoV96z6CIKgiLUWmJNtF4+rLztquF
        fI6J9k3dHgjukPhGW6kR3C7aabkmsQ4=
X-Google-Smtp-Source: ADFU+vspmrg/ZVeblY+2wrMHGqH1RtQoV7yFVHo8395dHThKINb8xrgDO5++wG5mqJsmvpYJ1VliTA==
X-Received: by 2002:a2e:b4cf:: with SMTP id r15mr4397260ljm.52.1582935058890;
        Fri, 28 Feb 2020 16:10:58 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id i4sm7751781lji.0.2020.02.28.16.10.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 16:10:57 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id z9so3406746lfa.2
        for <devicetree@vger.kernel.org>; Fri, 28 Feb 2020 16:10:56 -0800 (PST)
X-Received: by 2002:a19:691e:: with SMTP id e30mr3855069lfc.104.1582935056422;
 Fri, 28 Feb 2020 16:10:56 -0800 (PST)
MIME-Version: 1.0
References: <20200227105632.15041-1-sibis@codeaurora.org> <20200227105632.15041-6-sibis@codeaurora.org>
In-Reply-To: <20200227105632.15041-6-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 28 Feb 2020 16:10:20 -0800
X-Gmail-Original-Message-ID: <CAE=gft6bFOMaX_iCVogWjD2+8Hs3prBJi4GYA=KUPRK1M-ABgw@mail.gmail.com>
Message-ID: <CAE=gft6bFOMaX_iCVogWjD2+8Hs3prBJi4GYA=KUPRK1M-ABgw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] interconnect: qcom: Add OSM L3 support on SC7180
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Saravana Kannan <saravanak@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Odelu Kukatla <okukatla@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 27, 2020 at 2:57 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add Operating State Manager (OSM) L3 interconnect provider support on
> SC7180 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
