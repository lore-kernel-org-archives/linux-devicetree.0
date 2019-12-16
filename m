Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4589C43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 08:13:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E9BC20700
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 08:13:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Io/Hf5q7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfLPINc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 03:13:32 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:35181 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbfLPINc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 03:13:32 -0500
Received: by mail-ua1-f66.google.com with SMTP id y23so1774649ual.2
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 00:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xn4dNigwlhxAQyKm9gOJN6QkFcnPQMlJTzy6sb2QOwk=;
        b=Io/Hf5q7xSuHylwL4OacRp4P2PsiZyoZaYrdRYlxqQKP0mShYWfBf+OMhO/2Np5ORk
         fbAabr9vNzYuqtaPzEs9468vWGCNFq6L07CpSEQEZDdQry1M0dq7J63v6z64SWxPOAwf
         aBsKNENdCTw1nW9p7XIYQuyMxASCHpUlj5HAzZvecr+WMA9OvIhKR8QH6qkSHxJvT/sV
         8QWyZr0vsXuIHqdImqYvcvVW/I2GLZFBKq/RBYiJ/t94ixC6bqbpO5tBZVkMH5O/SwID
         fpTlS9kNGShue2P7WPTC5Xv2q8hEBVLvMg4kHJ1x4kG+jy4ihbaykjFCICEm8rKO27mI
         0ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xn4dNigwlhxAQyKm9gOJN6QkFcnPQMlJTzy6sb2QOwk=;
        b=TOIqcstCLuI8FaBbf+Hmzfp1oQO/xD0373MS4sG9SWWZNiIu6H8jabwC1mykvj4e6P
         TdadazNJh5UaMAj2FoVOqvCclPRXKAUpJl2nBo1w78q3tegZ+NDEFfjEAKqFUdu5Z5bP
         0/UJMHRPhySWqKnrSr/nRxdUA5sKrl7ryOBWHqUmWuiRWwFP17fye1OaFBTCVqxxQSJ9
         P978Tt3ZLcQ5rY0gTVj6JbV8tWYuyl3acWNg4RB/s2qE30dno4C2lbq5NlobVUJJK/wm
         Jcq1mL7kF3FN7PaRvgDoXB/eLuvTCNbFdLVPoco0eqseKm9lE68DLtY2ujATsqlTRXbT
         Outw==
X-Gm-Message-State: APjAAAWnhQKxfX9hg+8OX0k2jipkXCfnuGksx2qZlwtfh+zjbCYe49sX
        735RWQeivJ6bS7HjgD7Bt46ZQZjCEZt6AmVAf3Db7w==
X-Google-Smtp-Source: APXvYqzf6JCyaHJwxPnWzJiB8wq7OgYE7mfA/OKhvFmoPueU8tPGA+C3vAw/23I1YgLjMrghbr0yx4mgW9xyWoMeQRY=
X-Received: by 2002:ab0:1c0a:: with SMTP id a10mr22253217uaj.140.1576484011659;
 Mon, 16 Dec 2019 00:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20191210154157.21930-1-ktouil@baylibre.com> <20191210154157.21930-5-ktouil@baylibre.com>
In-Reply-To: <20191210154157.21930-5-ktouil@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:13:20 +0100
Message-ID: <CACRpkdbHLv2R+XvCjCaEgaztUqpmHWCmSAqHABkkstJREkmfVw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] eeprom: at24: remove the write-protect pin support
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baylibre-upstreaming@groups.io,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 10, 2019 at 4:42 PM Khouloud Touil <ktouil@baylibre.com> wrote:

> NVMEM framework is an interface for the at24 EEPROMs as well as for
> other drivers, instead of passing the wp-gpios over the different
> drivers each time, it would be better to pass it over the NVMEM
> subsystem once and for all.
>
> Removing the support for the write-protect pin after adding it to the
> NVMEM subsystem.
>
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>

I wonder if this needs to be in the same patch that adds it to
the NVMEM subsystem, so as to avoid both code paths being
taken between the two patches (bisectability..)

However that is not the biggest thing in the universe and I'm
no bisectability-perfectionist, so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
