Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17516C33CAE
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 20:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE72221556
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 20:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zpU8piGP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgAMUdH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 15:33:07 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35962 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgAMUdE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 15:33:04 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so11667946ljg.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 12:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GuTGLwwi85unK1r2EuOVeR1TE8PIkAuBbjrUABOzDgw=;
        b=zpU8piGPL9mpHkrJtOvWOmAmPCUN6/daRz0ojUt9E6UCmugQuBrK0cZ3BJlV+fRdsa
         SNBPWQlE4286crRo0WryamW09tOCSpLdrkTBOEVU0x+HhGeAIOIbqSxzogTawgl/YxZJ
         qb1WS1KFweRqYBo/grYoBBXGbxLaPDTc634U25aUFyJ6NqbH0YIpt81h0IZnUdhHN42+
         L6prwrZyvZNu131oOSNpsMe9phKAoHzWW2Cxqv38p91FaZeYzeVNfho1XhQXp7NKtURq
         YljLikhpZ41BvBqLmw9RwGzZJTgySKbDfm2AKWeETyC2vXRzUxagRWS/v3vS/ipvaWFw
         RXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GuTGLwwi85unK1r2EuOVeR1TE8PIkAuBbjrUABOzDgw=;
        b=fTDOisU6tebD2CWeDK+++w9yqCU1wobtTuJGPqaDdV5SpHOWi+9EVOxVyWo1cV6px3
         Ki+0AqPd0B0P0Kq5eYBTMWf6j8YSZyeXKQMiT0Oy9gjdNoA9Fh7ZecM1iPt7DybBieJX
         aor2cc3wBEYC720wLuUuyqPOMIwlorMwR7YDVMANrXT6F9NYBjFXig6cPIanYk432Yeb
         YXhL/+JCeemFtEriJmRYCrKKjjZdPJt75r+9cPKi+xgZk8l7uGpDLyPrwixY5jhL2Lz4
         Az9WhVPCDEB108Eev8f1kJCOQ3w38H8e50Vhwpz/roFkxQBm42WWAtYzVUip5TXGA0TD
         PLaw==
X-Gm-Message-State: APjAAAXlmNH1RdXSeSJIujdj+UV99EP5V6Q8q6jLqjy4ejtWOop+m5/M
        KFbHcXWL22eLVhMJqjTNnCVI5FlZ8oHTH6LLP6u/Rw==
X-Google-Smtp-Source: APXvYqxQgFN4EyvNsq/0cxCAmW7rkasdy2yT7fyEAdqz9b7VC2A3LZlCQUy4eUJQrf+iApcFUDBNEQ5YZAPoK1mi1Ds=
X-Received: by 2002:a05:651c:111c:: with SMTP id d28mr12487289ljo.32.1578947582550;
 Mon, 13 Jan 2020 12:33:02 -0800 (PST)
MIME-Version: 1.0
References: <20200107130844.20763-1-srinivas.kandagatla@linaro.org> <20200107130844.20763-2-srinivas.kandagatla@linaro.org>
In-Reply-To: <20200107130844.20763-2-srinivas.kandagatla@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Jan 2020 21:32:50 +0100
Message-ID: <CACRpkdY-4zfVa0xmeN1tZ_quDM9kSWgXw4RzEyU0WUZor1oR=A@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: gpio: wcd934x: Add bindings for gpio
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, bgoswami@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 7, 2020 at 2:09 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> gpio controller to control 5 gpios on the chip. This patch adds
> required device tree bindings for it.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Patch applied to the GPIO tree. This should unbreak dt_bindings_check
according to Rob, so pushing out ASAP.

Yours,
Linus Walleij
