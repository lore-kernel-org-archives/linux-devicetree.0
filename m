Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E77DC352BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CDF920644
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UXtZj/Hx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633471AbgDNU4a (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 16:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633467AbgDNU41 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 16:56:27 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7850C061A0E
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 13:56:27 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id x26so449971pgc.10
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 13:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=NtGBbRMFHuGLYVWwP2S8WNTOMnjyQJo86GhiRsq/RLI=;
        b=UXtZj/Hxj2RogzSqhPdsIrV+Tb1Mi6cLH48af5r9FlBJkIsru50FCL5CzAaQQeqJ7n
         rsIoZhTl1LDgqnD5qEIf3p202tMUHA7FkZPQ5/P1FGdHN3SH3xTUhgGA5Dk5VXQ7LnQs
         3UcGLqg1dTAzptGp9XrHAIY2rkU1JMmoyOJsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=NtGBbRMFHuGLYVWwP2S8WNTOMnjyQJo86GhiRsq/RLI=;
        b=qtLmX3eP85cjtSyhB6b0WoP5FJmBbb676i4qP2H21toXv90YiYD6cnSLQQhetC3S/6
         WNcv5eQUjzo3WFjyBlrQY3n3m6vatuzbWsLXuyD8HLbkjUfg93OHnhdJzoOx+839sKqT
         gAeCKDcya6if0F7zrDDGMR550PObE0isJ2wwCWCX731k1/1MEepwxtExSAuYnVd10vaj
         EcQ1ei9jDv5/482sS1CjrPs6mwadRFL4OR1bYYaisK9nmkRDi9YdaooDmSTPQWBYhgjj
         eVyw2swoUGuTgfxIbvcDzyIaOEwvdp9izvITST5Fu9s1krrnpjiGIJ/8vZx7m48LTnKA
         2Csg==
X-Gm-Message-State: AGi0PubXs6ngYlD51/JJbGay61ViVMbmqSoRi91OKAMYGHMhJcXT/ACV
        cCgSVuU+2vlJT251Dq5khU3l+A==
X-Google-Smtp-Source: APiQypK6gPQlntq3g5CB8LbqghejJJbCs9iCRhnLW7s+orakW8jOYEegO8lYlVr+WaR9N/K8T1o/Xw==
X-Received: by 2002:aa7:8505:: with SMTP id v5mr1947475pfn.224.1586897787330;
        Tue, 14 Apr 2020 13:56:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b21sm6889644pfb.130.2020.04.14.13.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:56:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585809534-11244-4-git-send-email-sanm@codeaurora.org>
References: <1585809534-11244-1-git-send-email-sanm@codeaurora.org> <1585809534-11244-4-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v5 3/3] phy: qcom-qmp: Add QMP V3 USB3 PHY support for SC7180
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Tue, 14 Apr 2020 13:56:25 -0700
Message-ID: <158689778567.105027.9816194008999279570@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sandeep Maheswaram (2020-04-01 23:38:54)
> Adding QMP v3 USB3 PHY support for SC7180.
> Adding only usb phy reset in the list to avoid
> reset of DP block.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
