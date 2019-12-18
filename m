Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42DAC3F68F
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 12:27:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A47282176D
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 12:27:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="P7i6gL/7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfLRM15 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 07:27:57 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34370 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfLRM15 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 07:27:57 -0500
Received: by mail-lj1-f196.google.com with SMTP id k1so1275873ljg.1
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 04:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+/GGE8/3NVkfYj18053TgeJg9egAYk1bKBYKsUh3cso=;
        b=P7i6gL/7KtPDnAtZpa42UmKP1yny++PGg1kyuITSJ2lQR0L2RhayY9xuBE/UTG/sLd
         boq3gIiJdbeoSIe9K7JPz5x/a+aQWVXtQaLPsHJOJ8pphhpwo+tn5xrgw1X4ee5S3Joh
         T9L0yLHyu/Q0zwMvkWEAwyQ1kgDPrMLSwbPtyXSgaFA5lbJS0AnpfTgIcm9tbHGxcKIV
         i4fBpD5oz+o6O1Dly5N0oZL3zCjysgPp12PD/kSQwuFpmAeflM+7ojt69Gx+LUxTHTRO
         HlGlBvWoJGXpqYC2OZ0A79+5cXCMPlJwCvWIv+TO05n3sQmhwbflGYPQRCy1vLTLdGVB
         6itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+/GGE8/3NVkfYj18053TgeJg9egAYk1bKBYKsUh3cso=;
        b=sYOKMI5Ui9NeA+WxIzPGr9UbOjxXj9nZR1AZDNcOhJH/TeIRzJRfV4ar3q8SfqdtPn
         4X+DE4BYIPQC7v8gRHw3x18Mg32w4lpSRNJS2rXDue8UlAwMklPg/g6dgZpAln04DvwT
         eRJvNkoOseVk3sFxpFVIHsVjh+yWaBredzWy/2RaYvdPaQFFJcuC6PCTXZofvJaAhtGJ
         PjMaMXNfuZE80wEZUeTYIOQXvdGRuizeyG0BA1iozXCa7ChzWgSQJZ8EPLa9hdZRTtDC
         60QtCUfHO6/8B+J0cG/Bg6GAcGCWwB+tu+CCnHlGWHcqkSD+BLlImcd5CtjPUXbrjljz
         2mpQ==
X-Gm-Message-State: APjAAAU4aZhMAiW+84JmTxMuAdJcAuqqi4beKxZ0LYoAulCyWVf1IrjA
        InrRHyCdO3ZZuSYgAnm8TRHWIA==
X-Google-Smtp-Source: APXvYqzprS2f6hq+LyvlD9owjBNNN5xf/aAqVUPJvcHaNQqx34kFX04QzZLRfxaC3B204fRVzYVNDw==
X-Received: by 2002:a2e:854c:: with SMTP id u12mr1491154ljj.135.1576672074962;
        Wed, 18 Dec 2019 04:27:54 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:48d1:167a:a0eb:a81d:ed95:7846? ([2a00:1fa0:48d1:167a:a0eb:a81d:ed95:7846])
        by smtp.gmail.com with ESMTPSA id g14sm1073933ljj.37.2019.12.18.04.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 04:27:53 -0800 (PST)
Subject: Re: [PATCH] clock: renesas: cpg-mssr: Fix the typo
To:     Biju Das <biju.das@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <1576667390-29449-1-git-send-email-biju.das@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <2368e2c8-7f80-ec22-2c9f-4f719ab347dc@cogentembedded.com>
Date:   Wed, 18 Dec 2019 15:27:52 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1576667390-29449-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 18.12.2019 14:09, Biju Das wrote:

> This patch fixes the typo %s/r8a774a1/r8a774b1/.
> 
> Fixes: 1000393 ("dt-bindings: clock: renesas: cpg-mssr: Document r8a774b1

    SHA1 should have at least 12 digits.

> binding")

    And never break up the tag lines please.

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
[...]

MBR, Sergei
