Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6453C33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 20:34:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE2E021556
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 20:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N2PrwOAd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbgAMUeT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 15:34:19 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40690 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbgAMUeT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 15:34:19 -0500
Received: by mail-lj1-f195.google.com with SMTP id u1so11651023ljk.7
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 12:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L5btG8+rDtVkHFSsWTVsc0YN5eY7jgmCtlCqNwE1Iys=;
        b=N2PrwOAdsbaBW3XZzD4fjuiU0y1qsP6DSHHfbXBeiVSodYZAmT4Pj+fQBtVT0bgt+Z
         YeA1QyTXs0lKv5AcCOtdvCsLoI1bxHcPYIh+qNvvaohu4ga5ktE/YhmQq3umz+b+RPgd
         yFmcIw+Mc/fyLDB5qabO+mtE6exPsL3D2t4m513tZbEz6u8nvVj48gxyLWv/uVK92R1I
         lgnBlrkSLTKceAD3xy6fBfpSk7hoDseJA1OHaSHJMS0lR6TPNwq4Q0JCZf7NfKtexs5v
         tlBoXN+i5VEOeEQURjIjx8i2Zil8UTf2L/L0QKC2jTZahnS7FkTr6tJMDRRB1qSBN8UO
         92VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L5btG8+rDtVkHFSsWTVsc0YN5eY7jgmCtlCqNwE1Iys=;
        b=rRWZVffurA3B79n8lTMGV5nY9vK91ocE2jdtmhUfHyoW2CHuzamKp1iTElhUQE10e8
         LGOwnaWMVyah0SoJ1zHsIMjdS+JE0DbGenaQa7R/KA2f6RpRWTvlrVsnwmCxGSZtEBrG
         6NDJn0/po4jd4oxPnh20iP60//1XYWhnzAWaLWvl1b6LEtHW/BhcKhvsM1PSJGQcNdZs
         12jmqyunNjLqZargTKO66oGTTU4cEc870v+XT33gPRRrMgfLWpMVKeyvmRVwd74UjJ9q
         JXI4n6EkWsYGMHPtbrXt8VafMK/jm+q8RiXLXRtTaBbnYmrfkreFRZoT3qIYp8J6iaLT
         jcVw==
X-Gm-Message-State: APjAAAXLbRF/d4e1qtOVbY4X8cT5gse7yD+LCCiAeYCrH9XmUf4G3kYg
        o834tTTfyUQra15d+7Uc1G4cNaXAT3esAqC0L6wl9A==
X-Google-Smtp-Source: APXvYqy+h3uYVoEzWBBQzoSiJFi+QF3mEdOYnavTCKS59kG2E1X+rTKCRiOgNC7GE/c0qcOMwRXUKAR5syrQRB9414g=
X-Received: by 2002:a2e:3609:: with SMTP id d9mr11389552lja.188.1578947657486;
 Mon, 13 Jan 2020 12:34:17 -0800 (PST)
MIME-Version: 1.0
References: <20200108104746.1765-1-m.felsch@pengutronix.de> <20200108104746.1765-2-m.felsch@pengutronix.de>
In-Reply-To: <20200108104746.1765-2-m.felsch@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Jan 2020 21:34:05 +0100
Message-ID: <CACRpkdZYzjcq3+NwSHL3pFVjo4ZugJjDKcjVGePUtmZ3OqCw9g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: da9062: add gpio bindings
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jan 8, 2020 at 11:48 AM Marco Felsch <m.felsch@pengutronix.de> wrote:

> Add gpio device documentation to make the da9062 gpios available for
> users.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
