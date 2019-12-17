Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45276C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 07:19:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1829220717
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 07:19:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cZ1UC4FU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727609AbfLQHTq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 02:19:46 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39245 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfLQHTq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 02:19:46 -0500
Received: by mail-pg1-f194.google.com with SMTP id b137so5166576pga.6
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 23:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=QzyD4fDBzuaA1wIHJrNGEEBy+sHP/QLbZfm+HTOKkR4=;
        b=cZ1UC4FU3oudipQIsRudGn7YYFzZwyRBr1Zx7UQVgiVjQGSZdJX35BExXyDtla7LwV
         jej5EkyALQChYmnfdvo1zM5HQcVSNKaSG9JnD+NXcHzxhZDCOWCLFopoCTe0+htP0CWa
         qtqcPwfOBdZJ3wCN8hDIukHxFgBwycoLJVA1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=QzyD4fDBzuaA1wIHJrNGEEBy+sHP/QLbZfm+HTOKkR4=;
        b=FAwU3/jR5W/vUdwylZFj/e8MluFJh09HzHh094JaRHVGziUrXQz46bEQ1/N0u0MCcY
         ZjCCAmTKb5LPoSVmd9JnacDDF1/CFz31eCiI7tP5iRj+gyOgWeuKZ7Gvd4Rm37K7kApZ
         XKIKdI6rJyH9N7XZviVCjVvaqBmsoFYA5viXpbWCotTuk8OSwbbCFHlvJ3J7n/Sa1EoY
         kZDPKqD8F9Ea/gdoDG3FuY4SxwukcMrXxZTcC9sDAs0vdJmE14IdS/Q82nD+fCUl244n
         WzlvYr9yYVK+Kjs4mqsrGu+pCm2/wwknU/xcu8ifjwSaybpb8YoHgHMgH3dnWG4vnxH8
         UHLQ==
X-Gm-Message-State: APjAAAXw/AITL/TIazp5BanWYke3XKPS7F0mESx1fJpcGK6l6f60nPl1
        MNkbH0D1ESgJeAIHZ0Uf3jjiSg==
X-Google-Smtp-Source: APXvYqz8hXemqVKZ6ua+7ANmnhFp0S8vFyVnswmIUvKNq9CdU6rmkd75hMilfxjn3EFucyUHU5xjxw==
X-Received: by 2002:a62:51c3:: with SMTP id f186mr21387191pfb.163.1576567185644;
        Mon, 16 Dec 2019 23:19:45 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id o12sm26225089pfg.152.2019.12.16.23.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 23:19:45 -0800 (PST)
Message-ID: <5df88191.1c69fb81.3b35e.c8d1@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191216222021.1.I684f124a05a1c3f0b113c8d06d5f9da5d69b801e@changeid>
References: <20191216222021.1.I684f124a05a1c3f0b113c8d06d5f9da5d69b801e@changeid>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Rename gic-its node to msi-controller
User-Agent: alot/0.8.1
Date:   Mon, 16 Dec 2019 23:19:44 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Douglas Anderson (2019-12-16 22:20:25)
> This is just like commit ac00546a6780 ("arm64: dts: qcom: sc7180:
> Rename gic-its node to msi-controller") but for sdm845.  This fixes
> all arm64/qcom device trees that I could find.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

