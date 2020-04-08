Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5422C2BA1B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 03:44:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA66320747
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 03:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cGdfvCYs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgDHDoo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Apr 2020 23:44:44 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37898 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgDHDon (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Apr 2020 23:44:43 -0400
Received: by mail-pj1-f66.google.com with SMTP id t40so198451pjb.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2020 20:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=BzBmeI/2TnvgURdgTABEkjKL9/ialW7wsv/kuNaKakA=;
        b=cGdfvCYsVTYxdFyvtiXyIUlrFfObaztauRe3y/MycYs1/0a4yzZQkvLj2gMGO/oJLG
         cI5tiz9wX1t32F8YZrUnWcyRbc/VAAS6A3lqm0h4AgqfKIXkwGrQDBXWh24nWgD2H8MT
         crVAMDTZV6iegCwW+7mGbWAKqIisl+TZMYfY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=BzBmeI/2TnvgURdgTABEkjKL9/ialW7wsv/kuNaKakA=;
        b=fHV6vpL43n1/3RTwYDQ0z6heU94oipKx8VpAJid4QvmZEdLllxRUC9t14zUu7WVXXd
         ziZtphowhOooVNiYIfQv6bLw3NEQLLRDufPJw7VUj+NJp2fDN5789+ZoMgBnFqLZudJi
         BqlhdfpYHxt1b3gTrqJ3ort9zRzVJWQUBqx4MrN2rmYjpxAS8CmHh/kiwwOaGSQSATY5
         0HxC5ohOujtL1LA9/YM0V9OXLOmY2vyOIvC8dcLCZPhvGXoQ8H2dd9Ej7i+e8Bbui0hu
         nt85U+e6Oh743u6+Q9Ux3uA0WGGuocAnuxNk6D5q1bD28GeQT6sTJKk06OUIbNofDKPn
         1vnA==
X-Gm-Message-State: AGi0PuZ4kxQXuw+SdGcQ0E0Hc5BkqvrkAbwcAyt8kh+fWEutbtDzwNO0
        DaEakWVXBEtiETiHzxaX043Kfw==
X-Google-Smtp-Source: APiQypKVwi323LzTzw+HouaYR3BrsPsn1TvXuEQQpUiatRIng2+CnAZh9u5B5FgbMx5pGkeVKVZMdg==
X-Received: by 2002:a17:90a:fa08:: with SMTP id cm8mr2893321pjb.144.1586317481187;
        Tue, 07 Apr 2020 20:44:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 25sm3001948pjg.35.2020.04.07.20.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 20:44:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585206368-685-2-git-send-email-sanm@codeaurora.org>
References: <1585206368-685-1-git-send-email-sanm@codeaurora.org> <1585206368-685-2-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Tue, 07 Apr 2020 20:44:39 -0700
Message-ID: <158631747937.216820.504748426462367724@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sandeep Maheswaram (2020-03-26 00:06:07)
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Docum=
entation/devicetree/bindings/usb/qcom,dwc3.yaml
> new file mode 100644
> index 0000000..0f69475
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
[...]
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: The interrupt that is asserted
> +          when a wakeup event is received on USB2 bus.
> +      - description: The interrupt that is asserted
> +          when a wakeup event is received on USB3 bus.
> +      - description: Wakeup event on DM line.
> +      - description: Wakeup event on DP line.

I can see that it was optional before but that still doesn't make sense
to me. The glue hardware from qcom always has interrupts so I'd expect
it to be required in the binding.
