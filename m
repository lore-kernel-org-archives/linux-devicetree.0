Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929C0C3B189
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 16:35:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EC8124677
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 16:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YxmBmTj3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgBMQfL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 11:35:11 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52406 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728270AbgBMQfL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 11:35:11 -0500
Received: by mail-wm1-f66.google.com with SMTP id p9so6976972wmc.2
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 08:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=7ggoquwaNTIaGIGrCsxu73hH4eSlanLhZjrOSvqsMIY=;
        b=YxmBmTj3SW+Wse8RG2pL7SR9RV3XrCYFzSS2BLUiCl8l62VmGJnxEuqdBfqe+UGtAf
         Disk8hZBDwTcK4PPU1RXUDLR8f/KJfIabkgPDSRhI8ofo3/TEvMYHvln0RgsGr9bH0Js
         MIkLoZPP26TtSbkQAnMosIxWnZSlT5sp0Vm1aW2EkNacD+QhZdmfaNPQriyPjgtbeErj
         sFl/6A9JrPdSO4ICLuhzyIy9vH+m/mGfGnDTnSaM2rWih2jFs+L7wWsaYU9f0IpIp7oy
         y04cuSJBxmSEEH69ViGlShsfdwrSZ/Q8xW0cjA5wXTGniLOn8P5MjYBFC3firj4MPlgy
         AEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=7ggoquwaNTIaGIGrCsxu73hH4eSlanLhZjrOSvqsMIY=;
        b=BThgPORwUVc9WQlDOtgZE463Yo/sj13+yW6AdxOcd9szSYfbLvNF4w+TTVa1ZgOAee
         HXOqWCZGOZgcVp5qINVGKGUsoAlEIOsJqr+Wm1Q8qbTlBIYtdY1HcgIBgp32wLovGMsB
         pf9tKICst56zKC+klFHo17a4DSjAnJLO+kFx0s/JNyxaPArnDUCVboUqbPmJdJ5CrHAB
         nDqSq0xUnbxSa0xr9zAud5gAvN6sMQciUXyAvxjsqscnjKIXV6+n+qr1Mua//aDCsDT7
         zS7ZarFAZq5fSPM8tXsDaAnFe58KBgeVCNdv+SUXw+79LT/MPcbquu5YMNS+q7PouM+9
         y7xQ==
X-Gm-Message-State: APjAAAUABF5IkkD9Zq6QZ2X7ybEbkpGyne1kXOztaxTsJjIMEXSxd1Jj
        2v2tPXsGIlQwhAALr2z8+MxFSg==
X-Google-Smtp-Source: APXvYqxvlqxWaCHriW4bHt4AIcsFVsaT/7IkORpPargfpB0fvDThsa0A0ZWKK8N731MNLaJGX/rA3g==
X-Received: by 2002:a05:600c:149:: with SMTP id w9mr6248835wmm.132.1581611708925;
        Thu, 13 Feb 2020 08:35:08 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c9sm3573960wmc.47.2020.02.13.08.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 08:35:08 -0800 (PST)
References: <20200122100451.2443153-1-jbrunet@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: meson: gxbb: audio clock updates
In-reply-to: <20200122100451.2443153-1-jbrunet@baylibre.com>
Date:   Thu, 13 Feb 2020 17:35:07 +0100
Message-ID: <1jftfewimc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Wed 22 Jan 2020 at 11:04, Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patcheset provides updates related to the audio peripheral clocks
> It adds the peripheral clock required by the internal audio dac
> and reorganize the AIU clocks into a hierarchy to better reflect the
> behavior of the SoC.
>
> Jerome Brunet (3):
>   dt-bindings: clk: meson: add the gxl internal dac gate
>   clk: meson: gxbb: add the gxl internal dac gate
>   clk: meson: gxbb: set audio output clock hierarchy
>
>  drivers/clk/meson/gxbb.c              | 21 +++++++++++++--------
>  drivers/clk/meson/gxbb.h              |  2 +-
>  include/dt-bindings/clock/gxbb-clkc.h |  1 +
>  3 files changed, 15 insertions(+), 9 deletions(-)

Applied
