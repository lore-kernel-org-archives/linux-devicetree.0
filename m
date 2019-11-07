Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC21EC5DF60
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 07:51:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9BFCB2084D
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 07:51:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ycnoBW5a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727405AbfKGHvx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 02:51:53 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43214 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfKGHvw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 02:51:52 -0500
Received: by mail-lj1-f193.google.com with SMTP id y23so1114182ljh.10
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 23:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=On936mGMEelMd4C65roIL0BcdaQ2T5GwNPLPLhFxgbM=;
        b=ycnoBW5a/P0R/fCCa1IlkCCEhbx0j4Dkmsc9IYPN+5xzYVE93lYWmGh/9Y79V+nf0r
         fQHkXQwJVnE5zh1VewSgjbSX5yZ0yqSmaBzHY+em48BBX9gA81wKUNh4C6xoO8zJZaDP
         5umnrsvAeLcFjLuoFUBv9zhc3Ibmt1EPQZzglqJZAyAE0GPBHkz0skLD3cW65mPEQppG
         jfVTyRM2Sq1nLiX9AzsB5CfFEIcxDVY9/giK59bDXPl660Sdi54avlVVHBHE1mQsY2kJ
         stI25GL+ROmqEgPfmLKy5HJeNusz3MJ89txqIqGOTO1fc/0ux/acDfG3WrGBiSD5b1H5
         Bd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=On936mGMEelMd4C65roIL0BcdaQ2T5GwNPLPLhFxgbM=;
        b=e/DSuuAEF0YOUpBF2maeZHehW0b3/nLeInpIvsZ7zpL79nanWbE34foCIxOcBuh6Bw
         lbBJrL4sfmGdroW5sYUtG4MMFdzg3qSTmyjDe5HH/3CF65jhZN6d4HHfRK01UG/XIEUc
         3uORMBSJXfH4T2WqiVNVzilLPVEQCYLTQr5HFV25MBakh/4V7BXkJTFr7tgDA5rr09C2
         HwCuC+NmpP+eTjrlp39KxKzJSVT1/KXZ7wFSWi4UKsxQDQVE5f7QrOXrs1FbjLsDfNcK
         eZ2ApLQ1V66TweUNvxYVT9bUfrCJkS+ylwE094EKyGt+gn80F6J7UWkehivKQR/VxuWn
         wRhw==
X-Gm-Message-State: APjAAAU3ek9Ztr8It92CD1oM+pTmN2YaY1LoFvXEtggZPWJJ1CFx44Tj
        nVnHiqzbNoaSUPpqUFSCyhNpR4V+qIRXB0jefiKj+Q==
X-Google-Smtp-Source: APXvYqyXT/frTnZn4f4aOBZNaxsFsBf/960HFLpqrUgIF5vLWRguxul1CehVQt9McUmhGmaLJKFSkOKbC21v3CDFF0c=
X-Received: by 2002:a2e:90b:: with SMTP id 11mr1229482ljj.233.1573113110820;
 Wed, 06 Nov 2019 23:51:50 -0800 (PST)
MIME-Version: 1.0
References: <20191106060301.17408-1-joel@jms.id.au> <20191106060301.17408-5-joel@jms.id.au>
In-Reply-To: <20191106060301.17408-5-joel@jms.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Nov 2019 08:51:39 +0100
Message-ID: <CACRpkdbtrsgawbSoZj=Sma87iePvGjgSm_ASnJNmRoUpx5GpnQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: fttmr010: Add ast2600 compatible
To:     Joel Stanley <joel@jms.id.au>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 6, 2019 at 7:03 AM Joel Stanley <joel@jms.id.au> wrote:

> The ast2600 contains a fttmr010 derivative.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
