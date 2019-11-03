Return-Path: <SRS0=PDL5=Y3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53961CA9EB0
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 Nov 2019 23:20:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23E80205C9
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 Nov 2019 23:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vYEVAhXl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbfKCXUI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 3 Nov 2019 18:20:08 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46225 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728144AbfKCXUH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 3 Nov 2019 18:20:07 -0500
Received: by mail-lj1-f193.google.com with SMTP id e9so2279326ljp.13
        for <devicetree@vger.kernel.org>; Sun, 03 Nov 2019 15:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iVpcN1vOdXs3wwhH+wrUa3RKCmoO3R8+a8ZB0f/AmFQ=;
        b=vYEVAhXlokOFcchNfSd+V2JmCbFdTJYbvhwaDedCzoFLvtj/YDjkH2J6fS4zy3hjCY
         qefgD/I7cMWurxOGbXoJERkCxJIgrE516+LJyYBlUqFQrh0cJ84nEZwuVoNtZ5ZUPPpO
         mqmECtStI09hzbCh3jYmpXbJCQMvbPG/TPUhiJ+MzdvIPR6xxCQWdjTArl89XE7eGWxI
         DCsqV9f8aY3E/lAXiwf4vcPC++iSRJ/SXB8nGa3e8MuJS56vcsrNGIUfEB6rBK1p/IRe
         UD5a/66390jHlTwMpnaM0AV/1fXQrM8Ulp6eCpL5FASsHrfuoLzHf8CjkyGG0Sp3zbZ+
         AIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iVpcN1vOdXs3wwhH+wrUa3RKCmoO3R8+a8ZB0f/AmFQ=;
        b=rbfw7iNWbLEQiD07NjBaEbdeAnN7TJyMIDpYnAk2reCESDf4OJTnKbF3eJC/WjvkEh
         CZbS7BWyw+tf94E6KdaQQj+hPajzsynvHqxP7uHacgMuYmspzwdnRpwD/CHImEjdhAdB
         DoePOuqmrFQsPhOOWC3YX10SAWhKSCcXSPG+9xJwH2PnQ2QaN9gVOlzSiCwMsXH0UeSg
         99v3U0Z5na+DvfL2V4P+1oR/y6EJ2O0bf/fXa+EsTTUCEeUfxhwf+D8ObTU1wJVhGNoF
         ELcSRYiJHFm0v6zoJXP905AWQX59KG2C44H1uYpbhm/0U+HtutLRZt+Yq2VEkpgIEaFj
         8TSQ==
X-Gm-Message-State: APjAAAVrIxEQdoCBE1HNueQgttC+bMF1+cSK4/aB2OQx6JgvRs3QmjCo
        zBeP7A4dUBi7ujgrpKOgZlxCnoTcuwv6C6aRQldJWA==
X-Google-Smtp-Source: APXvYqxTxFkdLmpGie3z+n1NoTiUXGL0EZTOt83bLBNwDXdy7iOJZES3zs0O3WqyGV8LxjgkqUR638pDafjAOULX0gI=
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr16639653ljm.77.1572823204990;
 Sun, 03 Nov 2019 15:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org> <20191029112700.14548-9-srinivas.kandagatla@linaro.org>
In-Reply-To: <20191029112700.14548-9-srinivas.kandagatla@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 00:19:51 +0100
Message-ID: <CACRpkdYc-3Nk7VGj8mAjaM4C0dc_X7ZOK0cptW2Sr+kKwvyFVg@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] dt-bindings: pinctrl: qcom-wcd934x: Add bindings
 for gpio
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, vinod.koul@linaro.org,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Oct 29, 2019 at 12:29 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> gpio controller to control 5 gpios on the chip. This patch adds
> required device tree bindings for it.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../pinctrl/qcom,wcd934x-pinctrl.yaml         | 52 +++++++++++++++++++

The bindings look OK, but remind me if I have asked before (sorry then)
does these GPIOs expose some pin control properties and that is why
the driver is placed under pin control rather than the GPIO namespace?

Sorry if this is something I asked before, I just get too much mail.

Yours,
Linus Walleij
