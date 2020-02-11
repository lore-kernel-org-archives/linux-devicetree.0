Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C6CC3B187
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 19:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87D8424689
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 19:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581450326;
	bh=q9VPe1ydTAUi5w6cEUW2frjU+ddA+4dEWgK+7B6NC6I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=VrhgwqOr2BeJqmPWQGvT0dlBlDRfg70sJdBsO9/yn2o+Mvx1iCah1gbCU8K7SgZKp
	 e/2qdijPznqLTNhQVj0Qaf8JzbZtGbt12vburzWiHNSp6Dj5nJcPCOf0eICer3uOEp
	 QjgNUk6luQefaiGIna5I8jkz8tjkX4TYoZbALhZc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728993AbgBKTp0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Feb 2020 14:45:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:49034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729462AbgBKTpZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Feb 2020 14:45:25 -0500
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 064F820842
        for <devicetree@vger.kernel.org>; Tue, 11 Feb 2020 19:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581450325;
        bh=q9VPe1ydTAUi5w6cEUW2frjU+ddA+4dEWgK+7B6NC6I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FGxQCvk9BKxSg0jEbtd78/wqP1wz5MOUXCR8gNr+IUYaHsYQ1u5lvMzUa8sGNucXg
         4FUEGJKMFVaaIHLxqf5X+rzh9mkRxCFbo5ID5XRUp+s6ppk7vl2+ws9GMqgj0rnTEk
         OabOp4I7XE8UkL4fFlWIyp4FwDi6MroU5c8JiNCY=
Received: by mail-qk1-f169.google.com with SMTP id b7so11354264qkl.7
        for <devicetree@vger.kernel.org>; Tue, 11 Feb 2020 11:45:24 -0800 (PST)
X-Gm-Message-State: APjAAAUQ3UbUQ14V9gmNchtmZNnB9aErP7jsd8woOH0eeq7036GTIZCe
        CP6caCQ4+b6nnjKCuvro8BIyNi+kRsLZtai+wA==
X-Google-Smtp-Source: APXvYqy0F+krus8t+VOTuwWLyoxJ8kM9OC5+rJsRnXBBMj4D9aoh01Q8w4F58R6PunZUYPlNZZKVVXMWCGpr1BIXR1g=
X-Received: by 2002:a37:85c4:: with SMTP id h187mr7906186qkd.223.1581450324216;
 Tue, 11 Feb 2020 11:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20200210100455.78695-1-maxime@cerno.tech>
In-Reply-To: <20200210100455.78695-1-maxime@cerno.tech>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 11 Feb 2020 13:45:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLbG5AH_N=2UTLrwTetktdKoqjZUrF92kbBW+hU8-ucbw@mail.gmail.com>
Message-ID: <CAL_JsqLbG5AH_N=2UTLrwTetktdKoqjZUrF92kbBW+hU8-ucbw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: sunxi: Fix compatible
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Feb 10, 2020 at 4:05 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Commit f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display
> pipeline to schemas") introduced a YAML schema for the Allwinner TCON DT
> binding, but the H6 TCON-TV compatible was mistakenly set to fallback on
> the A83t's, while the initial documentation and the DT are using R40's.
>
> Fix that.
>
> Fixes: f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display pipeline to schemas")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
