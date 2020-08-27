Return-Path: <SRS0=DNiR=CF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111DCC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 19:30:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF56820714
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 19:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RGPVxSi9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgH0Tad (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 15:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgH0Taa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 15:30:30 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C97C061264
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2020 12:30:29 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x143so4277997pfc.4
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2020 12:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jbkAfuhZAKMTavUGq6kzae8BdLlY/pw7F8TdORnXsqQ=;
        b=RGPVxSi9400bcoNYxMs9hsfmQ4rchGqtdHPGG1HmzfnO/mDEdAuT5tnT9cnXgHUnky
         TVm59Zd6m8r3qRLSdXB4SkR6JL22i1ikeXaD9WMwU1P1CzwLXRnhMhX603ZL+Y0cxYSe
         TfSsX5C/0ae+pAAAQobQNbrfGMxlLm8VNVb94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jbkAfuhZAKMTavUGq6kzae8BdLlY/pw7F8TdORnXsqQ=;
        b=sWs7c94wrhHNGU+CqcxM/upAlp8/r2Lmjkk6sa4v1EUvbNqLTPBCNG3r6H7r8IKD49
         7wha17SuYiBU3mBeZxXEcJ5IHTvFgorcRg63BXI90cNxTNrbbdJfYp6rdqVDxJgOXuky
         YR4r8IlS20lrwBvZvCrkoDdaoX5+B+YKledIXDaczhdsVuIp8mu4vMgjvzkPlmeXK0Dy
         Kqaktt4cfUjBlwpWJ81do2stR6RWGT1oc2LfYtNRhOHTcBMw0UXXC4K9njElMbgUIv8o
         8WxQQhvlSKyy3UVw2ZXb+3ioGGG5fjCqSvuY1i6n6TcjJBdFbiUJp7BATVU7ur6W0ET9
         AvAA==
X-Gm-Message-State: AOAM532WKl2Fx/7vrWJp7N2DJ9Ln6I+N8dEeUHszsHSs1dJ12C4sXBsv
        KDzXCw86FkblR8yLs7MZ/qF6jLJWU4PhzSAO
X-Google-Smtp-Source: ABdhPJwCOi62uMlXfcPonmuVECt3/Iv2jH+EgupKyrvs9JK9fe/kDGN2+VGdJJMTP/OzZaxkjeSwnA==
X-Received: by 2002:a05:6a00:228f:: with SMTP id f15mr18055805pfe.222.1598556628896;
        Thu, 27 Aug 2020 12:30:28 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id f13sm3633868pfd.215.2020.08.27.12.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 12:30:28 -0700 (PDT)
Subject: Re: [PATCH 0/5] qspi binding and DTS fixes
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        "maintainer:BROADCOM SPI DRIVER" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Yendapally Reddy Dhananjaya Reddy 
        <yendapally.reddy@broadcom.com>,
        "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200827181842.1000451-1-f.fainelli@gmail.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <5afe8762-c0a3-ff10-5946-0eb2e7ddc0e5@broadcom.com>
Date:   Thu, 27 Aug 2020 12:30:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827181842.1000451-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-CA
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Patch series looks good.

Acked-by: Scott Branden <scott.branden@broadcom.com>

On 2020-08-27 11:18 a.m., Florian Fainelli wrote:
> Hi all,
>
> This patch series fixes incorrectly defined compatible strings for the
> Broadcom QSPI controller which resulted in the strings not being
> ordered from most to least compatible.
>
> We will need to apply some changes to the spi-bcm-qspi.c driver in
> the future to assume no revision register exist, and these patches
> are a preliminary step towards that goal.
>
> Florian Fainelli (5):
>   dt-bindings: spi: Fix spi-bcm-qspi compatible ordering
>   ARM: dts: bcm: HR2: Fixed QSPI compatible string
>   ARM: dts: NSP: Fixed QSPI compatible string
>   ARM: dts: BCM5301X: Fixed QSPI compatible string
>   arm64: dts: ns2: Fixed QSPI compatible string
>
>  .../bindings/spi/brcm,spi-bcm-qspi.txt           | 16 ++++++++--------
>  arch/arm/boot/dts/bcm-hr2.dtsi                   |  2 +-
>  arch/arm/boot/dts/bcm-nsp.dtsi                   |  2 +-
>  arch/arm/boot/dts/bcm5301x.dtsi                  |  2 +-
>  arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi |  2 +-
>  5 files changed, 12 insertions(+), 12 deletions(-)
>

