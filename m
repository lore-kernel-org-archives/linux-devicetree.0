Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20553C35673
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 01:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD13C205C9
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 01:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n8isivMf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbgBXBS6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Feb 2020 20:18:58 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40602 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbgBXBS6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 23 Feb 2020 20:18:58 -0500
Received: by mail-pg1-f195.google.com with SMTP id z7so4250436pgk.7
        for <devicetree@vger.kernel.org>; Sun, 23 Feb 2020 17:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zT10dhFzTQfQk4qZLNGzW74d8YteQDI8/eIgEFfv+OM=;
        b=n8isivMfbvLTUE8W5OF33bsEQHbC9GWAfYDMGxgEsCd67xnLu5gDVB9DXvZR6Rsx1O
         55Mu59uQZ9ycLOFST2i7wZ7g5Hz2Km/BWEoh8CuZd9UfD8ypdnoG0zR2phZcKA7ScuyY
         3/UoFGfVGlgcXlM70PiZd0OSnnRxK7cvW1Uw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zT10dhFzTQfQk4qZLNGzW74d8YteQDI8/eIgEFfv+OM=;
        b=dASTcjOn0mjc/2ectxYAddyMAl17NQbsvdjmymnRhM2S132egHviiOX/uBQ7E/S7Ky
         nJ3CFRlG/cbSWf98fcw56EkkAIeazsOLXOWqQB85BVBQwyco3wlW8s0+eLAFZT7tCfjH
         d/iVT0Sg7OY1aMW48d+W+FEDRD89nVHo19Yq3HNEOxVWyRZCAxtqU81zcNF0t5wMWoTK
         0aeNIYn+XSmCAU4URddkT/XztFMjk5NOf6YrJdZMCHevA8Cl/z6KIlTcu5+Muei1Duhh
         BchBT8SUl3YxnT/I0A5fBUXg8m0zlrrOfdQCUg5IKYzQrKdbffYLJfB7jm/t80r2PjQj
         SBtw==
X-Gm-Message-State: APjAAAUzthcyE9kUqiNJL/luPXFOW6Md6aBo6EAeFpD20czPy2fQFX82
        yuokG1wqXX1MVfCqge5mX5TOAcjhWJy2aA==
X-Google-Smtp-Source: APXvYqx9UHYEkJPSozrRHLjxQr35exznoN/y90RQUV7PTu9EUqqiaGx5x7QZTKecywt4McSGOEMrjg==
X-Received: by 2002:a63:1a50:: with SMTP id a16mr49365222pgm.389.1582507135940;
        Sun, 23 Feb 2020 17:18:55 -0800 (PST)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com. [209.85.214.169])
        by smtp.gmail.com with ESMTPSA id v29sm3026344pgc.72.2020.02.23.17.18.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2020 17:18:55 -0800 (PST)
Received: by mail-pl1-f169.google.com with SMTP id t6so3364451plj.5
        for <devicetree@vger.kernel.org>; Sun, 23 Feb 2020 17:18:55 -0800 (PST)
X-Received: by 2002:a1f:add3:: with SMTP id w202mr22215488vke.30.1582506662987;
 Sun, 23 Feb 2020 17:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus> <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
 <20200219232005.GA9737@roeck-us.net> <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
 <e42320b8-266f-0b0e-b20b-b72228510e81@amlogic.com> <CAODwPW94KX46PzSrf_uuEFPKudXor=26d=g3Qta5veRfxmMDUA@mail.gmail.com>
 <1326f594-3cfd-c03d-4f2c-50eeb75724b2@amlogic.com>
In-Reply-To: <1326f594-3cfd-c03d-4f2c-50eeb75724b2@amlogic.com>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Mon, 24 Feb 2020 12:10:37 +1100
X-Gmail-Original-Message-ID: <CAKz_xw3z7uXtK1SQKYLu_oP3GmqKR7RXvWj2b1cfyZO-Q-ZxQw@mail.gmail.com>
Message-ID: <CAKz_xw3z7uXtK1SQKYLu_oP3GmqKR7RXvWj2b1cfyZO-Q-ZxQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
To:     Xingyu Chen <xingyu.chen@amlogic.com>
Cc:     Julius Werner <jwerner@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yonghui Yu <yonghui.yu@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

I think the intention is that this driver talks to a 'standard' arm
smc firmware watchdog call:

https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405

Each device could re-implement that ATF driver to talk to the specific hardware,
and could perhaps use a custom SMCWD_FUNC_ID, defined in the dts.

The goal was to provide an ATF patch and linux driver patch that would
be generic. But the above ATF patch
is only for mt8173. Right now it just specifies an interface. It has
less functionality than your meson driver Xingyu.
If it is not suitable, that is fine.

The above ATF patch is deployed on oak, elm, and hana mt8173
chromebook devices, this driver is intended to support those devices.

Evan


On Sat, Feb 22, 2020 at 3:01 PM Xingyu Chen <xingyu.chen@amlogic.com> wrote:
>
> Hi, Julius
>
> On 2020/2/22 3:41, Julius Werner wrote:
> >> Because the ATF does not define standard wdt index, each vendor defines
> >> its own index.
> >> So I don't think that the current driver[0] can fully cover my usecases.
> > I think the best way to solve this would be to put the SMC function ID
> > as another field into the device tree, so that multiple vendors could
> > share the same driver even if their firmware interface uses a
> > different SMC. But they still have to implement the same API for that
> > SMC, of course, not sure if the Meson driver is suitable for that (but
> > if it is then I think merging those drivers would be a good idea).
> The SMC function ID may be solved by the DTS, but the wdt indexs(Eg:
> SMCWD_INFO) are also different
> for each vendor. The imx_sc_wdt.c is also use the SMC to operate the
> WDT, but the wdt indexs(Eg: IMX_SIP_TIMER_START_WDOG)
> are different from ours. IMO, If the ATF can implement a common hal
> interface and index for watchdog, then writing a
> common smc wdt driver will be easier to compatible with all vendors.
>
> Best Regards
> >
> > .
