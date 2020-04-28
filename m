Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879AFC83004
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 11:24:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D10A206D9
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 11:24:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wbyZMmT9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgD1LYQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 07:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbgD1LYP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Apr 2020 07:24:15 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498D1C03C1A9
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 04:24:15 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l19so21043297lje.10
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 04:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dtSCC/6Zk0CAn9Haq8H1TnXYmgXgUR49no/7MjmVHFQ=;
        b=wbyZMmT9xNXh+i0FXuT8+Zx0WQdZUgyX61MnLeN982X/SWM7j8uLKdx4JNX0goNrlW
         XNleJW0Aumfkz+/nYc6WoQ8Mbrxe3w1WLfSNynijdPAXIoQCU3Axz5WeoIANm/zvra2V
         ijUUTgiTMZ8y0QAkIuJ2Bp78VCRcPB15ZdTKvt9ubTDohSlkhyXFMXv4xeDA7kXorXIc
         jgucg0wgYdFFOPB7eDr41HD8vwo4BbHTO7E1pPV6RY/Q68xD3pDZwrTL4LOvetZ3bQ51
         zH9VJUmgfofrM3p7AOv5Jsy5qEsxI1mNerRs3/gEPO5WEqb6omAGtU1ZPiO6iCLwZeNd
         V+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dtSCC/6Zk0CAn9Haq8H1TnXYmgXgUR49no/7MjmVHFQ=;
        b=kGrHOOE1ppXsQFuLhxHyzkSK+PpiP9hBodlFmUR8xmcPQAyqris8VO0/LHEFipCTQV
         bjPp8pEHLIfVjk8g8qC6wkCfTFgtHo/e6RtZ4r0Q8ty6zvZ9rF5u7U2/3r1Cn5I9eqUy
         HzPJwcG1WYZqlVzgZzXlPaFGqB3IUMbQJd1Xu1+guxRy/vMVjotjsGC5DCwR+cPH8gnJ
         tESWsgflpppEBjRFo8NpY8UmPk7PTqhZNEu2gg6KrODIBXKFENoAoqK2Mvdk6GV7DW/e
         xYmBItW3qegFwG5kuysbZLMmzbMmwms6CRU7PHIDyORG+/V94ZeQi6vyZqj7iNgSe5UI
         3YmQ==
X-Gm-Message-State: AGi0PuZ/pJF4xhfo9pgKMi48VhLJ1f27/PSUk3cFk+Lfu7vxXLhJeFxI
        PVJt7hj2TNq2pN4m/JYjCz3wMzJ4BNlIO5s+q3Tf+g==
X-Google-Smtp-Source: APiQypIAZegG6Qn5JvZ0uvEzFCZSmajX66iK5f+sKRerbAwYFi9OxxOsRKHMp8MI1JCk0ToY+5PLv4Mls7VQnu506Fk=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr18067893ljh.223.1588073053796;
 Tue, 28 Apr 2020 04:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200420134800.31604-1-benjamin.gaignard@st.com> <20200420134800.31604-2-benjamin.gaignard@st.com>
In-Reply-To: <20200420134800.31604-2-benjamin.gaignard@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 13:24:01 +0200
Message-ID: <CACRpkdatGwWyruTLC=+BUtnunvqyxnXAYDhcHqy26oeud8Bs1w@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: bus: Add firewall bindings
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Benjamin,

On Mon, Apr 20, 2020 at 3:48 PM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Add schemas for firewall consumer and provider.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

> +$id: http://devicetree.org/schemas/bus/stm32/firewall-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Bus Firewall consumer binding
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@st.com>

This really needs a description: to tell what is going on and what
these firewalls
are for and how they are supposed to work.

I suppose just a bit of cut'n'paste from the cover letter :D

Otherwise it looks good to me.

Yours,
Linus Walleij
