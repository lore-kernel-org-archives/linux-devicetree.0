Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA394C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 12:59:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 824AC22521
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 12:59:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dYP/0q1U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbfKTM7c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 07:59:32 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:45628 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727674AbfKTM7c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 07:59:32 -0500
Received: by mail-ua1-f65.google.com with SMTP id w10so5265542uar.12
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 04:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nuqJ0vbClL23gGoYcppi0FrFy7e9Hz/yNcjMSMNBxqE=;
        b=dYP/0q1UJs+hkupL0Ks33xZa/oPu9OOQ/1POhchabco+MYLW/OVqUGMujUfpI5uX/Z
         guc95gIHgm0ENwks6ezoHMtNBDv5NpD4kZOt3rckVtc2TNrFfHdbtpCHIzg2WdJrYaXH
         /xSfomvFi7E/T0tCpoUNe3K5d8eLKhwMpXTlLq8hD5ihVf1MmjEnX8Zrc+Q4dl9OF8vp
         voHqwV0OwDc47bzLAoCx81iHGZpBIJjGrkq9aPtBI615OOd+WVm9zHE2PC2D1k+vGxR4
         4PUF1/lLiew7UxLBcxzFkhUWuY57TX2Ka8I2YZ+NgeOlXACnlaJC6D7tFhA87pTU3x45
         HmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nuqJ0vbClL23gGoYcppi0FrFy7e9Hz/yNcjMSMNBxqE=;
        b=bVra8Hth6bKa6InV6rugx0ZnBVOt4DxdbunxRrBQ/NN7OQLm/eDoAN5NQT/Lg8yRSh
         zHf1VUw4C7I33z2wj5ye1fye5p0mJ8QKT3YKaqHljZa9KasRlDlnBOQAm0M9koR/Jo9I
         VFnoL4xvVg/NnpCcxmGy7ZqABasz1XKtd0tR8BBZs3cumUZDjksj5Lo0oCzfhC7Liv5h
         P4/YSaeFPqcxl/Br3bOLBu0CCUSoO12wsET9C/lGOjnIRcPt1Mo/xKnEdwhv04zqoiYX
         WR9UAehaDMhAOw3IBdRPyQLkFfGn4QTmYKAn9pl1uGAxDrWfGz5lyxM6TJ/PCxTf46U9
         ihbw==
X-Gm-Message-State: APjAAAX30DURPErJJlDl0olPF6Cb1ONE55+0E7TSOHI/YUVFtMxrONIj
        5/wJwMb5eKl9m/PCiwvI42CsAQWjXS1/DzYL9nlpvw==
X-Google-Smtp-Source: APXvYqzczwcqmzJh3GjUqnWFQGP/+Gp7RUJwV58YrFcSe+bfPCganPSc0GYA3NZbmUkPuarP338JjoXHT98NVoW0E1U=
X-Received: by 2002:ab0:2042:: with SMTP id g2mr1511287ual.19.1574254771069;
 Wed, 20 Nov 2019 04:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20191118104646.3838-1-i.mikhaylov@yadro.com> <20191118104646.3838-3-i.mikhaylov@yadro.com>
In-Reply-To: <20191118104646.3838-3-i.mikhaylov@yadro.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 20 Nov 2019 13:58:55 +0100
Message-ID: <CAPDyKFoz3ipYBGR-6ubfqhtQVG9h16axoHNdSoo+OyNgKRs2Tw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] mmc: sdhci-of-aspeed: enable CONFIG_MMC_SDHCI_IO_ACCESSORS
To:     Ivan Mikhaylov <i.mikhaylov@yadro.com>
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 18 Nov 2019 at 11:47, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
>
> Enable CONFIG_MMC_SDHCI_IO_ACCESSORS on the aspeed board. The read_l
> callback is used for inverted card detection.
>
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>

Applied for next, updating the changelog according to Andrew's comments, thanks!

Kind regards
Uffe


>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 49ea02c467bf..c9c1bb722368 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -159,6 +159,7 @@ config MMC_SDHCI_OF_ASPEED
>         tristate "SDHCI OF support for the ASPEED SDHCI controller"
>         depends on MMC_SDHCI_PLTFM
>         depends on OF && OF_ADDRESS
> +       select MMC_SDHCI_IO_ACCESSORS
>         help
>           This selects the ASPEED Secure Digital Host Controller Interface.
>
> --
> 2.20.1
>
