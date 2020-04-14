Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DCFC2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:30:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44BCD2076A
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:30:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DI0GDNcW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633133AbgDNUay (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 16:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729298AbgDNUas (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 16:30:48 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2354C061A0E
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 13:30:48 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x3so465678pfp.7
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 13:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=fSEFHqlQPWjh+eO1zQvk6FlxgyhPbRWA0nRwzXY+ICo=;
        b=DI0GDNcWCaSKUzojr44APUQ2g87h7tlXam1IW/LVnZhwiGN7iX2KJtlZI5R+UiNDfu
         DZF+uvx/5gEssBaQxrGn4yJQ3UomR6yu12eYC9INAa7bhWe6L3xj6e4qV1jmHXr+apyW
         1Br2PWFOsLPo73h3of8BD4ggO6KRXWFIckqv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=fSEFHqlQPWjh+eO1zQvk6FlxgyhPbRWA0nRwzXY+ICo=;
        b=hO/kbah0BxGgVWsTo8TwvsdctBpoDONjBhPSGWWBsiqsbJvKoNT1U2vV2wmtHBtD/A
         a4d8fXMD67u9iSMEXPFf1+QTaHHwAmwDDij6Oaxqz0mK4BFptmQP28JkaNiecU4NINyZ
         gBQjbUWGChdmt6ZnabsmGFcWBtUBnm0jxzJOXAKQFAqEXSobqF6flI4IUydP8TK94sVB
         HvXo+RQ6f8bEO6L/o1PVb1b4lTOCUgxY4bN7JeYFMXvFKTAJIW+ZM0VP6seG2HC+1M4M
         U59q26Z2Ib1aphk5COcj6w0c9/Mw6l8D8Yu0sYSgfAhJVC6vNyQ8swWComoohPe1hoOE
         kdFA==
X-Gm-Message-State: AGi0Pubo9gna5ruTSCuvKxysBcxd1J5VYgIVUylDMXrPZu0/2laACHQ5
        STbwoUBe9E1TMBrtE8Rg9AtNbA==
X-Google-Smtp-Source: APiQypK7j30AyIlG7FThLusdHeZXiMK6nQsQdNpWtZSQ6V+9S0RcjrpG2nccWcW5xJlP3E2y/EjX+A==
X-Received: by 2002:a62:27c2:: with SMTP id n185mr24066849pfn.203.1586896248214;
        Tue, 14 Apr 2020 13:30:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m3sm11025978pgt.27.2020.04.14.13.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:30:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585718145-29537-2-git-send-email-sanm@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-2-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: usb: qcom,dwc3: Introduce interconnect properties for Qualcomm DWC3 driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
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
Date:   Tue, 14 Apr 2020 13:30:46 -0700
Message-ID: <158689624666.105027.3280804524840557421@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sandeep Maheswaram (2020-03-31 22:15:42)
> Add documentation for the interconnects and interconnect-names
> properties for USB.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
