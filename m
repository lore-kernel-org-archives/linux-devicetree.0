Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493F7C3B196
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 10:49:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 140A2206ED
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 10:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ts4DSDY7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbgBNKtF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 05:49:05 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46539 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgBNKtF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 05:49:05 -0500
Received: by mail-lj1-f194.google.com with SMTP id x14so10168781ljd.13
        for <devicetree@vger.kernel.org>; Fri, 14 Feb 2020 02:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1i4Q6/1RsyH8dGZF2vprm22L1oxGHlOcnNHReqoF9A0=;
        b=Ts4DSDY7UpRHKDbUuCSly0SJGu9e3cuorS05YoXAWoiHfbT6gDZLHgtavc4t6uYro2
         Jd8tKZgAGyBhN4SCSktaIRL6q1pQC6cNsNrG/hv0z/7DiwEjLZOuQG4ZMWSlDutuJMXz
         odHlhJ6Gf6gUix4lqMvr+gIMmhodCE0+cEmdy8WwSmZUPu8Gy9rRYcvrduPsfERBkXcf
         vgfVsRRfU6q7ad86bLwMrzpnaqLPKUpjHyb7QxWm8oLMUpszmFk2aq0scMy7Dc+yRMlb
         TpmDpcBxPHLReyZNxloQ/XqdAjdMKu9wStXmE3ts8+fwSi/F52kjw6t1YMmk8mZ2MBUV
         PRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1i4Q6/1RsyH8dGZF2vprm22L1oxGHlOcnNHReqoF9A0=;
        b=PxGWgtd3PxNoQYt9aAV27mruXz0gsCoWoDfEjhqgL8EEt8F3RMRZ1G+F9Fplcm1XUL
         whEVLMO32PSrI2BtFJz0Xh+MPpLQDTR1dLrFHcQiA3IvBNSoAyzO3kl2d7zTAp67nhFL
         SijttifIUZKOdnmTGgL6B+cKeAFQOy/s3sATLN4tDZ7WOTZvRasPG2hhnF58+kuVaExB
         WrQ9NN5gFOREp+4LGr7A3xegTXg/7pVTde4CZIMHOT7FggdFeUlhSYjTfcVw8VWBaB2x
         spxD6QQ9glPXNqyV3S66EpuwJ10LkG3pciwPDMqsJa7DCaiFN1MnSls0KZJKnudX78Ng
         ya+Q==
X-Gm-Message-State: APjAAAXeLfPaq1IALNO0ETKVzOL2ML2vF35rBFgAu/7uMAY+M3WUaKmi
        iM5rc42NHi37y5neBh8VWnz5qZLKazWaIOLwatpPPg==
X-Google-Smtp-Source: APXvYqz+6XkhlYSkMAKGVhZEHaoBs4DSOaPtmDqULEN8Q7rW85h657r4NxLb6Kf9TtTlfZhQ2GV+rviqE3OrEyKx/q4=
X-Received: by 2002:a05:651c:2c7:: with SMTP id f7mr1665644ljo.125.1581677342094;
 Fri, 14 Feb 2020 02:49:02 -0800 (PST)
MIME-Version: 1.0
References: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com> <1581166975-22949-3-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1581166975-22949-3-git-send-email-stefan.wahren@i2se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:48:51 +0100
Message-ID: <CACRpkdYKNYaLcy4T=CixZSkzP6wOvisFt_H_gqhEoANz2Bm4KA@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: bcm2835: Refactor platform data
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Feb 8, 2020 at 2:03 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> This prepares the platform data to be easier to extend for more GPIOs.
> Except of this there is no functional change.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Patch applied with Nicolas' Review tag.

Yours,
Linus Walleij
