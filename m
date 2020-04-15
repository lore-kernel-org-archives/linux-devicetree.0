Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB23C3815B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 19:17:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBC0320771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 19:17:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=anholt-net.20150623.gappssmtp.com header.i=@anholt-net.20150623.gappssmtp.com header.b="JCVZVhXe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505514AbgDOTR3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 15:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2441781AbgDOTRU (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 15:17:20 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C20C061A0E
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 12:17:20 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u10so3535777lfo.8
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 12:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Li6Tf7eb/94qSjOO3SfTTxWgQZS96NjwL2/MTelfTs=;
        b=JCVZVhXeCt1StGEKOwQldZeE69vytts+PPBX/IEVT+TCFBmAPjCojq/XLChUGiQcWh
         rn5v+40mBZ7oBZtKcDKjEMJhY4Odhnvn7lLpMeoKRsDCbRpp6oo6+LTHZeebtyMXE0MV
         ipVKSr1WJWA/P62XD4l1DsnxFAUqoo/c+SQi2LkH9cgNH2GNpUgTS5eI6s8tQaknb8eM
         OHXwDebhW8JZLdGF163fgUPSdbM3U94zhx/8Ii3dDwXfQlIXp1QcxXwxwoPOJOMwWR/6
         CrKwEvBWQWuqhAjMf+OUI5ETWs55JmyxbiQSgjvhmFQo1/+wSNF/nqMDsW4Ctsv+3sFk
         U12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Li6Tf7eb/94qSjOO3SfTTxWgQZS96NjwL2/MTelfTs=;
        b=Hj67pDqYPtSKfNt7qEYLnvR1soNcYkrhYml44HJMyI7SUgQtbs4AfDDW3ZdmadbBKG
         E+S5ik7X1HpdkTNnihCeajZDJ8+UNSIyY7ysAGPjCZDbdj2+2RauOJ774baOFMMuyKtr
         oSV0OXyJWMWTgkIZisNsvJhdHLoOmXdnPtylFlpNG4ZkJftx4d6qw4zk/BnbXfFMkUGU
         +Nix9Mr1TWe9Lg2O1/Rd1AivL1wmYsKadZmud96HP9CJ+yqCaRAa3ywkmnK1sv0fhe3f
         AlCTkl/y6ghcEA6Cp4e9tyHbb/HFB88c9Lx3fGq0xDvop5AxuOLT4Ywj56pNUYdwk9UX
         R5Tg==
X-Gm-Message-State: AGi0PuZNCsxJ26InUdM4PgVYGkK9JCsrvUjBuitGqb4UDECszxYQlASW
        +V96Ejnynt2dDu4j9mh2TBu6ZR/7F9yLz3rDRB2fQg==
X-Google-Smtp-Source: APiQypJw4CeUT45MAbksOXKhbBHlaf00wE31zM5ZLC/zDaXhf/09xcV158G7zniXKFzLj9VS2oryuZ+szRrdLMbITKE=
X-Received: by 2002:a19:d3:: with SMTP id 202mr3873367lfa.24.1586978238610;
 Wed, 15 Apr 2020 12:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200415144233.23274-1-nsaenzjulienne@suse.de>
In-Reply-To: <20200415144233.23274-1-nsaenzjulienne@suse.de>
From:   Eric Anholt <eric@anholt.net>
Date:   Wed, 15 Apr 2020 12:17:07 -0700
Message-ID: <CADaigPXwfjd-HoOtBm_fuPQ9eh7AKTaJx+ocLsppPFdL3Cr4jg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: bcm283x: Disable dsi0 node
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 15, 2020 at 7:42 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Since its inception the module was meant to be disabled by default, but
> the original commit failed to add the relevant property.
>
> Fixes: 4aba4cf82054 ("ARM: dts: bcm2835: Add the DSI module nodes and clocks")
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>  arch/arm/boot/dts/bcm283x.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
> index e1abe8c730cef..b83a864e2e8ba 100644
> --- a/arch/arm/boot/dts/bcm283x.dtsi
> +++ b/arch/arm/boot/dts/bcm283x.dtsi
> @@ -372,6 +372,7 @@ dsi0: dsi@7e209000 {
>                                              "dsi0_ddr2",
>                                              "dsi0_ddr";
>
> +                       status = "disabled";
>                 };

If you've confirmed that vc4 still probes,

Reviewed-by: Eric Anholt <eric@anholt.net>
