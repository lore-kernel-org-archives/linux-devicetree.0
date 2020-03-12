Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D08C1975A
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 09:45:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AAAA20724
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 09:45:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mT9aYb42"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgCLJpR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 05:45:17 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44248 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgCLJpR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Mar 2020 05:45:17 -0400
Received: by mail-lj1-f195.google.com with SMTP id a10so5600694ljp.11
        for <devicetree@vger.kernel.org>; Thu, 12 Mar 2020 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pODGPcrOCo99BFK0Xjb4rhW9q/kdwVYGIJ2RjyD6fxs=;
        b=mT9aYb42BoD8Blfh/Y8c4VPMYR6LI1miBJ07ovTPv3ci4OfSA2Dj6/vckh9GL3HnyE
         yQ/5equoB5oGfS2ZL3RCijubgZtR0uVQNXxSNKZ+LsI2aihc2rQ/U39N2Fz3y5CalgbC
         42NxHFjXctecJAI12xhPWsg9Ti5dOxMm/F60YF2DAYbAJpCP+vhKYiDVCchp4z396f8Q
         qCNAIbtPV8v6cUhiYdm3s4iM0tWI8GqTHE+f57xwEkLT1jYLfdJJvlhcPnGxvsZMx0hc
         g9qiPkvFKD3fL0BJj5BT5G9qHu2wyxMJcxvn2FD5DF2A8sahkkICe2gqFLIK72lwZeC9
         jVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pODGPcrOCo99BFK0Xjb4rhW9q/kdwVYGIJ2RjyD6fxs=;
        b=iJrLo73ynWyYk8BLzpmeo4ez8QDZ2j8hADPJQcF/AFR+7VUTUiqchnA0brNj2WUg9F
         q2gC8N0Cq5pzFceOSMZ30MCvyxyjR8xAuCq/C8YvJrtmDcGcOod6hs+zx1QkMCGO8cMq
         Isu/M97Rt3m+M3kaZTnV8JeUoTbxs6zqnDEcB0Sh9+FYJxn87ut/YKmCy7rDBM+pwFQY
         3/0Hx+KLoJ7nJFNXO3c7fxLPuwc16NdQiGt+bgKjXLZOj8Oe91SMh6dQjeeTSogTXd8J
         IPRHWOkldfHP+THI3LDOXPhLILAvC2A4SW0TcfMXv9fM3JvgR4R7r3UFvuGzqVlJJjMj
         NPpw==
X-Gm-Message-State: ANhLgQ1TJ+jUzWJPslWuOx/Ce+zyaukbu7J4D+1Wyqb35gEDod/uA0FV
        H06nTvw4hHVbIq+XfqOkEqPzCeTC5HyGo0feQG2diQ==
X-Google-Smtp-Source: ADFU+vtCa8+SAjbo+XfDHquYUdyP/1RvO9lPi7QEw1xwTxgVgOSXWqDiS5mP6Y7qbippLNSQT46Y+Db+ZJCx+QAfgyU=
X-Received: by 2002:a2e:9a90:: with SMTP id p16mr4719590lji.277.1584006315513;
 Thu, 12 Mar 2020 02:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200308115017.18563-1-sam@ravnborg.org> <20200308115017.18563-2-sam@ravnborg.org>
In-Reply-To: <20200308115017.18563-2-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 10:45:03 +0100
Message-ID: <CACRpkdaFWp2DbKf+tm9VqeOzdshMypwN_mBbEgihw5COPeaUFQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: display: fix panel warnings
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Rob Herring <robh@kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Maxime Ripard <mripard@kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Mar 8, 2020 at 12:50 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Fix following type af warnings in the panel bindings:
>
> Warning (unit_address_vs_reg): /example-0/dsi/panel: node has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): /example-0/dsi@ff450000: node has a unit name, but no reg property
>
> Removing the "@xxx" from the node name fixed first warning.
> Adding a missing reg property fixed the second warning
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
