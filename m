Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FDDC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 18:51:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB1572240C
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 18:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hle4E3bi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfKSSvK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 13:51:10 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39266 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727549AbfKSSvK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 13:51:10 -0500
Received: by mail-pg1-f195.google.com with SMTP id b126so422665pga.6
        for <devicetree@vger.kernel.org>; Tue, 19 Nov 2019 10:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=n0Px5zh2RZUTSRa+txIjA96ir+kiwnj5ZLRMEtvcgV4=;
        b=Hle4E3bikufHT4vYbr/0nSw82RYwn/zAXxMAWA/79Mz/wrAUR0/Fp5HP+QaR1r/do5
         rEjH/qVQtwwPDXJzMcNDrNHYNls9GNKpFqxNu1s7RABY9vO3btlciW9ohBDodd6Nu1Ww
         ZSnQZULbbxXxFK6cBW+vZFEQyagOk4VcvWBao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=n0Px5zh2RZUTSRa+txIjA96ir+kiwnj5ZLRMEtvcgV4=;
        b=aEmK6vPhzZqoeSP89tPtUP0p3c0bGEB47aqoiklB5uJeCj19WN9sSwB/5w+5JiemJj
         RJOdWXgzFlm8+0aAr6eFR6vsBHXgYM4KkDjKv8e/ebR5qwmWXV83oMTIiTrfiL8SzbTU
         yV8PI8r2sAHsSLT2foMcaM9cQu0YIG9ogfwykgo71lDi2Old2gjO5AfRn7px5/lsZ58Q
         mK8VS8DdznmlDlqiLYKfE7RsF5aVjm20ngrJbKGr7HC1OXFk9DFun4YRQ9eQHf0ypy0n
         ALO3UMcKCMvt2mXxv5NhowshF3D8wZ16D5SUej7gqeBVUwBLmYVfjobNGbXh5ABs12ad
         Qm/g==
X-Gm-Message-State: APjAAAVC/TUIrjAPlh/Q9vYPy6ySkX5R/WgOiJC5kOVlqAEe55pL9Ms6
        7KXw0IdHOhZztN6QvWuI0eu7bA==
X-Google-Smtp-Source: APXvYqzUzfgLoLdneiTOoteEpSUfIAgBNn8+g+zF+lXSEPZQgOJfHhkLBgnHXUY+izJng0Bu29sosA==
X-Received: by 2002:a65:4907:: with SMTP id p7mr7098872pgs.327.1574189469333;
        Tue, 19 Nov 2019 10:51:09 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f25sm27262183pfk.10.2019.11.19.10.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 10:51:08 -0800 (PST)
Message-ID: <5dd4399c.1c69fb81.d832d.e01e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e7f99b9a0-6c4e46e3-ff77-4cc1-95f6-9561975eedc4-000000@us-west-2.amazonses.com>
References: <20191118173944.27043-1-sibis@codeaurora.org> <0101016e7f99b9a0-6c4e46e3-ff77-4cc1-95f6-9561975eedc4-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH 3/6] soc: qcom: rpmhpd: Add SM8150 RPMH power-domains
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        rnayak@codeaurora.org, robh+dt@kernel.org, ulf.hansson@linaro.org
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 10:51:08 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sibi Sankar (2019-11-18 09:40:11)
> Add support for cx/mx/gfx/mss/ebi/mmcx power-domains found on
> SM8150 SoCs.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

