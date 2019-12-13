Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C56C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 22:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAFE02077B
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 22:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576275539;
	bh=SiOkwFwElyGHnHvBcMZ/ANt/N/f5alpmyUQarKA91OQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=X/P5vCbOv1Fd+RQTkW//5HDxFj2i9AlplroUl8Hbi1qLug05Y5lk9v2gZJplL8qav
	 2Adb/bwiWv2DLjkkMVSR886y/hYRwuWrYXNM2xrPfrLIrMlGwP5trlscX1m5oFgUog
	 zRrDm1n5q+BZcB5pYJhoL005Yuwwh3ZeKmMb85pw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbfLMWS7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 17:18:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:38812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbfLMWS7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Dec 2019 17:18:59 -0500
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E42F2073D;
        Fri, 13 Dec 2019 22:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576275538;
        bh=SiOkwFwElyGHnHvBcMZ/ANt/N/f5alpmyUQarKA91OQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dKotVCWpFC6K6Ukvxk2yN/MboQoSH40mlCGZfL+AQgIb9KW5IC3bVZLIXGt4T+oh3
         ecyuHY/dIPlhQ/f9GEOZUCm+SKFkf9yrJYR6i5cpMtUoCVUuDENNciEplbAIwU00g/
         aAyok9YNGrZfd4kcO3+DgjorWklnpmoXVBoTo6ag=
Received: by mail-pl1-f171.google.com with SMTP id g6so1806836plp.7;
        Fri, 13 Dec 2019 14:18:58 -0800 (PST)
X-Gm-Message-State: APjAAAWIv0376eZ+df35DdHdXBY70yV1BEFlNunjs+vXg9CQtJkX3WM6
        8HA/4/wf49lj4gOKrdRRrzXPhvqSZVrLtM1SSQ==
X-Google-Smtp-Source: APXvYqyr51fniozMNKvMYlVmGS7rD5sWQN+BGHgVnRNmkNSL4e1Cz7vTZuUAWsBrt3ktL39fHBvUqLtIefHakH18m8s=
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr13414497qvn.79.1576248718360;
 Fri, 13 Dec 2019 06:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20191213081230.23494-1-bibby.hsieh@mediatek.com> <20191213081230.23494-2-bibby.hsieh@mediatek.com>
In-Reply-To: <20191213081230.23494-2-bibby.hsieh@mediatek.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 13 Dec 2019 08:51:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+sZQo+k0b_MhPz8oST8GcLaCcho3R+kNLLL2zFUit81w@mail.gmail.com>
Message-ID: <CAL_Jsq+sZQo+k0b_MhPz8oST8GcLaCcho3R+kNLLL2zFUit81w@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] dt-binding: eeprom: at24: add vcc-supply property
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 13, 2019 at 2:24 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
>
> In some platforms, they disable the power-supply of eeprom due
> to power consumption reduction. This patch add vcc-supply property.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
