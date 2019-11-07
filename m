Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202EFC43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 17:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E80432166E
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 17:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TzkUMsHf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389434AbfKGRyw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 12:54:52 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39952 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730799AbfKGRyw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 12:54:52 -0500
Received: by mail-pl1-f194.google.com with SMTP id e3so2000548plt.7
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 09:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=6n3o5+JOCVKLO8hHkLjsEkjuqiaK3IiXNN/Cf3cZ2IY=;
        b=TzkUMsHfydzu4SypLTCWeCrneyVNJ1wxVaQV/RBifHHe/SItQXYDGGwDWl5WNCyQeh
         4tW5bUU5CG8Q6AEnVd6HtB5QOLZZDIJYeoL1loQGUm7g2gst9EY0bzBhEtUDjS1wVK91
         lW8Fi21Xi15D3bfct2FgSsEDnxmp9osL2x4BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=6n3o5+JOCVKLO8hHkLjsEkjuqiaK3IiXNN/Cf3cZ2IY=;
        b=ZpWDfAQWOmI0f8gaRor6effZagS8qHF4/UTqJQkHr84QMS0t8MGGVGCfPEJd1FyCrQ
         iSggI6OvScLcIjzHRnGUB6jzb7azEbCkTE7KDzqts6t5SPf2y3JLzazHAktf9Pu8D+jr
         BeqT6GxDLxPGAFipjZR06vijmrgrMy0b5lo5rBpOyunDJzicVHPHOqnYvigsLObFmLha
         0Qc2mhmq8StiUq7c4UTEtieg2wY+qwRozXPeJozO8EIf95dsojYgyIwoYD5screCpHjA
         oFnRstQgTmwizwXmSKhrLkCdDAvV3FfdqsMsJES1m2KD2jS9Cx/A8lYrLJrzufEoMybV
         QyVQ==
X-Gm-Message-State: APjAAAU6+MzyPqSBh+SmoDzz/Ni7qndTmUqACqIcnch98azZoKYi4oiC
        CX1EFDv3bnxQ0SAes9SRwUCOFg==
X-Google-Smtp-Source: APXvYqzTXBrRZGyIzbAN9SNYwElgXMzMY1DfyZuzzmgKZjy60pLIhia1ZoLOO63kaie+gIKLbD+MzQ==
X-Received: by 2002:a17:90a:d152:: with SMTP id t18mr6795829pjw.119.1573149291566;
        Thu, 07 Nov 2019 09:54:51 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id n21sm1295810pjq.13.2019.11.07.09.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 09:54:50 -0800 (PST)
Message-ID: <5dc45a6a.1c69fb81.bbfed.2d61@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-11-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-11-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 10/14] arm64: dts: qcom: sc7180: Add SPMI PMIC arbiter device
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 09:54:50 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:13)
> From: Kiran Gunda <kgunda@codeaurora.org>
>=20
> Add SPMI PMIC arbiter device to communicate with PMICs
> attached to SPMI bus.
>=20
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

