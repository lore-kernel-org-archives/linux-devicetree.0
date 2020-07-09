Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D759C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 22:15:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 461DF20672
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 22:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=android.com header.i=@android.com header.b="n+038Tjh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgGIWPm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 18:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgGIWPm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 18:15:42 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D5EC08C5DC
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 15:15:42 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 22so3685107wmg.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 15:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YV5ok+j1ZT/dco3d+Nz0ZXx9+BHs9rHibjoQkrG+QM8=;
        b=n+038Tjhb71ibRD55ko60vZKGBkLBpa+5u0uCzn4SkeTo4zPrf7hwntZ4bM0cj8EIB
         2fGAZWjNqSc4p/WtfrXL7RG/k2uPkp3NG2Be0yhpP38voG6zUT/NLMz+JSx2EpDp8GEY
         wKcHtFBDkEFEu5vrMCLf60wAYuDGXNcHesd9c0GwbNxbnKHRum2lVXi9JEqYO/uDXLWl
         x8WSGDkwlrNcLbxXnkD9Xo3THr+Xq7sHTbtxOTXCAnHC1ap0pi90iNBa+JDGKxB8ofsx
         xcrt6qzrKbnkRvIqolYaHMxCnlJUnfdh7hKs8ZbSHbAR6ME9yR43A18lRVp2tFUGB0Nu
         tc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YV5ok+j1ZT/dco3d+Nz0ZXx9+BHs9rHibjoQkrG+QM8=;
        b=Ogzt0/maCN7MJya64P0osmaNgcZu7bIQxszSZ7nWm01n0o958d+FDP01pKTllQCban
         fTqGciXK8yECAqvmlnpA1a4tzkXGukjmaP0GZjBSNHe+vfkNEW9edsUv2N6zxxYsiyda
         CbKIBAvXHy2jD5rfptfyGkkgrjJAXkf94VtfTuqifNL+AzUT9LMZ6XbFslxD4EqLXh+V
         LFrOgV2m3mgrLNSOn5eLL+c0baeAzdditdSznPU4oJL2IyUSTI76qmUgjdF67SuA2lPc
         oUAmMVz7cMPKrk4H9XRotgOxYOGxmI3UiQL3WOprwrM/Ad8DDigVaKLAnywSwic2DrzR
         ghLA==
X-Gm-Message-State: AOAM531y51eDOOHmlL2QSwjYFHK1EidHromDAeGwaUwkSpAJAwt6rGyu
        UZmTGSYBefTazacWCFcjZJYmgp3c34B++fginfuITw==
X-Google-Smtp-Source: ABdhPJzBUPiaq/koBIaJnoNmCkU+vD75nXFOBaObB5XKrr17oXCtBX8QKANnTp1E5WZxyvfMV76bEU3icd2omVveNeM=
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr2024013wmg.110.1594332940934;
 Thu, 09 Jul 2020 15:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200601094512.50509-1-sudeep.holla@arm.com> <20200601094512.50509-3-sudeep.holla@arm.com>
In-Reply-To: <20200601094512.50509-3-sudeep.holla@arm.com>
From:   =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>
Date:   Thu, 9 Jul 2020 15:15:29 -0700
Message-ID: <CAMP5XgdMqJSd6B+q+WpjEsnVXXMam12Ji7R2-szS2_miGzdNEg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] firmware: Add support for PSA FF-A transport for
 VM partitions
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jun 1, 2020 at 2:45 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> Initial support for PSA FF-A interface providing APIs for non-secure VM
> partitions.
>
...
> diff --git a/drivers/firmware/arm_psa_ffa/Kconfig b/drivers/firmware/arm_=
psa_ffa/Kconfig
> new file mode 100644
> index 000000000000..ba699ec68ec4
> --- /dev/null
> +++ b/drivers/firmware/arm_psa_ffa/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config ARM_PSA_FFA_TRANSPORT
> +       tristate "Arm Platform Security Architecture Firmware Framework f=
or Armv8-A"
> +       depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY

Most of this driver should be usable on any platform, so it would be
better to only depend on ARM64 in the component that has the arm64
specific implementation of your low level conduit.

...
> diff --git a/drivers/firmware/arm_psa_ffa/driver.c b/drivers/firmware/arm=
_psa_ffa/driver.c
> new file mode 100644
> index 000000000000..700bd5850746
> --- /dev/null
> +++ b/drivers/firmware/arm_psa_ffa/driver.c
...
> +
> +typedef struct arm_smccc_res
> +(arm_psa_ffa_fn)(unsigned long, unsigned long, unsigned long, unsigned l=
ong,
> +                unsigned long, unsigned long, unsigned long, unsigned lo=
ng);
> +static arm_psa_ffa_fn *invoke_arm_psa_ffa_fn;
> +
...
> +struct arm_smccc_res
> +__arm_psa_ffa_fn_smc(unsigned long function_id,unsigned long arg0,
...
> +struct arm_smccc_res
> +__arm_psa_ffa_fn_hvc(unsigned long function_id,unsigned long arg0,

Can these two functions move out of this file so this driver only
depends on a function matching the arm_psa_ffa_fn type?

...
> +static int psa_ffa_probe(struct platform_device *pdev)
> +{
> +       int ret;
> +       enum arm_smccc_conduit conduit;
> +
> +       if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
> +               return 0;
> +
> +       conduit =3D arm_smccc_1_1_get_conduit();

If you make this device a child device of the conduit, then you don't
need this here. Other conduits can be added to for instance support
other architectures without adding entries to this enum and modifying
this driver.

--
Arve Hj=C3=B8nnev=C3=A5g
