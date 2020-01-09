Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FF6C282DD
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 17:12:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3974A20721
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 17:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NZk8QVJ4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731544AbgAIRMX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 12:12:23 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33782 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbgAIRMX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jan 2020 12:12:23 -0500
Received: by mail-ed1-f66.google.com with SMTP id r21so6301606edq.0;
        Thu, 09 Jan 2020 09:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m5bKqTGzATt6X20fwIM187YSSZ5nrekRXnj5LVqJY7Y=;
        b=NZk8QVJ4WAq4R3o1D9+VK4ZSDQSQK7dvbRBf4AMuCjvRavx3veVI/WQdqKnErpQRCi
         Eds8ghTPfv2hOFlO+55g+LMIJEC7O2+PJrmajsk7a7ZfOWWf5KbxCbL/TWpXi++9cpKv
         8aBr2fKChY5SkaGsOnqjfiEUsrybPtHq9g0CK6+sssK3HgBu9YUvbopeuATcEF0PO0xI
         tnC5vORlB623hwx5NeI+ql2fbwiqXj1AbZ3c4BjnMQ4f+ysx6m5kguWC8Xg/dyYQZMHs
         84dkmKBvzqz1rcILrG2brbxH8W0Sy9kKfMjsWi3uGO/8Fpsg4osgxmdB1wnTfL9aO7BA
         1/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m5bKqTGzATt6X20fwIM187YSSZ5nrekRXnj5LVqJY7Y=;
        b=LUJDij+H1uFL0KNaCOS3YO9lU3OJa4LZXgjk7WB1MoxAhTt1P5Ayt7o6wknskqq4As
         8Hoo9c+p9GkGHHLtxJ2ctegerQ5XAw+qVtKz8xzw3btQbkR9C7GFWE3byxcYzkouRUFh
         o+HwyEXpaqV6LydbfDeHJaED1cpDQILrEeMKJHzk8RsbuRhyrJ8yV6Gcjldwrpkq8NCS
         SB8kO262G/w9MytU2I1IAiO3R88YW3e05oMZZqRRd9Tet7TRyuHVDfj1V2P5ATR9LCUc
         p/NIP8bpDk4+vI3TgVY/O3cxItQrL54KhZPplReuWaeTAcc37ylMsc15oFhed1IofySs
         1SBA==
X-Gm-Message-State: APjAAAWAGwKOl15iWpLP4/RHK07kCNwEJLfbIn3Zvnk/MktLTaGDee7h
        BlTa9wDABsVFKIKDVjmhxyW7K6mfzKrWF2207M8=
X-Google-Smtp-Source: APXvYqyLdglBvA5azqE41oQ6/P+wJuoQqzv1gmvgl8pOyKv1FX2KnStTQwNTBWRxCdUkXCCfXmw+cXn4c4ssjYI5N3Y=
X-Received: by 2002:a50:fb96:: with SMTP id e22mr12160409edq.18.1578589941734;
 Thu, 09 Jan 2020 09:12:21 -0800 (PST)
MIME-Version: 1.0
References: <1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com> <1578537045-23260-2-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1578537045-23260-2-git-send-email-hanjie.lin@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 9 Jan 2020 18:12:10 +0100
Message-ID: <CAFBinCDt97E4236obhm0GV58MtoC2qYAZbqPoJd8tyROGW4cvw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
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

On Thu, Jan 9, 2020 at 3:30 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xtal_usb_phy
the "usb_phy" part of "xtal_usb_phy" seems redundant to me:
it's the XTAL clock input (this is what I'd expect as clock-name) of
the USB PHY (this is already part of the node name).
in addition to keeping the reset-names consistent (as Neil suggested)
please also use the same clock-names as G12


Thank you!
Martin
