Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B15FC6195
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 17:48:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72C1021882
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 17:48:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JxzLMpoa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389827AbfKGRr7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 12:47:59 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41155 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389815AbfKGRr5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 12:47:57 -0500
Received: by mail-pl1-f194.google.com with SMTP id d29so1980240plj.8
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 09:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=O9s+SAq5glGTaucz+wt8Mpq0s74VjWVGvC8URwEo8g4=;
        b=JxzLMpoaS2nFxx3iWT8/Dh7Ey2jMqqAuy+T6Zcp3m+Nd4mBc8fRPJbnaB8hCDqiWEL
         bu/uQg+RBUq0cVcj6I/8xRBNuf3C4ae8yv+LhLRGET/zwuXnHLBJHEbpmAPE/cX/7toq
         0qBpoMaHwNI5dkasXxkCV9AlgiwX38p8g1XYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=O9s+SAq5glGTaucz+wt8Mpq0s74VjWVGvC8URwEo8g4=;
        b=lPJwwdpwmdStzqoJA+/yC88wFA5ApTrma1dPMGHf4wFu6JZRt7ZA+rdoE4VOT6tGi9
         /s2pfWk/TIjCOsjyhux3CadeghtyXIqaVM8FDIYlev4uqUNVInkdC/+Pw1q+dPF3ewb/
         mXVex+anESCZ08Yi/oE/uwzgECSAfhpRMOYyryiFZeor5kun6lQoKKkIKX+P2kpLa9aw
         oI52cqCwijdkdUTLcWvHRLL2fCKqxy9HM6yhiagcY0eG5zSNgm6xuer9RfjRV3ZkTCd6
         XEoKTtyLJ3s48OJFFzUmf3E6IIhLApbxnhOm3SuAvKJIyKHhn1NHyPbZNYmATa8/W6FX
         hRVw==
X-Gm-Message-State: APjAAAVkWUACTup/6jB04VXErVvm6x9/9bEjPx79Msx6hG+nIaYZOL/J
        Kj3sJvW4OGcIlwuOOakxIL91Ag==
X-Google-Smtp-Source: APXvYqxqj6gmcahOY6voyb+TLBsVbjQF4GbBW30MFqILtCjPoiUjkTNOE1iVBtIvatrg1KcU1nzMNg==
X-Received: by 2002:a17:90a:c982:: with SMTP id w2mr6742744pjt.125.1573148876348;
        Thu, 07 Nov 2019 09:47:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z11sm4989778pfg.117.2019.11.07.09.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 09:47:55 -0800 (PST)
Message-ID: <5dc458cb.1c69fb81.c5a99.c3c3@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-6-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-6-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 05/14] arm64: dts: qcom: sc7180: Add cmd_db reserved area
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 09:47:55 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:08)
> From: Maulik Shah <mkshah@codeaurora.org>
>=20
> Command_db provides mapping for resource key and address managed
> by remote processor. Add cmd_db reserved memory area.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

