Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7504C3F68F
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 08:49:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E61A214D8
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 08:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sK4ZgQ3I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfLMIto (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 03:49:44 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40574 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfLMItn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 03:49:43 -0500
Received: by mail-lj1-f194.google.com with SMTP id s22so1739308ljs.7
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 00:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E1JOZKU3xEudJiyZSdDJXezSL1VMnF9zJ7hQY77MyhE=;
        b=sK4ZgQ3I1MDMt1BJme+WWnKfSQHo54j1ZoLoWor4/ASvWr1mjNT7v7g0/BhdIeVyph
         Xm0WWDGOKCsOnB+Vb7zo5dqwk2cFqH5L5CMH9KG2WudlbpEhRAEFJM4l5AmOQFIwhq4e
         Z0PaSE44DFQmm1KxgwogrNgfaWXfE93iwQBGxWpqK7+/41s1D/oQ5Kw1ddlzVoq19xJs
         CW2LGsZI5i0XOQuL13yhuYRQj34gZrDOJmPs6ba4/LL6UTo+OeLdCBYkHdzy5xT9vmko
         MH9bMeGD8aZ/tVNSxW/yeEfjEo1kl2FDBmp5lHja+RYQz11gS1d/CkRiBmco5JvpKfCm
         J+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E1JOZKU3xEudJiyZSdDJXezSL1VMnF9zJ7hQY77MyhE=;
        b=maZJ1G23bTOKfmX1Uwh0uXQS5r+Dc24xyjgUn1ijV7uaYjfUUsQR093XfJHxJs9nWs
         NAVR6p8M77m6PLvXvaia00awYv5SVLWxH0JoRcH4GSdHXEryw6dXE96gVBNT8qWh2zzk
         nQsnKaHzjcesusNpP+2ib1ljVzL21cXJkpzvRVFNTNdQnxh+z0Or4qJ3AVBIa9VgJvQZ
         IzgvJ318aGwIql+Kcvu0/tyJFKkJB1D3MSLsW4JOaxAek33K40msPjCXZaCE7PVB464w
         QnWWF/+IL2dhGohq1+mLBV+bWDsbm99KmlSKUD/m2TqOaNzFL57PP7L97f3P0I+F3Rix
         UqfA==
X-Gm-Message-State: APjAAAXwNx9NNvLreKlN7yfSDtWdfdTZ4yGZC7eO+/0BSb96e1Q+RLES
        hkA/1a740fgDQeT/tWAdXtY0mm3KrLJhXKQc3w9/DA==
X-Google-Smtp-Source: APXvYqw8R3tVL7YcPB1QUWAfPaywn/OZ8gj8e1LzTXq3Fsdndmc67+vCT3PwvhB0ehsJ2ot7As+6b33BkV5z0TC0TKk=
X-Received: by 2002:a2e:844e:: with SMTP id u14mr8785712ljh.183.1576226981672;
 Fri, 13 Dec 2019 00:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20191203141243.251058-1-paul.kocialkowski@bootlin.com> <20191203141243.251058-3-paul.kocialkowski@bootlin.com>
In-Reply-To: <20191203141243.251058-3-paul.kocialkowski@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 09:49:30 +0100
Message-ID: <CACRpkda-hDbC4bVihPO8RUogkFkPfsxVS13d_JJoFZLaPLQYcg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: mfd: Document the Xylon LogiCVC
 multi-function device
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 3, 2019 at 3:13 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> The LogiCVC is a display engine which also exposes GPIO functionality.
> For this reason, it is described as a multi-function device that is expected
> to provide register access to its children nodes for gpio and display.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Patch applied to the GPIO tree unless Lee has objections.

Yours,
Linus Walleij
