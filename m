Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5CFC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 13:52:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9847A20888
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 13:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DPWNkC3T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390731AbgE1NwS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 09:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390639AbgE1NvN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 09:51:13 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD01C08C5C6
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 06:51:10 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id dh1so12885374qvb.13
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3Rh8K4+22O+QrskrmwrNTFBFh5vNosv/sr65KhuOYxw=;
        b=DPWNkC3TUmnqZbbYEmi599uf3WJwosa8MGshm0VnwLkNfwtiOfu63b+H7co25zOIei
         /PFLTBpk9KSDfT2KHg43sSZUGFDhM/Eusszyg8Vv+bhw1u5EKr819Kz0DbE+CegMJh0f
         w0L4heEofgU4koOwKyena9NVSqmdhHsetq1AiOAnOY4to4U+fFQcSsuyKItYt7e0hGpZ
         ZjPkjDF1i1tqA5bjWD20luWin4AwmRIreRgFjGZ7FrbOg5gXHP3PyTklpEiLRLiW4HTN
         qilde4CsbWe+FEVPmCjq+Ads2DQV8fXNlAMQ3UD9MCF3bBayQ3MRIWh9WXhLv6+LmZk+
         Wt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3Rh8K4+22O+QrskrmwrNTFBFh5vNosv/sr65KhuOYxw=;
        b=hTKMVF1Vb0daLS7/y5b/CHJDEcfwSwXqW8cwFdMuD3xJeEPe0mEYf8/N+Rsec5q6tH
         HZz7ceX/7I08c7V0961aOr6KSlFKYEQu0mNb+kupmr5iFiLTFc5Zn85/x4Z0zRoioZZW
         /FBgal/iJZrl3sDiXSQSeuVWzmjFcGYsYZpZyA/NIskRPvB+4JJtRbk0vpiebqo805Ej
         6o3sd8OhZ1z4XbW8D/+Qj7GHMVU7ve922hC2Bsn4xa5zTg56F+oSs5cMalyrURI8V5t0
         setnVya00ycO25KTpZJwHisrvD++2Y2tqIihVKzq6G09pkBdx4HfNadnwN8Xi4xKjNWL
         uLZg==
X-Gm-Message-State: AOAM5336QAXAeCyBAOy6I9jn5gbYwrI1ZrK7nc6TSLc0MTYeZ25NkhX0
        s7VvnZtY9MFj5VBytseDQSU6+yWx5qJ85pVTXTjStQ==
X-Google-Smtp-Source: ABdhPJwwhNNg2jX7o0MVbONScnOgv1IrK2/t9ZTXd2p5X6gY80YlNgs/fudAJIX62UrVDXZuWcm7dMxbLlnnFexePB4=
X-Received: by 2002:a0c:fb4b:: with SMTP id b11mr3078897qvq.96.1590673869956;
 Thu, 28 May 2020 06:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200528132743.9221-1-brgl@bgdev.pl>
In-Reply-To: <20200528132743.9221-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 28 May 2020 15:50:58 +0200
Message-ID: <CAMpxmJU6=UfzMjB-zKV9ULPUdLe_qUr+zSwwrc1VXKv6HN6BEQ@mail.gmail.com>
Subject: Re: [PATCH net-next] dt-bindings: net: rename the bindings document
 for MediaTek STAR MAC
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

czw., 28 maj 2020 o 15:27 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> The driver itself was renamed before getting merged into mainline, but
> the binding document kept the old name. This makes both names consistent.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../net/{mediatek,eth-mac.yaml =3D> mediatek,star-emac.yaml}        | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/net/{mediatek,eth-mac.yaml =3D>=
 mediatek,star-emac.yaml} (100%)
>
> diff --git a/Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml =
b/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
> similarity index 100%
> rename from Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
> rename to Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
> --
> 2.26.1
>

-ETOOEARLY David please don't apply this - the id field needs to be
updated too. I'll send a v2.

Bartosz
