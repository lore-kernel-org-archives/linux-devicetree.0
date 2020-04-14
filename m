Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADA9C38A29
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 593AF2076B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QiJ9ArI4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633188AbgDNUcT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 16:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633160AbgDNUcJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 16:32:09 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D70CC061A0E
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 13:32:08 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d24so373425pll.8
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 13:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=RoKpcxr6K9VGzAmsqGBuph/1FoGQ9qjjJ0YxDqJJHHg=;
        b=QiJ9ArI4RGUZhtyAjahBG207F3DQ0dZvDNZYdWFyHhMRRRSlzyFzC4sGGOg/4ROOBT
         Xy2fb6wp6NXZaEWLhn5Se6/JkcAwSQHiPsbE2laZg4hG5k9JNR5qDpZhNpdGdanByfFJ
         77diWG+Xdzc7JkfsQfJq2MY9esr8dS5CXo9Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=RoKpcxr6K9VGzAmsqGBuph/1FoGQ9qjjJ0YxDqJJHHg=;
        b=YhH2cjl6L7cN3tO5Ry4UEIDOpygRy8d9DpAWaM4tA2D6uzROGPRYXP7YwNR0w3WA/r
         RWw3+i9nQny4ONzDol+8uCZZOpybzSfiL4Bwk7hyuvxYaZvwIWnXiQ3vNxNiDZpLlZdu
         GgBh1XyO1CEpJwo6AQ+CjGLTp8QuarlmzybpfRtvav0u0c8i22yfAbhbHaOeiZ5rGYSJ
         baJEr3hQEKhjNuZuXCUoVsAjK6k53Lg2dhEIrrrHH5SGsxNm5a/ChbLh5hVcQdcML1HC
         TYuEs/gdWLkHuUHxIvtnGAgqL5fAcHhoaSXRy2RLf+WTiMsi3RIpkgo8ChVT5f0ZuDUY
         a9ug==
X-Gm-Message-State: AGi0PuY6kmhDaPhAXQl1/7mK4elmwMGrEo1VI0scfO5nRtRosrCf9xPp
        fSD97wprUpL2ejAv74HIn6y5wg==
X-Google-Smtp-Source: APiQypJmomzVcaErIMWufXBh4DLq/VWKaXXky2Q+jgmXEF61n7QDVFPgCA0LLJzRIGPeVmppodfzCA==
X-Received: by 2002:a17:902:8305:: with SMTP id bd5mr1602962plb.114.1586896327676;
        Tue, 14 Apr 2020 13:32:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i124sm11791303pfg.14.2020.04.14.13.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:32:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585718145-29537-5-git-send-email-sanm@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-5-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v7 4/4] arm64: dts: qcom: sc7180: Add interconnect properties for USB
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
Date:   Tue, 14 Apr 2020 13:32:06 -0700
Message-ID: <158689632638.105027.4250669142733413538@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sandeep Maheswaram (2020-03-31 22:15:45)
> Populate USB DT nodes with interconnect properties.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
