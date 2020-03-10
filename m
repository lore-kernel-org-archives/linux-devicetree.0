Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8D5C18E5A
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:54:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92BAB21D56
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jayoZwrF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgCJRyW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:54:22 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41654 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgCJRyW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 13:54:22 -0400
Received: by mail-pl1-f196.google.com with SMTP id t14so5733885plr.8
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 10:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=9xrGyjBP9/lId96bp3b0igZ5Fq6/ehIsq8nZJf92rko=;
        b=jayoZwrFjKOylGI+0rtBXlSDlY2LI3eMJQ9vUgbiaT7A5gbExcoxXs6kZ4H0rfpPKq
         emu0SkdUMUaPDPNQMHeWDYB5I7e2BNz7Vx864brt4kmIZ/CYXCyKWi+0B9mD50fRESM8
         4MSd6RAwPRlxig/I7ixHdKlIzWUOmq0/OuEeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=9xrGyjBP9/lId96bp3b0igZ5Fq6/ehIsq8nZJf92rko=;
        b=C3/GyWy056aPt0/BzTe2oIULqs7V6FIaCabGUN4o5OUJeZ3p7Tqdn9CXmYGiGKnFBm
         hb49KwAFzYD/dpgXa9cYSc3S2L57b27aLq9r9peO2MpWF36IwDhMYczwTNWhVESDa6uL
         tg1/PfPp4zlqXyZU0I4AcMGTmpjgNrUKZxy4wuD0jpMDnvqEA7u9x9UUer17Tvl+ovyA
         L0LIeCLWjhummdtS2PSC7lJFVTB6z9aRK03n0WWbMSf4a8MerJGO97fyW/R5BU5/CY41
         zjx9UYnu2n+mwx3NeIfmEKIqOPMFuTtWlqVqtT3a+FqS75s82/Cn+IKEVlXT2R1QWxqm
         QKdA==
X-Gm-Message-State: ANhLgQ2ZGyAm8tWjmehzs7cq2B7nFsIl1AAob1DsObq0U4RxuH4HdRU1
        4AD1dzZFkvaO/zhEnrhWkOeTbQ==
X-Google-Smtp-Source: ADFU+vsELhgfsIXkY//Egix35HBOFMo21WrTy/dWY0Dm1iIST3gawKKEcusOZCNKpBkodKXdPRL59Q==
X-Received: by 2002:a17:902:8b89:: with SMTP id ay9mr21466796plb.309.1583862860685;
        Tue, 10 Mar 2020 10:54:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h6sm2792595pjk.33.2020.03.10.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 10:54:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310063338.3344582-2-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-2-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: remoteproc: Add Qualcomm PIL info binding
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 10 Mar 2020 10:54:19 -0700
Message-ID: <158386285904.149997.9749528768955800249@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2020-03-09 23:33:34)
> Add a devicetree binding for the Qualcomm peripheral image loader
> relocation information region found in the IMEM.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
