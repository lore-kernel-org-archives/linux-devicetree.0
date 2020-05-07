Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377B4C38A24
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 19:28:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D4AF21835
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 19:28:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdTSQITh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgEGT2q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 15:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726320AbgEGT2q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 15:28:46 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18964C05BD43;
        Thu,  7 May 2020 12:28:46 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x4so7808755wmj.1;
        Thu, 07 May 2020 12:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+TiAbHa6s+Ugx7bbApaoMRBMqrNFoILtxpuojTitMSw=;
        b=GdTSQIThTeE11sKBViKE0okOVemIcJ15FUJYOfjUmmn5h17ygZMPs8UdymqoyLNTOq
         klaDWd4jSuyPQCebix28dHJd2bJRJeGPVqqZGBoSp2hbg+SoPfCJqo/6mrqQee/Tsi+a
         E871GyIC2IpNAC1329bLgB1Ob+PTaUjeCNo4k7MT6aShb2i4mjfQXVQZh1zgnQbuUCs/
         rhXEZQj5CfRJdEvpfMHx7DrybAmaw2oYD3AbyVOyXxcbbvoprAOVbiFmlyEEiLCkOvoH
         Np3Hf7i4SFUSGRAJpoDkPnX1K4NYwWJCH8dcsUToVEu4SssQ7r4JtfLpTtfrGZ/8o8Go
         8zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+TiAbHa6s+Ugx7bbApaoMRBMqrNFoILtxpuojTitMSw=;
        b=POb7boIQ6d2KyPcBREGqFcxV9jFvIptqAzRu0wEnDpnQV/WTnEQfTQfvUlPnnfbGji
         cckHggEuuilB88J2xOkQ0QIzjDl4TgQOT4doPHKHsrnxiOScJ3h8AlPIwj1j11GE4RL7
         +SavPIc35xRrJ7TA+iWhqggP85XnXnq5G2UVLuGb9nym3kAGB5DIhKCmcMN3sDz9fbMd
         pkaRz/IhBwl9UKU6+yJN0l7GqFP8mlw4PZCyY1r0DSSgimWbwIaPENYtGoHJUm5VuPnz
         1+/MVT4RjEzor1nefwNl4S+S3Q+6Os6AFZUqS2TYH+eUpLwXBtwM+e4cnL/tCezkBa+c
         xG+A==
X-Gm-Message-State: AGi0PuY23iAezx2ww3E52yxXhmuwHrtx5fLOBaNXPv+D/8po4jNR7tY5
        acysVGqRnPn491SOTEn/bc8=
X-Google-Smtp-Source: APiQypIXEHPa5wWlEPZYEUDeglvtdmY3ad0pnjRhAZa2+F9w99zN9Ww6Ej9qtFt0gcCtgyt5V0kktg==
X-Received: by 2002:a1c:7212:: with SMTP id n18mr12766818wmc.53.1588879724824;
        Thu, 07 May 2020 12:28:44 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id e21sm9715253wrc.1.2020.05.07.12.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 12:28:43 -0700 (PDT)
Date:   Thu, 7 May 2020 21:28:42 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: tegra: Allow the PMIC RTC to wakeup Jetson
 Xavier
Message-ID: <20200507192842.GC2905961@ulmo>
References: <20200507101349.14118-1-jonathanh@nvidia.com>
 <20200507101349.14118-2-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline
In-Reply-To: <20200507101349.14118-2-jonathanh@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2020 at 11:13:49AM +0100, Jon Hunter wrote:
> The PMIC RTC is currently unable to wakeup Tegra194 on the Jetson Xavier
> platform because the interrupt from the PMIC is not usin the PMC as the
> interrupt parent but the GIC directly. Update the PMIC interrupt to use
> the PMC as the interrupt parent so that the PMIC RTC alarms can wakeup
> the device.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to for-5.8/arm64/dt, thanks.

Thierry

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl60YWoACgkQ3SOs138+
s6Es6Q/9GhLRZmmpHOOix7FO7Ml59oyn6mmUcJPdwHFvtdwZJVJOVpolMMJXMF5L
wM9ud7s7j3ZkkCTnhJ4As3NQpN4xGbZn/phlPb5vfRcDh909rira2/yK0u0io0ks
EQt8gMTFmWzU8XTZwqdQE8q2udZ6oyQUnfLJXP2i9U4oUBhb3PZCr3zmFkxNKsSD
8mrWrvF3Pk24DubhN8ibYQ/b/S2ryRNcsZc04Ho4ACobDWh+atBko88VArys0AU6
hC5oEI8Bc0H7j0/WzVZxXuTKzRRy74jpBEMdsBd+9MutN35Iqj+GvLN4wQ4XU1K9
3RDm+MyvwgPqp8qHI/p47cgR7pFDtnYAH6Rele7Dac3sjbvYmgoKGszk//3QEWoI
Ol8ezNxMlLPTy7l5pQ4U93Ne3jZG+8VmyrxkwKFhWAQey4Ap/BOa8djA5k7Nb61K
CInSBsr61cwg56Dej/U339nNvOOuQvUShB6RmfK82OiFGB5D3qt/2Io2yW50bspv
YMpEpBixSXZMlpJXFL7KqznA6eg+6J+X4pzRTf+Og9Btxx/kOeWI/1fJ7GK6oKzC
WqnWqc7jQy5w4WDDOwiEgmt88FCkNVseiqRnVsK84yR84qY5M6ITBwpWzZxzJwc+
5mOjCJto8QdmzdMTgbesAw+KnyV/ehS8skr3YDhYHAERCBAH6/Y=
=OnkZ
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
