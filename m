Return-Path: <SRS0=skvR=3Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EC0C35247
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 00:52:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD5582084E
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 00:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NJUHs0Gv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbgBDAw4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 19:52:56 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41994 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbgBDAwz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Feb 2020 19:52:55 -0500
Received: by mail-pl1-f196.google.com with SMTP id e8so3917703plt.9
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 16:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:subject:cc:user-agent:date;
        bh=WIox8twYzzuteqHQrnQrEwf1t//qJOVB4wlY7VwIEJM=;
        b=NJUHs0Gv1JCvRtekbQ9nnuEypsM67s4TaDlGAXWUXhfPxnvk8gxYTzxamC7oFMcQJs
         sE8Ak3TH502lBewTmSSylFbj1DXzBiY5H6S/7iWFHzacMg/cWuny+Zk3i/aYrhv+KHD2
         4GfB2JL5L2guTHsUFk/B0BLknU/iDprv8WIdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:subject:cc
         :user-agent:date;
        bh=WIox8twYzzuteqHQrnQrEwf1t//qJOVB4wlY7VwIEJM=;
        b=mIrAcFZBSaK9NYkgzffceo52lhB/fvODNiomDmPnB8os/h/heJewQm8qpF/Vmd5StT
         r+mzmkB9FvPAsF1/XZVCE1frIZ3GXpGvQZZ2qu6F6kIpV0jPvtFtJ5pwZOc+4ne1rl7C
         CQ4Y4dsR0t1AuDMvB81l7XJ+YBoqpmUbopYwQpAilwzQeI/jWtrpG/f3RjCuVs7+jzWG
         2Z4xKXwvhsbQDcj/rqesD/niJe12fZC+gf4WbsJaJPKnYljYIj9NIrxfsLvdAzq8v2WK
         25EzHz1PS9RD691SaFzNFzU48I2qN1MUIVr0jwpJ2cWoj21lxRDzGdQKKOntJmSTMgC1
         FonA==
X-Gm-Message-State: APjAAAUHzWE9HN18x2ILtlVb7GDccIQGWlZ0keIG7asBr3qNEV6Racbh
        NRBZIBYLAl7j7Ik96CK4XqcZqw==
X-Google-Smtp-Source: APXvYqyo7qfkI8dzpvQ5Y86FRR/oNXvn6/uBJC+Qlf2LtbTOB+2Bhl4GBiUZsKw3HZPW+3160JlSGA==
X-Received: by 2002:a17:902:7687:: with SMTP id m7mr26042237pll.136.1580777575193;
        Mon, 03 Feb 2020 16:52:55 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h26sm22971966pfr.9.2020.02.03.16.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 16:52:54 -0800 (PST)
Message-ID: <5e38c066.1c69fb81.e0fe7.f64d@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1580305919-30946-9-git-send-email-sanm@codeaurora.org>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org> <1580305919-30946-9-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy params for SC7180 IDP device
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 16:52:53 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sandeep Maheswaram (2020-01-29 05:51:59)
> Overriding the QUSB2 V2 Phy tuning parameters for SC7180 IDP device.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

