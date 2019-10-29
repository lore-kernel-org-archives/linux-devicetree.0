Return-Path: <SRS0=TSDT=YW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DE0CA9EAE
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 16:50:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0F7720830
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 16:50:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PNrtOie1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390534AbfJ2Qum (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 29 Oct 2019 12:50:42 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43122 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390365AbfJ2Qum (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 29 Oct 2019 12:50:42 -0400
Received: by mail-pg1-f193.google.com with SMTP id l24so9960932pgh.10
        for <devicetree@vger.kernel.org>; Tue, 29 Oct 2019 09:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=1EcVhtgmI0wFYEgWlYfQnU4+/BM9ln0YQj1/qNn/9r8=;
        b=PNrtOie1EYtyDxfR1GgH1g/+4BjjbSeoTj7w6ok05O/9iLbYcCMl4x+Ikl0ciFmGWk
         FaHhnx8/qn1KfpX4wLCK2HWFLsJuWNZxqgoVINug1Ov1UgXgCGAX1yNNsTPAd+88zTyq
         yOb1VIHhfTVl79VXR8mcZPjz0+ZrJ5Yh1z1iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=1EcVhtgmI0wFYEgWlYfQnU4+/BM9ln0YQj1/qNn/9r8=;
        b=kQkvMzShT3Feo69+LPCEUTY87zdMs+Xtl4NSDarHU2zlP3X574FHuc5qqQ2WJVcDzk
         UG8UVc95V3H1nqy0Ph/JjhNXAXk/2A8S+LNl0f+KODkMYgzDYhLcmfWl1sZL9oonqAsK
         n+DO6U+N6MCGRoGA0Cf3rpUrvS5t5YsE8wfl6MikjKSD4k8c7r1Rcgs13iY7hANJUu2O
         i5jM442f0xEM35nFVHdvlDU+MKysvPVswuiu6WcZzt27/f6cSFlZrJFFiUSdY1V5rA8q
         8gseHMNqAYbdam/VR4SRnxb5M1zioM/0BbhNB5/CsBlQO/0ybI/+JZka22PsfPoPEQ40
         S+QA==
X-Gm-Message-State: APjAAAVAStEUSrwJrBsteJ+f4wh/yF1E5uTaU1XSuNlHJcoUa5NmOA2I
        Px8VLJ6RBvKB20hCQDILQE45Uw==
X-Google-Smtp-Source: APXvYqzuJp5yJFfn3l5GHPNYKExU7ekP3dRen8od3Km9IrisWb1nMSBoOt0RzryHGcRAF2KPFrFjIA==
X-Received: by 2002:aa7:838f:: with SMTP id u15mr28280727pfm.74.1572367841595;
        Tue, 29 Oct 2019 09:50:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l23sm329226pjy.12.2019.10.29.09.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:50:40 -0700 (PDT)
Message-ID: <5db86de0.1c69fb81.9e27d.0f47@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191023090219.15603-12-rnayak@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org> <20191023090219.15603-12-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sc7180: Add pdc interrupt controller
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Tue, 29 Oct 2019 09:50:40 -0700
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2019-10-23 02:02:19)
> From: Maulik Shah <mkshah@codeaurora.org>
>=20
> Add pdc interrupt controller for sc7180
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> v3:
> Used the qcom,sdm845-pdc compatible for pdc node

Everything else isn't doing the weird old compatible thing. Why not just
add the new compatible and update the driver? I guess I'll have to go
read the history.

