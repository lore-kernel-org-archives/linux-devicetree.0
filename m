Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDB5C83001
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 14:32:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BD8D206C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 14:32:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GNiAeQhg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgD1Oc3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 10:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727117AbgD1Oc3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 10:32:29 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196C2C03C1AC
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 07:32:29 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h4so8157540ljg.12
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=psr7yNqTXqMfQvqVzYJ3WgK/XrorFzoihdkLU14qe3w=;
        b=GNiAeQhgB/N+m40azYZMqkMYXjkfb7QkJq/BtD6t0WwK9uLf8zfINMclqp7OsmxGDZ
         H7p5uQXQhNAIxz/85JMYPZgfGGWVucEvqeAs0Vm//oqQLmsZsGxg+GrHGXMbCtJ01BRj
         10tN2AYH7R6BQlgRnqwLhnqCu55YUoKgD/shuGy6qCrkfLGuwBraErTOfjk3qO2zNy74
         UYWFVk7AFpbRGXfapyYzscgE4U207W4wdvXzgCVEC3UCuupa+aZpO6q2HtqwrDmZInO0
         DurvuXNHk81MnOMb/bQv4ZwbRpwTaeQG0pHbo1Fb33CGAWUjuY7RnO68aYP5eZterWHO
         SaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=psr7yNqTXqMfQvqVzYJ3WgK/XrorFzoihdkLU14qe3w=;
        b=nuEKQqZNmq1GdgRYt5aNyRAlnxNtz9JWW67qgacBrvcVA41WJ5xUlDEvdSZFUMH7zA
         421pFc8Tpy1orB4XCzn9RsDy4b3s5Uf7Vmm4oxKRC9jQvHnVbV6MlqzidNI9LAuRtuqE
         YeLOMMP5Ox/lhEYRESys84u2t7J4SVSaGTNrWTQVAibKOoD4z2U3JhS5z3azPlvytUwZ
         P6/cNNcYUjGrT8itxMT/scggUT6RB0uVPcZT3nr/Ib61kyXFhrE2MmYsMce2CthgT6Yv
         YC3F+Cyks0AR+dmlrMB/k7L3c63G/2VAaaPIoDfDtDpMr5TdqBwcFN9MUQhHy+tES+f4
         eLow==
X-Gm-Message-State: AGi0PubS6Qsbr1TsjYlqKDLfiq27+yWFJf//uSLxS+WT4tRhduXze426
        n30WSnDpi5JAKw38UU+p7ltoPIL+Wou3KbnJ5oQ4Fg==
X-Google-Smtp-Source: APiQypKVikJwVUY4aCnhdxfj2r5hZ+MavanhuJYX2Qu/0kL47XqZliyypaH3vT3ucDc/5Fb1DO9yg2SDlr/F5VKH+JE=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr18610567ljh.223.1588084347589;
 Tue, 28 Apr 2020 07:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200420134800.31604-1-benjamin.gaignard@st.com>
 <20200420134800.31604-2-benjamin.gaignard@st.com> <CACRpkdatGwWyruTLC=+BUtnunvqyxnXAYDhcHqy26oeud8Bs1w@mail.gmail.com>
 <13b16e13-690b-ad3f-a800-28c7805cbb96@st.com>
In-Reply-To: <13b16e13-690b-ad3f-a800-28c7805cbb96@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 16:32:16 +0200
Message-ID: <CACRpkdYLxX-vYypC=9xxuWRQ43v-xm6=LC1shdC2ciH3BtxsYQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: bus: Add firewall bindings
To:     Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Apr 28, 2020 at 3:13 PM Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:

> Does the following description sound good for you:
> Firewall properties provide the possible firewall bus controller
> configurations for a device.
> Bus firewall controllers are typically used to control if a hardware
> block can perform read or write operations on bus.
> The contents of the firewall bus configuration properties are defined by
> the binding for the individual firewall controller device.
> The first configuration 'firewall-0' or the one named 'default' is
> applied before probing the device itself.

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
with this added.

Yours,
Linus Walleij
