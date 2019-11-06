Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98492C5DF63
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 19:11:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 675662187F
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 19:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E/P1CSJd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731769AbfKFTLe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 14:11:34 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42017 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730487AbfKFTLe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 14:11:34 -0500
Received: by mail-pl1-f196.google.com with SMTP id j12so9933585plt.9
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 11:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=YlU+OdXhIDKR9PfiNtBOmR4FsFlmFK64CTpMfZrq0VY=;
        b=E/P1CSJdk2lLsncbqPfDsdBx4I9NOufECjSiBJC3YmzB2mz5Yl9JXuNp0/3T3p6Qp5
         RIUD/n4denMRlG+BEjCyFRKWgPKQRQLhqC6nfhtMsWhnmetQ9oyRzufviMqaCb0ni2Gh
         Go3wWa12aWExYewJLEb/kZE3i2r8d0jrI+OZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=YlU+OdXhIDKR9PfiNtBOmR4FsFlmFK64CTpMfZrq0VY=;
        b=G7SbAEFKpkwF6qc419x0gb0gvYcROvJO/EL+9TQYRuyQOaZmJYp1vGrY1ef9jBXF86
         Hz4WafpwCnkpATPaba1PAL7Oyzoo/X+fAnBh2B9QJujsz0sdhiL21LFQcr9k0YZ1BzWM
         a1XDIoc1BwEOccHGL/YVloSJDhTWrXkoi0ldd/c57P2QDrG0C3bdFW69hvadayY3o+lW
         2oNHhBwl5xJDfkwF1clWizPsb1/2tZkZ1LE9lZ9ti990t2+1+3A/8zI0efFKBBhsHBkK
         FKlEx+EqWTABi3LMvxIe4smhn/6WSI1gYENUXX6YEEIC6WocDzWH6M/x4u5mVZOpRHep
         o27g==
X-Gm-Message-State: APjAAAW+EP/YHPRw3EMBJWj7AoqVJryT+S0kFT5KzZHNLUguy3T61BJS
        wmy2kVKpRM/qK4+mXLlvRFU7Uw==
X-Google-Smtp-Source: APXvYqxZvLIwgE1Gk+D3mymUUFiEatllcgMoJq/0gW6A92R+2Jee9wMM3IxWeYZ4gYl8FQ35QpbH+g==
X-Received: by 2002:a17:902:aa02:: with SMTP id be2mr4333753plb.326.1573067491450;
        Wed, 06 Nov 2019 11:11:31 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f35sm3739655pje.32.2019.11.06.11.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 11:11:30 -0800 (PST)
Message-ID: <5dc31ae2.1c69fb81.a3cd7.b5cd@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-10-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-10-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 09/14] arm64: dts: qcom: sc7180: Add pdc interrupt controller
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 11:11:29 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:12)
> From: Maulik Shah <mkshah@codeaurora.org>
>=20
> Add pdc interrupt controller for sc7180
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

