Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160DCC3F2D2
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 00:11:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0D11246AE
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 00:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D2R/m89r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgB2ALJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Feb 2020 19:11:09 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37263 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgB2ALI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Feb 2020 19:11:08 -0500
Received: by mail-lj1-f193.google.com with SMTP id q23so5290055ljm.4
        for <devicetree@vger.kernel.org>; Fri, 28 Feb 2020 16:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wJ2G0YZDBOYXpJWKorsJb22qVg865pSK3S5BA357pVU=;
        b=D2R/m89rmjQl6qPgxblXu/R6YGXFPUV+572xaAsecqEToxOlSOUoJUDxyHOfT0nXVM
         8+F8oUY2dvpU8minzX/Re6oqcR+ufYai6mftEnCgKmEZcFV0IFHLIcdZYUZeR3zw8Ucm
         jZZBqI9ujjn8AmjaKP3csW6n9NRrwoUTa5Qoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wJ2G0YZDBOYXpJWKorsJb22qVg865pSK3S5BA357pVU=;
        b=iMehk32T8mahp419Bq3a+v4glwj4k0JTwCTaVuyoK0vkkVvAU+yXqg4qeema1BVZ+d
         thb0rmaTcZZvO2wsDi/iWXu5/pMSJuNOsMLQnLO97uJYVFaBQkXbx65pr3r2DMTL0lYo
         BQVBvJZS8doPvjlU5MbCs5x3Yd3BP2DIVZtmYPeYSoi87cqPMMFQtFtxAVPwByGwUF52
         RXF0sr+M100d1kNW5qvaeCk0K+Mk9Q9fwq1DsB1qj4dryik/Wy+eA4uWFsHMJp8vz8Tl
         Ey/qhZDAntgt1A4r33JlinOEFtvd+wAQOCFFng8ObdP6L4KZWI9LmAIbDa0mRIMD4Q9Q
         O0yg==
X-Gm-Message-State: ANhLgQ0YQ1ing5tk/GzAM4b3y0dzJnCV0sQ4Gi/1v2LG9zXrgl1tlwhF
        BzMV9uS9+DMGPHsG/P+8/mJpi0fibaU=
X-Google-Smtp-Source: ADFU+vuWb3dJHz5FSMUKAJGQf+wEZGewK32XP0DPUuEIlaKiHp0JFJ4Or7jT2s+zPXQW6Z+eKf9ivA==
X-Received: by 2002:a2e:3619:: with SMTP id d25mr4277968lja.231.1582935066078;
        Fri, 28 Feb 2020 16:11:06 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id v15sm5955415lfg.51.2020.02.28.16.11.04
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 16:11:05 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id o15so5255222ljg.6
        for <devicetree@vger.kernel.org>; Fri, 28 Feb 2020 16:11:04 -0800 (PST)
X-Received: by 2002:a2e:b4a4:: with SMTP id q4mr4387327ljm.208.1582935063547;
 Fri, 28 Feb 2020 16:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20200227105632.15041-1-sibis@codeaurora.org> <20200227105632.15041-7-sibis@codeaurora.org>
In-Reply-To: <20200227105632.15041-7-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 28 Feb 2020 16:10:26 -0800
X-Gmail-Original-Message-ID: <CAE=gft66VUxk8QYsmHUy9H6zb5EE88n0Y+Wm5f953KgzxATonA@mail.gmail.com>
Message-ID: <CAE=gft66VUxk8QYsmHUy9H6zb5EE88n0Y+Wm5f953KgzxATonA@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] arm64: dts: qcom: sdm845: Add OSM L3 interconnect provider
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
> Add Operation State Manager (OSM) L3 interconnect provider on SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
