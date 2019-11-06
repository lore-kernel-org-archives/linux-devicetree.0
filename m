Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92197C5DF63
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 19:11:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 637B92075C
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 19:11:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eZKYMJZE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730898AbfKFTLR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 14:11:17 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41552 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728572AbfKFTLR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 14:11:17 -0500
Received: by mail-pg1-f195.google.com with SMTP id l3so17779284pgr.8
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 11:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=OY7gYgd4FJIkTEZvHN5NIFLp9ZtxgEWcRq8vKLuNkWk=;
        b=eZKYMJZEiWsrur04nmp7VZR3e1RCS4GAobfM3f+fvB/0jOdeMyvy6E0CNoiiG58tmP
         HF+qx4/SsMBzIpYVrT5lktFKK73yQsJZ59QUCf4A9aesilgrJWeWFSepb5iecF7/6HVp
         McKkOqPs9GfnRlwLHmQFzVq+rgHR6xd7KNhJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=OY7gYgd4FJIkTEZvHN5NIFLp9ZtxgEWcRq8vKLuNkWk=;
        b=IM3o655hr3piOgRCmgNpYxmECg85LYceSKhMsR2o5mZTAgErXiE7zUKqEU/y3CuS90
         JJlotXLhseZG6VzBgzUSIM1mdC7zwRPtixR/5EtOGtmZkOHCv8WalijxP3F2cEXto7Yr
         WCaOquSMM7kgcV0To3vAzK0g56IamlgnfnUN9LnwuG7/rrq+naC1DhSUVb58bXCEIdeI
         B2WJDVS6N511p2OGUv8uvPcBaSbc/xnwzlYrqZnzP0Q/2fV+Jico7LdGC5KppxRf+Rih
         cWHz2jVuw9Vw4aAjNxFy05m9KhLz1Gcgl6DgwAfpU0BmOmuOJv2kzkGPKO91L4HnqfPo
         YQHw==
X-Gm-Message-State: APjAAAWk4CAwh4bua+uSzCrb20mFv6DJ7p44Mz86QqmfPG0VRAQW9woY
        CGqsySvRi93v850KpUHIkWvw9g==
X-Google-Smtp-Source: APXvYqyI9rQeSviss4gD6JhTRezTghk0Fxp7c2WSM+6a22e7Ntor3/PHJM3cg/rIyepQ2iDqA3GZRQ==
X-Received: by 2002:a63:ec4f:: with SMTP id r15mr4643147pgj.17.1573067477046;
        Wed, 06 Nov 2019 11:11:17 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x9sm3943428pje.27.2019.11.06.11.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 11:11:16 -0800 (PST)
Message-ID: <5dc31ad4.1c69fb81.195ac.b1d8@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-9-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-9-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 08/14] dt-bindings: qcom,pdc: Add compatible for sc7180
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <maz@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 11:11:15 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:11)
> Add the compatible string for sc7180 SoC from Qualcomm.
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

