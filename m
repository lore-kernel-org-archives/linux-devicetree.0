Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80807C432C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 03:33:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D32220705
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 03:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIhJpDrr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfLCDd1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 22:33:27 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:40945 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfLCDd1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 22:33:27 -0500
Received: by mail-io1-f66.google.com with SMTP id x1so2039517iop.7
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 19:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EvJt3gzlAO+oRtjqvbXcTygYaOTVm5IYaKaBT0d2KR0=;
        b=bIhJpDrr0wMFIUzju9Z65IyQMHbQhuWnaYHrvLukSGvNKjOPQwY7jZ/Sp0sbWmyDAd
         uFL8yMz5HZJn6WcB9VsIEVJBDXp+A6+o9Zvf1FQ9g9QGJtgmFskn/Px1iM+zJSNbiUU3
         1+Dip6Lgl9LdIq63/gkOqlI5bDdnlimXBpSLLuUx+Ie5+mbF+8kfd7H4kzZUGURQPEGf
         ZYI1StoNCDlzrvWCiI1xvedWy7IQz44/72KcxSBpTlp3eo+9uCHo232I58axeWKDnmX+
         7Y5BZBmErQgx5zWdFMDPDVBzdyaoWttl7ZYYi2Pcf67xKXpn5edxbj0VdIDxcUTdeLZw
         nkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EvJt3gzlAO+oRtjqvbXcTygYaOTVm5IYaKaBT0d2KR0=;
        b=fEVUKuPBHvHU9MrVcnVYCRsvat7vnNmPsDRmGwTUk3W6eha0vrKIdnyFhrCpUCCN+T
         Vdavq3q6pigP0ujf6jFablshK+SiwKRTRWjXJ0jXZjp4AjWXd/wUH+6qa95B9ZFiCLUZ
         9Noz30/oPG5zngf7RFbC/q9T0ooq4/f25erkoYD3HdWtkslbsTG//iZkIO+MSvpPUodm
         LlVXUKR7loSenFtodzqbnAeMtVnlFuExVlKyp37cRhWbK76GWEVrRSZAZUme0i0/AULy
         /oJZRIT+RMmV0BD9ackhTsoCFJCb+H4pQbnun2AyPSa46Hr4k7jEneDUFii5rljkVvGH
         PBOA==
X-Gm-Message-State: APjAAAXUo/59wKc38eh+AOkf+hWx4GIawO8SOfXC+naLiIM5HAu4EHMT
        kX8Q6jMiWdn6fDi+LQt19A6hc6Zul/fSNQ3PE1pAbzgV48A=
X-Google-Smtp-Source: APXvYqx5yVzLNaPqYrLRSFq+ahc8lvFvDSys1QX06Yk91gT/HgLu/uJBKD7Yp8n+VGgBSEQZksF6nDucKQ3kwhpqr7k=
X-Received: by 2002:a5e:df06:: with SMTP id f6mr804124ioq.84.1575344006859;
 Mon, 02 Dec 2019 19:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20191202144104.5069-1-jun.nie@linaro.org> <20191202144104.5069-5-jun.nie@linaro.org>
 <20191203103320.273a7309@xhacker.debian>
In-Reply-To: <20191203103320.273a7309@xhacker.debian>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Tue, 3 Dec 2019 11:33:15 +0800
Message-ID: <CABymUCMVi_N2Mt82YDt7wrys4Z_vnXYEu15-YBa+S1CejT9iZw@mail.gmail.com>
Subject: Re: [PATCH 4/4] mmc: sdhci: Add DMA memory boundary workaround
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Jisheng Zhang <Jisheng.Zhang@synaptics.com> =E4=BA=8E2019=E5=B9=B412=E6=9C=
=883=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=8810:47=E5=86=99=E9=81=93=
=EF=BC=9A
>
> On Mon,  2 Dec 2019 22:41:04 +0800 Jun Nie wrote:
>
>
> >
> >
> > DMA memory cannot cross specific boundary for some SDHCI controller,
> > such as DesignWare SDHCI controller. Add DMA memory boundary dt
> > property and workaround the limitation.
>
> IMHO, the workaround could be implemented in each SDHCI host driver.
>
> eg. drivers/mmc/host/sdhci-of-dwcmshc.c
>
Thanks for the suggestion! Christoph's suggestion can prevent the the issue
from the block layer, thus the code can be shared across all
controllers. I prefer
his suggestions.

Jun
