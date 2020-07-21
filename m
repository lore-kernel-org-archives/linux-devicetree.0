Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC786C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 15:23:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BC572065F
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595345023;
	bh=FO6xqacNOKYpEmvm+sm7qk+kEUBgPHrjTIPWwcFL9NM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=pMg4sdkMRv1C1xlQdSza+OvuKvpNLRolVXt1pldggNsdU7ah1eWhrwZ83FcG7LM02
	 /OCR8tqGTHtlqYYRSZm7fsCe/BfZB7YlAinVKMaKBgIP3+97T4gm1gSHsM8aNqQtw/
	 28CBOTfPNrjPuhCpvE0TpKxPQn9yjdoczRGaoWXU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbgGUPXn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 11:23:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:54548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgGUPXn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jul 2020 11:23:43 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 844812065F;
        Tue, 21 Jul 2020 15:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595345022;
        bh=FO6xqacNOKYpEmvm+sm7qk+kEUBgPHrjTIPWwcFL9NM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MbopVjoL/v/notr4ZK/NB+kHwqwllagler9ckhLrTNYvOPXcEkahlPgY+vOu9Tld7
         eQ9mZj0O5hIqMNGRmZm0U9Jvo/lEKgmz1Zczy2Qirms9hA9QbfcPh6fI3gKSsKVSzS
         mrJL1bn9evy5ulavRX2/caph0M9818XT026qlLL0=
Received: by mail-qt1-f181.google.com with SMTP id 6so16432018qtt.0;
        Tue, 21 Jul 2020 08:23:42 -0700 (PDT)
X-Gm-Message-State: AOAM533cZY/YJVc2qWWx07JZqyNPvwHmNxcFMB9DMq5m4EX4X0FNRoux
        EzNF2shACqWZ9CjznGNh6rbyF+2uDdw8P4PbdA==
X-Google-Smtp-Source: ABdhPJxzaAWzNIQdWcSecb8r0S8Fl5pQCnPXJNpWwE0nOwy3sJm21Y6kzWkDDSH83sK//096sWIcvuFUkNszYkug5U4=
X-Received: by 2002:aed:2fa1:: with SMTP id m30mr30175558qtd.306.1595345021748;
 Tue, 21 Jul 2020 08:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <1595326714-20485-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1595326714-20485-1-git-send-email-loic.poulain@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 21 Jul 2020 09:23:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKkGjrbzTtTDZjAOJjEh-zVTXWB6-9XJgOPajQ+eFHBSw@mail.gmail.com>
Message-ID: <CAL_JsqKkGjrbzTtTDZjAOJjEh-zVTXWB6-9XJgOPajQ+eFHBSw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: Fix qcom,msm8996-apcc yaml syntax
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 21, 2020 at 4:13 AM Loic Poulain <loic.poulain@linaro.org> wrote:
>
> Fix errors reported by dt_binding_check.
> - Fix literal block scalar for dts example
> - Fix schema identifier URI
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
