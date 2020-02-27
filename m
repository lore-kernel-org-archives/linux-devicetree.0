Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C8DC35DEE
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 17:12:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD3A82469B
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 17:12:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PjgAbV5i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbgB0RMb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 12:12:31 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45894 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729161AbgB0RMb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 12:12:31 -0500
Received: by mail-pl1-f195.google.com with SMTP id b22so31222pls.12
        for <devicetree@vger.kernel.org>; Thu, 27 Feb 2020 09:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LOyT5HvsVh4qMzW2jHlKrfdY1wfzL0iwi9fyqr1yxSg=;
        b=PjgAbV5itjXELWeRURFWOnDxWWgcVNwTRbKN2F+s+aCnI9XkbVuKaH4FNVfqdZu4G5
         yaJvoev4JVjgNE6vi+yAEwMkJYjpq08qN3rOQ2jp1J56AjF5IG+vP5TnBmhH4OwFiWh7
         qq+AMuXQdOVTlquHBCsVZzjJP9BHQdHP1sa1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LOyT5HvsVh4qMzW2jHlKrfdY1wfzL0iwi9fyqr1yxSg=;
        b=BmYVPFUQCa0qqm/UboORsjOI87IHSWS4DUinaNvPtgtTRyCe5OqviZ2UTpjdF3ORvA
         Bj8Gw75W+qD05LeNHKZ4X7ak0/pJdQPIz4oLRdwIXvsW4oMZIsVRAyr02v+UHeo3yZuf
         DDaRU7JnqQCsYT7eighNYgEDMFhiPx7ebDgP/UTfj8JOy+rg5LLI6XUDsAUfRRtm/Tqx
         NMwgAENmVxS60b17ygGpKJIAd+gjlHbJ+1HO+3VU70VOSFEMm+pbTFqk5h6XgrvMLTM/
         kQhElVOudZcJGF+uMjNhVZjql2D1rkVAEOPSARWhwOZMliLd3nC1vYUwmSqOxUkCqWW/
         AqTA==
X-Gm-Message-State: APjAAAVBt1ZLU36IQ80HwjIdxcIxmBw1NXW4jjGNbY4MAwlfyyTxW3RP
        fey6OAs0Q/ZuCW1aUB6ConW53Q==
X-Google-Smtp-Source: APXvYqx6fZfhqq+ecXx0OzqoQNR179JoYOMacTaNfi38ToDP70lt0Yh233FkLgWk5lXrSVbcwJbSvA==
X-Received: by 2002:a17:902:8f94:: with SMTP id z20mr741978plo.62.1582823549030;
        Thu, 27 Feb 2020 09:12:29 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id k1sm5789477pgt.70.2020.02.27.09.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 09:12:28 -0800 (PST)
Date:   Thu, 27 Feb 2020 09:12:26 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Odelu Kukatla <okukatla@codeaurora.org>
Cc:     georgi.djakov@linaro.org, daidavid1@codeaurora.org,
        bjorn.andersson@linaro.org, evgreen@google.com,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        ilina@codeaurora.org, seansw@qti.qualcomm.com, elder@linaro.org,
        linux-pm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org,
        Amit Kucheria <amit.kucheria@verdurent.com>
Subject: Re: [V4, 3/3] arm64: dts: sc7180: Add interconnect provider DT nodes
Message-ID: <20200227171226.GJ24720@google.com>
References: <1582646384-1458-1-git-send-email-okukatla@codeaurora.org>
 <1582646384-1458-4-git-send-email-okukatla@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1582646384-1458-4-git-send-email-okukatla@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Feb 25, 2020 at 09:29:44PM +0530, Odelu Kukatla wrote:
> Add the DT nodes for the network-on-chip interconnect buses found
> on sc7180-based platforms.
> 
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 95 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index cc5a94f..3e28f34 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi

v2 had:

+#include <dt-bindings/interconnect/qcom,sc7180.h>

I think we still want that, otherwise some patch that adds an
interconnect configuration for SC7180 needs to add it (see also
https://patchwork.kernel.org/patch/11386485/#23187545)
