Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B53AC2BA16
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 15:29:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13BAE206C0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 15:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KTj0IrJ2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgDHP3B (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 11:29:01 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:44686 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727049AbgDHP3B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 11:29:01 -0400
Received: by mail-pf1-f181.google.com with SMTP id b72so2539788pfb.11
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 08:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2pDvcotqin9MFYotH20Ddvllc4oEen5KJQtcAktMMZs=;
        b=KTj0IrJ2HYAK/59HA7DR7goXWRl3VWt+FPwtTBivhZGMOp5zfVeZ5FfDBBCByd5HJF
         8y3lJWN/RC/xvlHZ4yDlKm3DAfqcRmuaryIa+n/7T4TZfvcTl/rjq3WRQ21OFXlh8HZ1
         ALUtiRUJPWuVq7rJHIiMWgZCPemzlXjOqYQhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2pDvcotqin9MFYotH20Ddvllc4oEen5KJQtcAktMMZs=;
        b=XyRjWGs+6YQQCXJ7IzzYAYrj6/JRhtRlthbPjPy65BWQ9TlxeEiAptV82A93bGcIzQ
         YZ5vKiy3498Nhj5L4IRmK4ecnsaDomf3XnxtREF4iRls8Ks8Bn1aUlsg58whVRgu6g20
         hHwRp+SjnbqFcJet7/XmYd3BU4j5pBiCoHA/Y1FtYu8tvPf1kRl1QhCChY5uua7sUMTJ
         BJ1Houo16f3oJr3tHM8HnX0hJQX8z+6cLy3vhTxQQq4RHFtUoQ5Frk7ocf6W3JsFRcPg
         b9KjV9by+8MPT/uYyOeID6RUmK5poy9YczpOFWKlJ9coRYFFT5IX2x27KozCqxPDUIQn
         RlTw==
X-Gm-Message-State: AGi0PuZKOAMYIwanfMYlTBpGmNRMLEYKQEuKFM7d9bAs5ewQkgdTJcuS
        scPesQuyeuw2tNHHNv7pPHLe7JbcZ78=
X-Google-Smtp-Source: APiQypL0dFWqmYYPHJR/xzqr452lvZynkyyc9FJgf8r+0JiGQT+bUbzUi0CHhIDn4joIVcezIiHgNg==
X-Received: by 2002:a05:6214:421:: with SMTP id a1mr147157qvy.185.1586358340717;
        Wed, 08 Apr 2020 08:05:40 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id l62sm19196314qte.52.2020.04.08.08.05.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 08:05:40 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id v38so3744563qvf.6
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 08:05:40 -0700 (PDT)
X-Received: by 2002:a67:2b07:: with SMTP id r7mr6540930vsr.169.1586356481775;
 Wed, 08 Apr 2020 07:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <1573220319-4287-1-git-send-email-ppvk@codeaurora.org>
 <1573220319-4287-3-git-send-email-ppvk@codeaurora.org> <CAD=FV=WGUasS=UZxFeSS0Cg=9WxHPMWVFyYae7CFmOxV2_yhJw@mail.gmail.com>
 <001601d60da5$630168d0$29043a70$@codeaurora.org>
In-Reply-To: <001601d60da5$630168d0$29043a70$@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Apr 2020 07:34:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WR0YBp7ah82Kg7RzxHdO8Agf5uGNb=58iApShXqbum=A@mail.gmail.com>
Message-ID: <CAD=FV=WR0YBp7ah82Kg7RzxHdO8Agf5uGNb=58iApShXqbum=A@mail.gmail.com>
Subject: Re: [RFC-v2 2/2] mmc: sdhci-msm: Add support for bus bandwidth voting
To:     Pradeep P V K <ppvk@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        linux-mmc-owner@vger.kernel.org, sbhanu@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Wed, Apr 8, 2020 at 5:58 AM <ppvk@codeaurora.org> wrote:
>
> Hi Doug,
>
> You no longer seeing this warning stack with the latest patch set.
> https://lkml.org/lkml/2020/3/23/407
>
> The latest patch set is based on OPP framework and no workqueue's used to queue the work.
> Can you give a try with the latest patch and check if this helps ?

I was only analyzing an error log provided by someone else.  I will
let them know that they should make sure they're on the latest patch
series.

-Doug
