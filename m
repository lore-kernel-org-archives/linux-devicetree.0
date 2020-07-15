Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355CBC433E6
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 19:36:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E8FA20657
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 19:36:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XY4/njUi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgGOTgs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 15:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726894AbgGOTgo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 15:36:44 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4741FC08C5DD
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 12:36:44 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id r8so3142314oij.5
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 12:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rR8gIS4VQXCjAcXSb96e3TYhEFgbcxFTF7+lqvB96Mc=;
        b=XY4/njUigM9ia2/yktoamaYQAG98PZrAmqAG1v7JZXdzlb1/ESpHjDqq0eKQPM+lk8
         G0WIhU2Kel+ShVX/qcF9VFrPlG9QsMhi3qrUJwtnoCYmIXofkDF2fvkINZFZSuQe7dt1
         P9ZxduaVAGjWE9wZymXly/Z3FU2PN+wsDBdDT4lunmBJ+k3Nx2OpHNUQOndrWWrLouwG
         vwpV9CrKs02HDW+u/UyVnAsaluvznfqwagXAOO5hsvufcOCSzZjnBLEVaHiJVRdmoDRi
         X2xfLU1jJaTHx72bTzKBzoPAllsLUCBpwwpAUTstgE+urPI5/dylyUNXZvmtF3zL5Co4
         AIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rR8gIS4VQXCjAcXSb96e3TYhEFgbcxFTF7+lqvB96Mc=;
        b=motEWGcSeYwHkazo3nMQJgRDyhuUHFvbIAo/Pyvr9xXax4d53MNNLnLZF4QPYfaefP
         lK/nCQMWcDGYbSAT4Du8qkYzuSlp6BeEAu7wYqq5V6ib9pAr2YozUNpUbOBHCfBY6VrS
         TCSkvOt7OCobFyvbG9g2d52it0WkC198c+MPrsbEkCI6b4oySVh4LLAxfj7SogTsGPtk
         X0Kp+rCFkWScp8mNvw157HQfGJya0QVTg75fMnPcRtXs1fJo8AhSbAgmFxztrBwd1k6D
         Y8HY79bv9nI8qsxdwhrRUZT0+LzaKJhEIhiPU+oIg0aUi2IP0ODR43g9KlrAFt1CwpQP
         r5vw==
X-Gm-Message-State: AOAM530FaHJIZsA/FdR8W7kzS3i32MkuV7fLasPa1VDIsazGl++yaPfz
        Es1/rbs1PpkKn+6yfo8m0TyBcuc8R1GoKtoDwSFWrw==
X-Google-Smtp-Source: ABdhPJxiRGfd0eoaoROgXUN9uWZUGskblIlhMLdmnnt1Ctbn9jndJMJXv2b3Wfretv7Kef+W1jIxo86dAC31T7EKRgs=
X-Received: by 2002:a05:6808:8c4:: with SMTP id k4mr1126990oij.177.1594841803655;
 Wed, 15 Jul 2020 12:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200622075956.171058-1-bjorn.andersson@linaro.org> <20200622075956.171058-5-bjorn.andersson@linaro.org>
In-Reply-To: <20200622075956.171058-5-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 15 Jul 2020 22:36:31 +0300
Message-ID: <CAA8EJpqEXcb2DvA+pr=6PmoG1fVQ5kcH0k0VY_jC_Diu_SK=jw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm8250: Drop tcsr_mutex syscon
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 22 Jun 2020 at 11:00, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Now that we don't need the intermediate syscon to represent the TCSR
> mutexes, update the dts to describe the TCSR mutex directly under /soc.
>
> The change also fixes the sort order of the nodes.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
