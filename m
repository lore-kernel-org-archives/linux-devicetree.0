Return-Path: <SRS0=eKwZ=3A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05832C282DD
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jan 2020 20:50:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C372920842
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jan 2020 20:50:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hJUBjxnQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731157AbgAKUut (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 11 Jan 2020 15:50:49 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33986 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731128AbgAKUus (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 11 Jan 2020 15:50:48 -0500
Received: by mail-ed1-f68.google.com with SMTP id l8so5033651edw.1;
        Sat, 11 Jan 2020 12:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z1allRQVVIcRb3GsPlExTsGVhorTeSQyvjX+yCE+qh8=;
        b=hJUBjxnQ14Mkg+v0KZ6c/t3nrYWqpGIc4sggWABjJRnGUyE8mJZqSJlWevR+X2pXLM
         LQSpClltwxH4ooVGw4tHTB7JHmbb1UXYc905RnfaGPl+4J7rl3o46naKcJtWdi3V6V56
         /TMMbfEbpBJ01C3LFZPaUGan+dJaiT4c8Pxd94x0Ut8sbRA97vGiBJNbgq7xGxIxQnhp
         Up1nQRDJ9JeBKdnQU4B6yRXhH6N57MPmMCHXeoyAEHpZzEykyCldLD1aQkir+dw1Pn+F
         FBUrNk6ERO1+Vf5Gx12umJkOkHkqBzc16yNhfNr7QJmEIdJfFGeCXpUUCgI4JdMUqm87
         Rpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z1allRQVVIcRb3GsPlExTsGVhorTeSQyvjX+yCE+qh8=;
        b=Q0OTccCZvAuHwL8evYVPxXS/EVeWUihjlJ2zK/Er6fxVv0ZEvxRbzmIZUOMQrrHBUF
         nQt23uob9Ccl01Np3cLXKsKODW/JYkW0NiHjaU8wyeeyjX4hvN3YNdNgYznjfQB9tYIo
         o9PpGQabpZwFtdYP9pNvjtCK9g1qNcdd5TSZMM4hO3Z8Cp4FfX/624MNVYAtdJ1LdDpk
         9U/ZzHyqWG2D8Z16wJViVD/YbCzvNdEKaqv1CFvixw4SjQGROrSXWtERF0miWKoZxjbf
         wvawa7CrF2pPeZPo4/9GSv49suIgFnJfPXYVil9ChVEq9qgoZSYxxIGhDjOnanfs/mzy
         WPNA==
X-Gm-Message-State: APjAAAUYL65Mv94Jj4Ppqo6tqGibbNwFh14Sp7Col4CTtg4c9JUqyUnM
        OfwmB1e9ifw/+FamRsJNy4XCOD4t5FeElQcfRo8vfvlK
X-Google-Smtp-Source: APXvYqwtaXUZxukv72KXhDvEgYsMrVJcbOLsej/ezPWjeRTXXD9cuqhLaJNWOoMJYBnJuHEu/7anl+4YWFW8qwXN598=
X-Received: by 2002:a17:906:27cb:: with SMTP id k11mr9466692ejc.301.1578775846889;
 Sat, 11 Jan 2020 12:50:46 -0800 (PST)
MIME-Version: 1.0
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com> <1578634957-54826-3-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1578634957-54826-3-git-send-email-hanjie.lin@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 11 Jan 2020 21:50:35 +0100
Message-ID: <CAFBinCCZSBWdKQwmcvponuUu_aiTnDCyRiPqKDgqfNkJQoq06w@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Hanjie,

On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
> @@ -37,6 +43,11 @@ properties:
>
>    clocks:
>      minItems: 1
> +    maxItems: 4
the driver parses one clock for G12A/G12B/SM1 and three clocks for A1
if there is a fourth clock: do we need to manage it in the driver?
(note: dt-bindings always represent the hardware, so if there's a
fourth clock which the driver doesn't need then it's perfectly valid
to describe it here. a comment which clock this is helps in the
code-review process)

> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
I let Rob comment on this, personally I prefer naming the clocks explicitly
also I think clock-names has to be a mandatory property for A1 (see
Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
for an example which makes properties mandatory depending on the
compatible string)


Martin
