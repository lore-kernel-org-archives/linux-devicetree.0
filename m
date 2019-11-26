Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E646C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 08:46:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CC0420722
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 08:46:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3v7S2dp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbfKZIqC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 03:46:02 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43399 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfKZIqB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 Nov 2019 03:46:01 -0500
Received: by mail-wr1-f67.google.com with SMTP id n1so21384183wra.10
        for <devicetree@vger.kernel.org>; Tue, 26 Nov 2019 00:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S9TvAxqbs52vNSqgx+w7DI/11Q+Ur87GTCZWKyu+iKQ=;
        b=C3v7S2dpBoq5ZrjAYNyEJuTPQm6IZXqtXV1ZTBQ56D2g7jlgWB3CyBizpFA0uFns4a
         wPyDX/rFFAkfeMDbYWihAE+nldjOVAvvxQCpUTwmDhJTAR7qimqorNolz6VajtmVMgpA
         2N8Gb7qruF5CT5u7XsG70FeNC3bQf8bVo5SVTRO8Oo1+Y24Y00DvJpPcmEHclV+j8UQU
         slHyEMUtLwKJaWoGYW96NioHwsUFE06PsHlkaplh9IbfjUVntjIntGo/79SgcRKrYheu
         pqZ9PhXLu7WAOKScd8xIMdTp5dHGjbyOiw2W50f80iDCKL0ondE4+XCdj7lagw7Cl0hQ
         ka0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S9TvAxqbs52vNSqgx+w7DI/11Q+Ur87GTCZWKyu+iKQ=;
        b=ggtlsWquxQQob/1LJoczJqKis3tYuQNq1CElrTCKAPz4/fV+xzb5ZXKNSE8AfUkCzG
         Z1brSOyJwnV9qCwt9rqmBXUx6UmE6pRxUZbZNah692Zpsu92e2lF7SYAEu/WlHv0KpxI
         jZW/a2wAII5uCOPB8jDEcMZvYwzZ0+p3HLrYhKm0m+lyeQGENeYfexexPygN8KFrOe8W
         A9hq+ANfu8TT0UaOzmtuXzKQpiYTo4cdgh2AQ6xKREcF59UCqoWQiLT7G2GC+RLeftp+
         5vdGrgyfHysph8+Ocj45aizMG2Dx3Wgn7iba10I83rYfDYkJRIe/RbQoq8s3+f3jOhx6
         Zp6A==
X-Gm-Message-State: APjAAAV8MLZ8xuSF+nOxUfR0vjx81YMUHkjTceTKGUlPgI9vEc5py2Nw
        Fhh+z/meqzRAEw3fd+j1ix8aXQp1BDIIfhCJEEXpfQ==
X-Google-Smtp-Source: APXvYqxS5YJMNni/yigCyW2ja2TZreuwrAOgP0T+I1ix8EIUJsJWK79Z9hs20cpcH2g9W+2QqBaCGOjV2ybffpZLNfc=
X-Received: by 2002:a5d:6508:: with SMTP id x8mr4054278wru.0.1574757959603;
 Tue, 26 Nov 2019 00:45:59 -0800 (PST)
MIME-Version: 1.0
References: <20191125225110.10924-1-ardb@kernel.org>
In-Reply-To: <20191125225110.10924-1-ardb@kernel.org>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Tue, 26 Nov 2019 09:46:01 +0100
Message-ID: <CAKv+Gu-h5X4bamP=Fy2kEpeqTtUNz=TU3AUpGtHY5caBpdVxeA@mail.gmail.com>
Subject: Re: [PATCH 0/6] dt: amd-seattle: update SMMU and PCIe descriptions
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Devicetree List <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Lendacky, Thomas" <thomas.lendacky@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        brijeshkumar.singh@amd.com, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 25 Nov 2019 at 23:51, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Bring the DT descriptions for AMD Seattle up to date:
> - upgrade the existing SMMU descriptions to the new binding, and add the
>   missing descriptions of the PCIe and SATA SMMUs
> - fix the description of the PCIe legacy interrupt routing
> - remove the obsolete A0 Overdrive and Husky
>
> Ard Biesheuvel (6):
>   dt: amd-seattle: remove Husky platform
>   dt: amd-seattle: remove Overdrive revision A0 support
>   dt: amd-seattle: upgrade AMD Seattle XGBE to new SMMU binding
>   dt: amd-seattle: fix PCIe legacy interrupt routing
>   dt: amd-seattle: add a description of the PCIe SMMU
>   dt: amd-seattle: add description of the SATA/CCP SMMUs
>

I'll need to respin this - please disregard for now.

>  arch/arm64/boot/dts/amd/Makefile              |  4 +-
>  .../boot/dts/amd/amd-overdrive-rev-b0.dts     |  4 +
>  .../boot/dts/amd/amd-overdrive-rev-b1.dts     |  5 ++
>  arch/arm64/boot/dts/amd/amd-overdrive.dts     | 66 ---------------
>  arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi  | 53 ++++++++++--
>  .../boot/dts/amd/amd-seattle-xgbe-b.dtsi      | 16 +---
>  arch/arm64/boot/dts/amd/husky.dts             | 84 -------------------
>  7 files changed, 61 insertions(+), 171 deletions(-)
>  delete mode 100644 arch/arm64/boot/dts/amd/amd-overdrive.dts
>  delete mode 100644 arch/arm64/boot/dts/amd/husky.dts
>
> --
> 2.17.1
>
