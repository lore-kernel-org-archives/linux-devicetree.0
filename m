Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081D8C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 19:25:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD5C12075D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 19:25:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mha8nIa3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgGMTZG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 15:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgGMTZG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 15:25:06 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B9DC061794
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 12:25:05 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id u33so2225221uad.9
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c58fzMesBGqhrQjXqO4m6q7tGi1qVPYPv+VcB4W3u3s=;
        b=mha8nIa3wwJcYw8HGrMiBF3Mqh9BaxUUw0QNdsJNEZo+P7GFJ34sfYSZ4Dac6ldiwa
         MbcIhDmmapR421rsnWjZbGDP1c0k++FFN9c0HUlBsEHWgBwzNrxsdybHpdnaBdCrA3VN
         Km9LO2Uibj3KQZsAtzjgDwVa2VdCbGZpAyIQ235mOM8FkDFmXNXedgQn8eyXf28ckJdx
         GaUSwknl88f+t9zS8aig4kUoFZkbAhBYdIdEnwW27Tr6+IIXhpJqegHPJ8lVI+z4xrNl
         eVc70PJCzTjZv/jHzphwN6rrs6RfsjUnTmkezv1zPHj9JqCZ+J5iqyLqpIX+eD/x8FXV
         M9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c58fzMesBGqhrQjXqO4m6q7tGi1qVPYPv+VcB4W3u3s=;
        b=X/6U5CKVNsKHDKUVPGr1vVQV19l9jqjQnTW6mNi831/HW7tk7LrYO78AGqtTbWrqE5
         JCqctbncxQGITdp//Xkda9jrap01eQsCVv2BG0wNRulnHQ0V4Sg/kqD2JmchP3EtTrTd
         10Yn3CrC2C8MNrLsYXJx79XmCr+uGnBX+6mt659Eg+4g4/saxi4VqltUVyrxYr5PJ2tM
         +opL7F7alYlluWOGpMXnUuRQNrA1gYh8woCSJL8wsDgRJ5hHLBgLa89AWe2AxFmjJ3WX
         13ZHWqmI1IPBy6m6gcd/BctRlOe6SXvj1V4XRQK9QCVcmzYtxymT6/NGChgMsLc1TCY8
         jXeA==
X-Gm-Message-State: AOAM530XZxRPhoI9RIdPI07U+mdWCXMnWnzhzr4/XvHY9MLHcst1IEEk
        kG9jxApSn3BHa1IWioDerCKehHcIzc0ydn4wXITFRQ==
X-Google-Smtp-Source: ABdhPJwP9bGsiDAnqaDUGPoQOR9PisnIuW4faekW21ANZsw39QW2WVLI/gUVmMNoRZXnfYOFJBcTipBzs4obwQc2dR0=
X-Received: by 2002:ab0:2894:: with SMTP id s20mr831300uap.55.1594668304785;
 Mon, 13 Jul 2020 12:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200710004258.296017-1-linchuyuan@google.com>
In-Reply-To: <20200710004258.296017-1-linchuyuan@google.com>
From:   Chu Lin <linchuyuan@google.com>
Date:   Mon, 13 Jul 2020 12:24:53 -0700
Message-ID: <CAKCA56A8b+8NA8Si7g+whkYSRqr7=JLV+726nyFiDjWQ70BTgA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: hwmon: adm1272: add adm1272-adm1275-temp1-en binding
To:     Guenter Roeck <linux@roeck-us.net>, robh+dt@kernel.org
Cc:     Kais Belgaied <belgaied@google.com>,
        Jason Ling <jasonling@google.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zhongqi Li <zhongqil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adding Rob to the review list.

On Thu, Jul 9, 2020 at 5:43 PM Chu Lin <linchuyuan@google.com> wrote:
>
> Problem:
>         adm1272 and adm1278 supports temperature sampling. The
> current way of enabling it requires the user manually unbind the device
> from the driver, flip the temperature sampling control bit and then bind
> the device back to the driver. It would be nice if we can control this in a
> better way by reading the dt.
>
> Solution:
>         Introducing device tree binding adm1272-adm1278-temp1-en. If the
> flag is set, flip the temp1_en control bit on probing.
>
> Testing:
> make dt_binding_check
>
> Signed-off-by: Chu Lin <linchuyuan@google.com>
> ---
>  Documentation/devicetree/bindings/hwmon/adm1275.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> index 1ecd03f3da4d..4403fe30f005 100644
> --- a/Documentation/devicetree/bindings/hwmon/adm1275.txt
> +++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> @@ -15,6 +15,8 @@ Optional properties:
>
>  - shunt-resistor-micro-ohms
>         Shunt resistor value in micro-Ohm
> +- adm1272-adm1278-temp1-en
> +       Enable temperature sampling. This is supported on adm1272 and adm1278
>
>  Example:
>
> @@ -22,4 +24,5 @@ adm1272@10 {
>         compatible = "adi,adm1272";
>         reg = <0x10>;
>         shunt-resistor-micro-ohms = <500>;
> +       adm1272-adm1278-temp1-en;
>  };
> --
> 2.27.0.383.g050319c2ae-goog
>
