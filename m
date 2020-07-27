Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC629C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 20:51:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B645220809
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 20:51:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GCcyJqDt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgG0UvV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 16:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgG0UvU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 16:51:20 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35715C0619D2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 13:51:20 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id w17so8781296ply.11
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 13:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bjL1e5uiS5p+oa9NfwO4lDZAbGheLK7Om3uvKuKgPGU=;
        b=GCcyJqDtRNEb60SBLpWXIGlNdJmFit1eYgHB+EDztoLvkbNic6roZHuERLgxCRidt5
         Fplk1HBV8l+LPzS6+DED2eo0Z5z1tnrCkEfQfeU9nIaJRvLs/oMF+SPA47ybbGQ8mokD
         K7bfSpmm4SoGAWQLl+h1Jd9j8Jxn2tahW0ytg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bjL1e5uiS5p+oa9NfwO4lDZAbGheLK7Om3uvKuKgPGU=;
        b=jDHljOmqm1WZQfoA3o5uHHzEMDpcN3WX6tadxR7g0CfUfhX1lhj3xDq+292WsFYjcC
         kZtwHtq/C7faZGa/jeU+PSuqElb8eswta5YbFohZthr1Oj19cfQCG1jt4vQVY4KQdZaZ
         x1X6o4O8qaz8Bi2O4LBB48no4hHN0IfDoGvvw75y4kSZ35eHz2oHXF4kN2QfV0sGFVzw
         +IYsfur9PkCyhuLTDLKxQPfcrnH6EXO597GnbU5CMNlDAIGRUu9omSRYrtiuDS9ZzZAR
         InpnP6zUwa91LWGxeUgVXs2Dpa/Xet0/2HPUrvPZXSqfkCSYiKOnUqcLS/6U2bzyWmnE
         iO/Q==
X-Gm-Message-State: AOAM531w6jKdlJG3iNQBXs/dux7ItqhJhaQTcU3TySUlUc+opfkXhDAX
        qYp5P8XUZeZdEt7VfLuEnc1q4g==
X-Google-Smtp-Source: ABdhPJzJTFDP4pfmQbG2IcY6+g7QazsrNBlZaeZb5C2taHPiz/0GqOjF9ag32KJXzUF6U7lBephsQw==
X-Received: by 2002:a17:90a:a68:: with SMTP id o95mr1119459pjo.64.1595883079734;
        Mon, 27 Jul 2020 13:51:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id w70sm8621216pfc.98.2020.07.27.13.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 13:51:18 -0700 (PDT)
Date:   Mon, 27 Jul 2020 13:51:17 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        sibis@codeaurora.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] interconnect: qcom: sdm845: Replace xlate with
 xlate_extended
Message-ID: <20200727205117.GG3191083@google.com>
References: <20200723130942.28491-1-georgi.djakov@linaro.org>
 <20200723130942.28491-4-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200723130942.28491-4-georgi.djakov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 23, 2020 at 04:09:39PM +0300, Georgi Djakov wrote:
> Use the qcom_icc_xlate_extended() in order to parse tags, that are
> specified as an additional arguments to the path endpoints in DT.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
