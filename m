Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7716EC2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 00:48:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F609206E9
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 00:48:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XXLAHVjC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgDVAsS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 20:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726012AbgDVAsS (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Apr 2020 20:48:18 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EEFDC0610D5
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 17:48:18 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id y19so129126qvv.4
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 17:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DXWORpjRxTkR+i2fu0N9aGTa6+ZQqTZNmK158+3pxDo=;
        b=XXLAHVjCxmQ0g6P2WSs/mW+8skAgEVSeb5nc/EBOC+NLqjYIAm5C09vy+AXo9NYmfF
         NuHUkcuMDH0a1DRZzGjmt54BElkiJlno6nBpxUT0EPKcmqSA4/bYO2WbY7dzaNrsqOn5
         cyDQd1ZAV0QjIHtu5L4OU2ziPMQrf7AdumzEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DXWORpjRxTkR+i2fu0N9aGTa6+ZQqTZNmK158+3pxDo=;
        b=d4toMjS6k0v6uvv/TSgSvnBOZO6qOkzlYrACWY3ktyr+EP7qvn0JwAfSr/SuRcH1ZE
         4YK09IvBL+vxSzX9sCqg1swI4126y95cvGQECF0yYt3CHPVEL6kx7ISp7l+Q74M6/aqq
         3Qrj/IQ0EMysXjAR2B+MZtS78JMKgi68e38tymG3lVUGUU2A52OEBdhhT1vtzyb8bFQX
         xN0kX0bg1J4rmsGsoKo6nefonI5rmeo/vyrnzlpLWJwVr7Bl1guL3qQvSTpoOjAMHAO0
         E6hfLppRN716BFDOEhjx4WPDgzJdMBskxKzKWEEY0Mn9qagNw5PC+6if4z2oQkqFNaYE
         LdKQ==
X-Gm-Message-State: AGi0PubuJgDQEI1cUQrArikQUNZ64pR+evY4XzhOrrbvUPcswxha5QaC
        cSeuTui9ycnJYnMdPsUsl56rAz6y/7w=
X-Google-Smtp-Source: APiQypKGzEaw7SUBT+2VRkvDogQ25OFhH3cA0W7eKErh69RRPMOeBW2EU/vg6mYQFThrLLNqfJyZpg==
X-Received: by 2002:a0c:c506:: with SMTP id x6mr4807857qvi.188.1587516497401;
        Tue, 21 Apr 2020 17:48:17 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id u27sm2899650qtc.73.2020.04.21.17.48.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 17:48:17 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id a9so294095ybc.8
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 17:48:17 -0700 (PDT)
X-Received: by 2002:ab0:592c:: with SMTP id n41mr14287181uad.73.1587516064329;
 Tue, 21 Apr 2020 17:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200421110520.197930-1-evanbenn@chromium.org> <e81737bc-9461-0fdb-245f-d88bdde8f0ee@roeck-us.net>
In-Reply-To: <e81737bc-9461-0fdb-245f-d88bdde8f0ee@roeck-us.net>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Wed, 22 Apr 2020 10:40:37 +1000
X-Gmail-Original-Message-ID: <CAKz_xw0wAN4rG8xF1Y7amshoECJAjiWNDFQ5GQHPAbCfXi1bDg@mail.gmail.com>
Message-ID: <CAKz_xw0wAN4rG8xF1Y7amshoECJAjiWNDFQ5GQHPAbCfXi1bDg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor Calls.
To:     Guenter Roeck <linux@roeck-us.net>, Simon Glass <sjg@google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Julius Werner <jwerner@chromium.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> Subject says v2. This is confusing, at the very least.
>
> Guenter

Apologies! I am using the patman script, it threw this message that I
did not understand: 'Change log for unknown version v3'.
And I did not spot the issue in the emails before send. Not sure why
patman worked for v2 and v3 but not v4... I will take a look.

Evan
