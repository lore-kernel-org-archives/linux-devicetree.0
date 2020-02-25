Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8C8C35E0C
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB3012176D
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:20:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JwVcQCUP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731506AbgBYSU6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 13:20:58 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37687 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731505AbgBYSU6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 13:20:58 -0500
Received: by mail-pl1-f195.google.com with SMTP id q4so130084pls.4
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=hLhapTDfld6iYI26Uu6G+l7v9cDuHGrJIIJjSJQbaF0=;
        b=JwVcQCUPFlIUvWpdOmzQ8TWSzcPecioUjGp6wuHwhYsuzyG4T2wTKmoMS+zgE8OZUp
         eB6hqXY7/01wMsuCD/Py+7SA3imsfiVDKSUnX/JqS6Y4lmYTswLbXV0ZDVc0vlMIFpL4
         mKUI+5C9c9n6rvb+ts/lABP89VoluYjZ5+cJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=hLhapTDfld6iYI26Uu6G+l7v9cDuHGrJIIJjSJQbaF0=;
        b=h6Y/k9Pv3nNOgii1UXjQDjGWKVg3xoisxbm0q1zdsOX6joscphDmXLp1Br0PZxFw9j
         bhnmyr7P6rAwgxuwhu8EZdD17FojF5F0W0X0qmNMNLtzdWl4ht26opyAUw/CW3R3XsTx
         4pnLLGTnG4/GshwZoE5hWSUUBooYZiXsyhiTJNsK20fyIsoNkOr63DpEssln9Kk+c114
         Zf+vBAgFTXUle+ueT3fhzQS8ITijSdWck2ltRKQd4PmWoqwBtr/fcvUTa9+Bb9RI8uqc
         id/QxHwdnL370T647hyPtGF2nL4segKGT/+o4NiU2RNdUrltLs7o7C+J44/oVAwgzN1+
         faqA==
X-Gm-Message-State: APjAAAVWiE4VIc+l6DVCL+ZBkigaCaRX+hGKt7C1jF8u5DHoxKfnW+t1
        +YRk9lzKUU0pCs4lWXq71sIjhw==
X-Google-Smtp-Source: APXvYqw7MPpCUgHd0aakZ48hbazK/k6ob6ZjUXGFwU1wNp1VvIIRJhEPmczKQIjk0wSyeSfyNcREjw==
X-Received: by 2002:a17:90a:f88:: with SMTP id 8mr331916pjz.72.1582654856135;
        Tue, 25 Feb 2020 10:20:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c15sm8175668pgk.66.2020.02.25.10.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 10:20:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581932212-19469-2-git-send-email-akashast@codeaurora.org>
References: <1581932212-19469-1-git-send-email-akashast@codeaurora.org> <1581932212-19469-2-git-send-email-akashast@codeaurora.org>
Subject: Re: [PATCH V4 1/3] dt-bindings: geni-se: Convert QUP geni-se bindings to YAML
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>, agross@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org
Date:   Tue, 25 Feb 2020 10:20:54 -0800
Message-ID: <158265485474.177367.9818999192157425774@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Akash Asthana (2020-02-17 01:36:50)
> Convert QUP geni-se bindings to DT schema format using json-schema.
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
