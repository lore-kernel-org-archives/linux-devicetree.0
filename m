Return-Path: <SRS0=u7up=3N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09011C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 13:10:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D468820838
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 13:10:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gjmgAgx3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387834AbgAXNK0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jan 2020 08:10:26 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:45208 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387565AbgAXNKZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jan 2020 08:10:25 -0500
Received: by mail-vs1-f66.google.com with SMTP id b4so1131012vsa.12
        for <devicetree@vger.kernel.org>; Fri, 24 Jan 2020 05:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FgJ5lZH4Mb1Tzk/p5bRIKhcE7A+Y7euEYLcO1OpV4S8=;
        b=gjmgAgx3XOChzsVHsvnM5jQSiMZ4Fjx3NBVYIq2/dT3CH9ql1U7aAdqnR14513DZFT
         YCH8qYlXsmEWt6b1r3I4OAxTH8Hk8zQT0770sSu4j1UryQK2excH9kVrqUJQL+Z1HVuK
         ZRxv2qonE2OXIHbhU41udwALpiap6wfaL6E6mUiUMX8FBzbhBbFqVUz1IoqdD941o+rp
         g96vbjsxuLg7zYqFDMRrMQNHFyolL5jDENiFUrPIEwhM5Nf/gGAkkwqtpERmRCxKTNFs
         CWPzTUUwNYmAnFwuZlb3CQgCKwG4t4dH3hX7laxkMyuEdwEesH6wFkZTpIMSXWIkXhHz
         dkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FgJ5lZH4Mb1Tzk/p5bRIKhcE7A+Y7euEYLcO1OpV4S8=;
        b=ZpZRNrjKDhkm2XaHDgXbdyjM+Q77KmWAjVkVWKtTZus8Y10L12d1Q0FHXPmCmJquau
         FlgdoBlD7Zm0RHRwNuYlu7Wm2kfN5Gd3ijL+c2lf9PgSwK011N3QAtvrSd0IMwH0iW5o
         nVk+YRNZPU/JbpLMXK7hlKGyoPupYA2nCEcqqvM3/gUbumIJYu/ub0QFQLiAIhNP7fyn
         he7KWfRy53y8p7MjtjznnWy0N42qZkYnsQTJMa8SMG8MmxCOTZsmCkvFoUVjEyOJtxOO
         RPQNfm+Ak0VSnkO7xL59X9IyOp6QyRTxMAmnPz8t/MO1yacFw0eMHTdjx+MDiILzT5w0
         YJ7Q==
X-Gm-Message-State: APjAAAXIvXsaClIlp252AAypm3bRSCVgvY2IF3t6G0gVDxVzDwOMAJJl
        lGnq684hZSJioF0I58ANCnUuZcvsOT4sr2eSDkHTCw==
X-Google-Smtp-Source: APXvYqwTSyMti1aLrHxV4T1GbulSVX2llyodm3KWM+MmIFpyCh3UiqUM4MYq/lAoQMj2ylGIpLcWxal/hp0XVXJXDjA=
X-Received: by 2002:a67:de15:: with SMTP id q21mr2060825vsk.165.1579871422965;
 Fri, 24 Jan 2020 05:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20200110134823.14882-1-ludovic.barre@st.com> <20200110134823.14882-4-ludovic.barre@st.com>
In-Reply-To: <20200110134823.14882-4-ludovic.barre@st.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 24 Jan 2020 14:09:46 +0100
Message-ID: <CAPDyKFpBgRGbRjOKHygknUMvGt9AKke+svoSG+So4B7hdZ8AMw@mail.gmail.com>
Subject: Re: [PATCH 3/9] mmc: mmci: add a reference at mmc_host_ops in mmci struct
To:     Ludovic Barre <ludovic.barre@st.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 at 14:49, Ludovic Barre <ludovic.barre@st.com> wrote:
>
> This patch adds mmc_host_ops pointer in mmci struct.
> The variant init function may need to add a mmc_host_ops,
> for example to add the execute_tuning support if this feature
> is available.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/mmc/host/mmci.c | 1 +
>  drivers/mmc/host/mmci.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 7b13d66cbb21..00b473f57047 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1923,6 +1923,7 @@ static int mmci_probe(struct amba_device *dev,
>
>         host = mmc_priv(mmc);
>         host->mmc = mmc;
> +       host->mmc_ops = &mmci_ops;

Nitpick:

Can you please also move the assignment "mmc->ops = &mmci_ops;" to
this place as well, as I think these belongs together.

>
>         /*
>          * Some variant (STM32) doesn't have opendrain bit, nevertheless
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index ea6a0b5779d4..55acc0971a44 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -407,6 +407,7 @@ struct mmci_host {
>         u32                     mask1_reg;
>         u8                      vqmmc_enabled:1;
>         struct mmci_platform_data *plat;
> +       struct mmc_host_ops     *mmc_ops;
>         struct mmci_host_ops    *ops;
>         struct variant_data     *variant;
>         struct pinctrl          *pinctrl;
> --
> 2.17.1
>

Kind regards
Uffe
