Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4FBC33CB2
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 18:32:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51F1524672
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579026773;
	bh=gvVCkSUbV2b4NW/ymm0E/oi9mGj5feU5ib525uxCD50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=hDoR1JwzBOPD3JmbjECvoOpOGqMwvshOyYqRn4HsqUmY3+2VU6W/PiP4xtnzecbLp
	 SVEpRxYk04RvgFqOeYidf42f1YNYgo6ErmlaVQsRtjUFWM7401AQsaM9jF5fr3bYVc
	 mKUWclsiRH6mm7i48iR7T0aG5sqCekIOBHqz2gJo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgANScv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 13:32:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:48630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727331AbgANScu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Jan 2020 13:32:50 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF4AB24679;
        Tue, 14 Jan 2020 18:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579026770;
        bh=gvVCkSUbV2b4NW/ymm0E/oi9mGj5feU5ib525uxCD50=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WYiY0Kqgy3d3P8Nh6gKlrpJhvLMQxxOfAW5Zwt3nNLEVxzosDNcd4APrJGFow9y1p
         jkMnfNeNqPNEQ0W+D4aBTovzXcUzD8ySMRZ3cnn8qb14frmRKSj8uhuMOkfCOJ0qFQ
         8w8RUNAdVyxg1Z6QiGbzrw3A1qJZwNu6VdixK7AA=
Received: by mail-qt1-f175.google.com with SMTP id e25so2018141qtr.13;
        Tue, 14 Jan 2020 10:32:49 -0800 (PST)
X-Gm-Message-State: APjAAAXq7hZIiTRxbF3yaCHCp2RT/lsQUSUjP1Jt+tOMPt3I1lPCeQ3c
        yx58ErYgNAZSE02UgZrO9Q/to9cENAqHdz1VJA==
X-Google-Smtp-Source: APXvYqxzmZzCIN/yb6+Xzbk/mfmAZe7bhX4m1BqJ2nm8/J0HuZibB9VQmM8JKS5JODtt/gK61KXir17oySvAhtoq99w=
X-Received: by 2002:aed:2344:: with SMTP id i4mr4971391qtc.136.1579026769081;
 Tue, 14 Jan 2020 10:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20200114123821.2649367-1-thierry.reding@gmail.com>
In-Reply-To: <20200114123821.2649367-1-thierry.reding@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 14 Jan 2020 12:32:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKJUdhjWx5z_-kedNNm4mD6oSGizqEQ57vxtGbMFySbbQ@mail.gmail.com>
Message-ID: <CAL_JsqKJUdhjWx5z_-kedNNm4mD6oSGizqEQ57vxtGbMFySbbQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: memory-controller: Update example for
 Tegra124 EMC
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 14, 2020 at 6:38 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> The example in the Tegra124 EMC device tree binding looks like an old
> version that doesn't contain all the required fields. Update it with a
> version from the current DTS files to fix the make dt_binding_check
> target.
>
> Reported-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../nvidia,tegra124-emc.yaml                  | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

Thanks for fixing quickly.
