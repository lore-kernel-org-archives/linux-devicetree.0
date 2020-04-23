Return-Path: <SRS0=8VFN=6H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B88C2BA19
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Apr 2020 23:41:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 010FB2064A
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Apr 2020 23:41:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jUVhZMwk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgDWXld (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Apr 2020 19:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgDWXld (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Apr 2020 19:41:33 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FF8C09B043
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2020 16:41:33 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id y25so3861043pfn.5
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2020 16:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=UvY6yRSr9LoxwMbjAv+ye5C9hpbZ65HCNFVPFwYb5gE=;
        b=jUVhZMwkNiCZgtMssvAQEOCuMI34GiHeO2OcbYFNA0MO2tPfgE3ecSGPvuR4DPi4rw
         nrDqAIP+/voLFN3dUnkLv0OMk3nDYNqW8jwkBtqhMo4F2DCygEWZMgmz9XH5/kNZc0bd
         GWIkMaBex51qJfiKuQsvPBcHbWzw3cikkvWe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=UvY6yRSr9LoxwMbjAv+ye5C9hpbZ65HCNFVPFwYb5gE=;
        b=kWl9RJSH6rDTShHKTSSaQIypfYk6JERyLzZKSPfqM/DDa39fv+rG/VjwyB31LhhKo0
         odrCSlZ1jVyFDLeNBKzRtP06OJI68Y/mLP7vHkZc5pfbEgvDZph+llIkJ/SjljejO8ZS
         5cjuKAICu1MONwmfd4iWrM/Vp9jry6bTUSMjVXkzOFb/XSkDbIYIEH4Sy2SXKx9vAcCI
         D4K+UJ1x5IIy5vCr+hSUJ2xbvzH7TtnwsM6pwY9PT1A1HTBp/kmkVI/8Qyfnnd4YFSYy
         wqIBust3ELO3xVohhI0sfcLb9wT4ppYWmQCRy+hxFV98cOSdu5V8Hq8gX6C2FlGnqKTt
         +sNg==
X-Gm-Message-State: AGi0PuYPfAxOwF4oHhNusFltpj9mu7YJcuNpEHKttOYWdxXFvP6wAv2u
        oBV4QjrOx17lk73NyAqEBUcEfg==
X-Google-Smtp-Source: APiQypL/1HUpGNgMyu557lD7TWDtpCq8eHWZGde9uRaxlMdNp6k6YJ/zYkJ2Q2VQfzwQSkKLN4Cvvg==
X-Received: by 2002:a65:4641:: with SMTP id k1mr6634067pgr.406.1587685292738;
        Thu, 23 Apr 2020 16:41:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h193sm3755976pfe.30.2020.04.23.16.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 16:41:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585701031-28871-3-git-send-email-tanmay@codeaurora.org>
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org> <1585701031-28871-3-git-send-email-tanmay@codeaurora.org>
Subject: Re: [DPU PATCH v5 2/5] drm: add constant N value in helper file
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Chandan Uddaraju <chandanu@codeaurora.org>, robdclark@gmail.com,
        abhinavk@codeaurora.org, nganji@codeaurora.org,
        jsanka@codeaurora.org, aravindh@codeaurora.org,
        hoegsberg@google.com, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Vara Reddy <varar@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org
Date:   Thu, 23 Apr 2020 16:41:31 -0700
Message-ID: <158768529129.135303.14920680590198766597@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Tanmay Shah (2020-03-31 17:30:28)
> From: Chandan Uddaraju <chandanu@codeaurora.org>
>=20
> The constant N value (0x8000) is used by multiple DP

There's one driver using it, not multiple.

> drivers. Define this value in header file and use this
> in the existing i915 display driver.
>=20
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
