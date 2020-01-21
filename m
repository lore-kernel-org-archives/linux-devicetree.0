Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA143C2D0CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 21:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 898562465B
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 21:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579643117;
	bh=sW3Z/vDCOlrs/wYR714h8Inna747mCM9wqEoq6y+Ywk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Ca3I2rVW/v5CuC3A8sX3Sp3c0ENtVGv++elXUtielnkjoBA5QiqmL+ciSs1h5Ys17
	 js4Yzkwk3i4Ym5oZsJwmwUaU65A/z0uLe5K4UwN3QD4mp9kAnl0R5t5pNzmv4gURp5
	 K1ldlZKN1kmp5jYN+kjpMwePJudy6KJx2i6xMBxs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgAUVpQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 16:45:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:46968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728831AbgAUVpQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jan 2020 16:45:16 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2838024672;
        Tue, 21 Jan 2020 21:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579643116;
        bh=sW3Z/vDCOlrs/wYR714h8Inna747mCM9wqEoq6y+Ywk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BH49rnPO3D5lfEKZk9x1zhVQ0sEUW4S9mHVXxPmuKZ7EfczXrLkpCOHPSJFk9Ra3p
         RS09z4rhFdD+JrZJHIJuci0dcKlI1ibdF8IpVaUomUkilpoXV+IzB4pcOP0xwB6qCj
         YhBeojp5DcZaaESZ9hka7LGE5C9YGRGEnQqu6tJ8=
Received: by mail-qt1-f169.google.com with SMTP id i13so4003312qtr.3;
        Tue, 21 Jan 2020 13:45:16 -0800 (PST)
X-Gm-Message-State: APjAAAXPdJQ7l3rdNdSa26IJ4RXT4LuvtkJksLxcjzO1QOcOvsBlMl5x
        GGkupHI8wIabdBOX3PtHoh23g6q8HCDZcmyOJA==
X-Google-Smtp-Source: APXvYqx4PwccTkV+t/aD29wO5YL0fi71bBCe5y6Otd0s7hRSgBALPre4Tw0eOtz6QNmolgArMK3ckPCvqapfFEfHT1k=
X-Received: by 2002:ac8:6747:: with SMTP id n7mr6804541qtp.224.1579643115282;
 Tue, 21 Jan 2020 13:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20200120081558.25258-1-andrey.konovalov@linaro.org>
 <20200120081558.25258-2-andrey.konovalov@linaro.org> <c3c8c2a7-d21a-6e2d-f4ec-e62cfac1d5d6@linaro.org>
In-Reply-To: <c3c8c2a7-d21a-6e2d-f4ec-e62cfac1d5d6@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 21 Jan 2020 15:45:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJJKM5eBTO9ub4bbjWR6c7VbOz-RTvzsztWWP5W-Stc9A@mail.gmail.com>
Message-ID: <CAL_JsqJJKM5eBTO9ub4bbjWR6c7VbOz-RTvzsztWWP5W-Stc9A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor binding
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Peter Griffin <peter.griffin@linaro.org>,
        dave.stevenson@raspberrypi.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jan 20, 2020 at 5:32 AM Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> v3 of this patch got "Reviewed-by" from Rob Herring.
> But unfortunately, as one more property had to be added afterwards, my understanding
> is that that "Reviewed-by" doesn't apply to v4.

It's fine to keep it.

Rob
