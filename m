Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30170CA9EA9
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 14:32:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4806222BD
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 14:32:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FqWqAl18"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410472AbfJROcI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 10:32:08 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43526 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410322AbfJROcI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 10:32:08 -0400
Received: by mail-pl1-f194.google.com with SMTP id f21so2933322plj.10
        for <devicetree@vger.kernel.org>; Fri, 18 Oct 2019 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=S0AYDcjrJsy+oBnQC4y0TZHY+QVM0zdCxFU4HdWdpYs=;
        b=FqWqAl185EdhvFZoMXJBoeliiGjHn6Nm+ykS8unq4pSsETB92rPiVQ4GrFPVdBctdP
         kszpm7fCmksTRC6OkMz0kHnCQWQwgGU0r5fcMWDifNovNClV28cDIAvcsZG4KJ+sQFrf
         05e7NSlM/fK43ijItKnSk2GJCNf4iLmnVVHno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=S0AYDcjrJsy+oBnQC4y0TZHY+QVM0zdCxFU4HdWdpYs=;
        b=HpcP/KoejFeSjKEoFOd5AXoAAT979J/QU8aXB7WYTVM+BXgq8+UXAB9clHGrdbb3XS
         Xh6/ujqJuHvAi0UO+QX0zpRRqp9ouU00zArJVBF0DkhMmW+K8tFjBaybjnPQGkNz06kz
         J92D7bdLf4l1owDotLYJ04uzAQClOKZnxeTnDPxuthrU419rIeoozOy+BoOaILjX+YYo
         LYNgslL19Bks1MHxwq3rjMEpX6a2UvpvN/eaMxroACPtuU6p5ZACRvk/5iZtTxwa8bV8
         GhKfTdG0NhpCxgBZ+FhumZkswkRmPN/tN8cCrHn4xECXHo57+TfaUFa9eKjUWbp1l+bK
         AxEQ==
X-Gm-Message-State: APjAAAW7zRmYn+gtI2ZUHUKinTiMxETHS+NMJ9dMNdB8zJbXPltPqZcF
        qEBVTGgs4ysI7roxF0hxuz59zw==
X-Google-Smtp-Source: APXvYqyBsAB4co/sMqBO/Ihqv1CyC8RUWMY5tCwyuef3uxHYeNsv4k67Aa5a7acEuX1sBePI0ltN4g==
X-Received: by 2002:a17:902:7885:: with SMTP id q5mr9883498pll.317.1571409127260;
        Fri, 18 Oct 2019 07:32:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q30sm6755037pja.18.2019.10.18.07.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 07:32:06 -0700 (PDT)
Message-ID: <5da9cce6.1c69fb81.d3cb2.07d1@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <30f419d1612a3912e323287a96daa2b4fbe3dacd.1571406041.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1571406041.git.saiprakash.ranjan@codeaurora.org> <30f419d1612a3912e323287a96daa2b4fbe3dacd.1571406041.git.saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 2/2] dt-bindings: msm: Add LLCC for SC7180
User-Agent: alot/0.8.1
Date:   Fri, 18 Oct 2019 07:32:05 -0700
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-10-18 06:57:09)
> Add LLCC compatible for SC7180 SoC.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Can you convert this binding to YAML? Would be useful to make sure it's
used properly.

>=20
> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt b/Do=
cumentation/devicetree/bindings/arm/msm/qcom,llcc.txt
> index eaee06b2d8f2..f263aa539d47 100644
> --- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
> @@ -11,7 +11,9 @@ Properties:
>  - compatible:
>         Usage: required
>         Value type: <string>
> -       Definition: must be "qcom,sdm845-llcc"
> +       Definition: must be one of:
> +                   "qcom,sc7180-llcc",
> +                   "qcom,sdm845-llcc"
> =20
