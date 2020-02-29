Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A4EC3F2CD
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 00:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1EC9246AF
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 00:11:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="drg6vS1h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgB2ALM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Feb 2020 19:11:12 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38424 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgB2ALL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Feb 2020 19:11:11 -0500
Received: by mail-lf1-f68.google.com with SMTP id w22so2370717lfk.5
        for <devicetree@vger.kernel.org>; Fri, 28 Feb 2020 16:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=soF+XNnQcRWH9WEz1Qgu4eyaAJkJ/vm8FJWGg8joEIc=;
        b=drg6vS1hx18eHnCXRrGQ5GLjEMSfmRY2PzYoDE87GSE95WIYLG7hgVQOgKgWgEMx7c
         LOHkgLrdw3gkZ3Hk/eKZvKgsDNviOJBFj0KDVjzmy4tqsn1cSTTTArhz9NFzVmXYdsTH
         OkA3PEYdCXfvsW81Rl0F3v88UAMpEPZ+txtnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=soF+XNnQcRWH9WEz1Qgu4eyaAJkJ/vm8FJWGg8joEIc=;
        b=BnwRQhARzk4X+vEvYqZVQu1CycSJ4SbVFQ7GBNyEi1lMCl1FEKyLBJjZG1KuS8HEsD
         TUtlnJt6GXMMNrl/3wehDAE1qlWJVHkh5yU09i2qKF6QZaXEQ+4YvmyY7BNsEgKZekeC
         2lDC//ZoSBKR5V+ErnO9yJ4ARdTVYOBwCvXGNWlrhA+O+R4IgXABF0io6R8DRgJi2S2g
         4SVqiJGfnibBkaIjBfdaAhBMpKqFpqJwD2Oz6TcmfbtNiyq935DmXDRJJrNVchBYfqv8
         J/6LPQoXVGI7L6zmbqk+DtotXsInhBZKdg7hKJh+dDfCmbSIgRdRYLm9zHfDW0Va8Yvx
         P2ew==
X-Gm-Message-State: ANhLgQ1I7J73kXhb59Q5TiR0+BFde16395Az3urm1dXS535N8N20w8c1
        70zWLHb+t6ng9Bc5GTOwdhxWbX9gTuI=
X-Google-Smtp-Source: ADFU+vttefsRoutCcBEkjjNQML4p5Gsg9AifYnKVOJFlRr94xMuY3XShCwjGAM63mn3A/IwqSYI+5w==
X-Received: by 2002:ac2:5303:: with SMTP id c3mr4032985lfh.132.1582935069148;
        Fri, 28 Feb 2020 16:11:09 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id s2sm5991998lfd.67.2020.02.28.16.11.07
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 16:11:08 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id r19so5285683ljg.3
        for <devicetree@vger.kernel.org>; Fri, 28 Feb 2020 16:11:07 -0800 (PST)
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr4350118ljg.3.1582935067385;
 Fri, 28 Feb 2020 16:11:07 -0800 (PST)
MIME-Version: 1.0
References: <20200227105632.15041-1-sibis@codeaurora.org> <20200227105632.15041-8-sibis@codeaurora.org>
In-Reply-To: <20200227105632.15041-8-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 28 Feb 2020 16:10:30 -0800
X-Gmail-Original-Message-ID: <CAE=gft7=myM5gYLpuTA48BeUiwwN=Sk157LGAQ_nuz8fi=t0mg@mail.gmail.com>
Message-ID: <CAE=gft7=myM5gYLpuTA48BeUiwwN=Sk157LGAQ_nuz8fi=t0mg@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: sc7180: Add OSM L3 interconnect provider
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
> Add Operation State Manager (OSM) L3 interconnect provider on SC7180 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
