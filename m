Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B41C5DF60
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 17:47:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAE5020869
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 17:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nbCvU/0v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389608AbfKGRrI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 12:47:08 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37479 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730769AbfKGRrH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 12:47:07 -0500
Received: by mail-pl1-f195.google.com with SMTP id p13so1999326pll.4
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 09:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=A7C9nVWoqw2fCjix+RUHcJ/eKACVMV7OHWjEbohU/GE=;
        b=nbCvU/0vsQlCsJtreSa5tAxqXZb9eqFw3OHc//Wxc3I1fbj7PbXJjwjtLZuVLExqb6
         FvVIonVu/SCwdSgbJQC/P4ptX3HLQBQFcVVduEBmETL6O4RQY1x1VP35ckLizm3osN91
         x0gKl14M13trxmf4ZPz6MKLAMXJqONkHp3dw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=A7C9nVWoqw2fCjix+RUHcJ/eKACVMV7OHWjEbohU/GE=;
        b=Kke+uTS816i2SQDz/ZIiSmid4j570ZM94gPwEjzYmSti3kqciV53ULiMbAK7hVEvPD
         izz92m66tV6OoX7eLQUwHEyy5wGdSC4aKHakLPrEnjlZKhitmIPORabkwyL4MT4G6rrD
         amEeVhsew1cIzi8oX7tN7Opwe9vmO1KOnrDnjEZ/kPi5fvuptagrtJ6kcSRKKZ8SlLTZ
         KS6wS7cduRvbUxYn0mlIwOdTtBJZ+Gfe4xD5Zuoy1+8CkPWevO4un+cYtDisZELN7Xx0
         +Mr0zWmR3MPmmpcqCPiWu1mOzVcrTxP5dgbPan+afusnTOUooj98l8XLLHtWCxQInU29
         KOFQ==
X-Gm-Message-State: APjAAAWS/c2ecWZQuoyMwZ9yz3rgISTT0PbuCb1IQ237NX/mJSLCfKg4
        DmLUXZeE8zKaUqIcmc135HwmlQ==
X-Google-Smtp-Source: APXvYqzjUMjRSghQq7WVhSh6oycWsvdJOoNe8Z0d2BQhXaaagbJ6/VCFELKa3s/V96a2q64CTcfk4g==
X-Received: by 2002:a17:90a:850c:: with SMTP id l12mr6981004pjn.16.1573148827187;
        Thu, 07 Nov 2019 09:47:07 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s23sm3257366pgh.21.2019.11.07.09.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 09:47:06 -0800 (PST)
Message-ID: <5dc4589a.1c69fb81.a0cd0.85b7@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-4-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-4-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 03/14] dt-bindings: arm-smmu: update binding for qcom sc7180 SoC
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        Mark Rutland <mark.rutland@arm.com>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 09:47:05 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:06)
> Add the soc specific compatible for sc7180 smmu-500
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

