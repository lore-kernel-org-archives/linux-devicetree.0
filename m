Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6808C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 02:03:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B70922065F
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 02:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V9LrfOjl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgENCDh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 22:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726022AbgENCDh (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 22:03:37 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E562C061A0C
        for <devicetree@vger.kernel.org>; Wed, 13 May 2020 19:03:35 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id u10so561932pls.8
        for <devicetree@vger.kernel.org>; Wed, 13 May 2020 19:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+Hy6KD9Nm/Qwl13ykTv+/eNrz6cvZq6NKKJKymwmJU0=;
        b=V9LrfOjlTeekn/bLRW4LWH6a9yCcqFigmv2EMGXqmrH58Xy7+l3jx1JvBJqrkAWg0E
         NAylfXmzwU9Beq3qXEvjLvQasP+9pBMzMQ5ONlY/fOREfUOo3MaCZoENlQDe1F5snUN4
         DqDqq3XyObV+DVObDb4dzY5LKba6GnL/J6gyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+Hy6KD9Nm/Qwl13ykTv+/eNrz6cvZq6NKKJKymwmJU0=;
        b=SidbEDI17I3dzLGCRIaDFeVBQ2jVnTuaZuvExKYWa2TDQP2f52PNuklnnc/ZqtU7OW
         cHNb3H8E3bvmKQSEnEzpV1KmwtPUE7AGG8Qw2Ef6QXvhjHxIpXza/Zq3xphLaUrv5hWB
         g0Wi87ZGXi7binvPYYad3gw450q0M/CeNeCH17DzDm4ALrYjNeQOBUMcUwfv6UlaW2h0
         NMbxutf97ysMHQAgr1vpRNZLvdGgwnqkobKWbdsjiZTrBJGWCrQlT4hrby8NmA42XIJ5
         p6AqBVJ8KFDxkQi5vMfqkM3nfpGYjaSn6ZXuwQej3Hy8n5ppxNI5mHRefMLUO6jYDYoX
         xtwg==
X-Gm-Message-State: AOAM532SEXekO1pH3NBrISfXOj9KtdAg6DbUAmAhTL34mYouXWK0sHjH
        uajVhPxH8eEx3mLCZAtrO4++jg==
X-Google-Smtp-Source: ABdhPJyDZxeGFxcpqljfUPCzcdVkPYpzexD1KXBEYWxGrAW0le/qPFxdtT/oXasMhDAH41fgSaT3Iw==
X-Received: by 2002:a17:902:8697:: with SMTP id g23mr1904826plo.306.1589421814061;
        Wed, 13 May 2020 19:03:34 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d35sm813740pgd.29.2020.05.13.19.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 19:03:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1588863647-17240-1-git-send-email-akashast@codeaurora.org>
References: <1588863647-17240-1-git-send-email-akashast@codeaurora.org>
Subject: Re: [PATCH V6 0/3] Convert QUP bindings to YAML and add ICC, pin swap doc
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, mka@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Date:   Wed, 13 May 2020 19:03:32 -0700
Message-ID: <158942181222.215346.11981864062704009851@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Akash Asthana (2020-05-07 08:00:44)
> Changes in V6:
>  - As per Rob's suggestion moved pin swap documentation from QUP to
>    serial.yaml file[PATCH V6 3/3].
>=20
> Changes in V4:
>  - Add interconnect binding patch.
>  - Add UART pin swap binding patch.
>=20
> Akash Asthana (3):
>   dt-bindings: geni-se: Convert QUP geni-se bindings to YAML
>   dt-bindings: geni-se: Add interconnect binding for GENI QUP
>   dt-bindings: serial: Add binding for UART pin swap
>=20

Who do you intend to pick up these patches? Rob or Greg? I suppose if
it's all in bindings then maybe Rob can pick them up.
