Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B41BC83007
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 10:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B04F206A1
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 10:58:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsseRELG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbgD1K6i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 06:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726364AbgD1K6h (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 06:58:37 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E0DCC03C1A9;
        Tue, 28 Apr 2020 03:58:37 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id i10so24098229wrv.10;
        Tue, 28 Apr 2020 03:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=t5n1x2S+hMgzHe+DJTRE4uXUFYWCAd6cwy2zE9TXKj8=;
        b=fsseRELGzjV3nw0OnJb8J2yMMUals+T3NpyLSCeLTidRv9zn8DMxFkKyKdD57O4CJV
         hAjrf7r0FguwBG/jG6NK40oEyLvnCdGvp3w/n/PRiPEBrb+1UAkUyfB9O5QERqf0/6kS
         YcuHcAAp2e1/XkofVRhC4L1NQSWDB+QbYlexgj1BRqegG4hyu3LOs0K4KXZlC/4rtdEM
         2+NETjYYpaS91AEbjW7MiDq8hn+mmch1e5oO/pGtS7cCqEibUhYMWHeMeTpixr2KPNRS
         jQqm8kjnGigKykRb/mi/1PWEEgTbqDpg4ly8mwn2uzlo7dPlrZnb5ev/o/Rkgovz2CrM
         zJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t5n1x2S+hMgzHe+DJTRE4uXUFYWCAd6cwy2zE9TXKj8=;
        b=QEB9mLEl1tZcYrlCXzLyeCZOwlTKioEt2TNr4ExP3YJmpDdV41ZcDALqzJGZgQoNdi
         z8Gqez1CbdsFNp+8ecy9t3CLw9IuATiPaRPFNHGu0F+fW8gds4J5dBH1eIVT9gPpdKjs
         kUkSuyJ5nqDohjZj7GsZQYvtctyC1hTQ91j26SpBd5V1BQFEyppilOMNbvev9biID7CW
         3NQnTvK/DtSji48KDTMVGSmreh1SyFsv5A2xPn651Ag4ly3/CUpG/u0DCbhEjVT3/plQ
         gKOjN9BJR5NQkVC8nmKLvXljaqsWQfg3qavd7xZWlQVdDoXH3v+X8gbtWxDwvFdxXn01
         9IEw==
X-Gm-Message-State: AGi0PuadHD41owXFccnQQYdTFiSuFm5K2Cdk1Vk/BAWvQiPgnaFbgJq0
        5brBiu8h5g7d1wBTSLKEqLo=
X-Google-Smtp-Source: APiQypIgHZ4wbuHTwISD2PgDLUFcIjklJBGdOddlFw0x5NjmTtmMuFA/4Th25Tf2Ulo3BTah8l9PCw==
X-Received: by 2002:a05:6000:4:: with SMTP id h4mr33856041wrx.386.1588071516225;
        Tue, 28 Apr 2020 03:58:36 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id w6sm25776444wrm.86.2020.04.28.03.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 03:58:34 -0700 (PDT)
Date:   Tue, 28 Apr 2020 12:58:33 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH V1 1/4] dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB
 controller support
Message-ID: <20200428105833.GK3592148@ulmo>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
 <1587022460-31988-2-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5dNcufZ4prhark0F"
Content-Disposition: inline
In-Reply-To: <1587022460-31988-2-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--5dNcufZ4prhark0F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 01:04:17PM +0530, Nagarjuna Kristam wrote:
> Extend the Tegra XUSB controller device tree binding with Tegra194
> support.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--5dNcufZ4prhark0F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oDFkACgkQ3SOs138+
s6Emhw//X5T2bBokenhft92gCDW93wpq/OSYsj6EENSnKva4cUvKJwme/xbzPGx+
mfIOhlR/BmmOXgkCPQ7sbSkpEAxUv2hmAvh3ASZsxQL7jsqfeP1GuR2khkq1uvfb
JiNY9XHdKFcdxsRqBCTlt2kllTqIANkLbKCUfSO7Ru1JFwAXlD5HFziIyVZh4QvD
cARWy+t3wkDf04goNM2OsMYihAyNd8p4TMylyDx169PlBDcn4GGKlgOoxvaCQMnz
c1Y7OmOpF4j6C2Fswbs4bJr4M1UNN+Vgvl8dG0pBYk1iLdYa1wn/kupAheR2yIBo
0C/1t7Kj8ledBkjvBx5sd7BWcoo1RKXseCP/dElWY/JtPeyWyllQBi+o62Up76h+
1aimXHp0L5NkmAXoQaGRrcSR9qEchdAy2JOW78569wSNuWoqN5RlXUdD93dz1PB6
NOpKOUAyUGckAIKzc9cgGPFKIRMFqLDE6vSktJFEkrT8qOjui/9J5+OOjEPWP9Uw
Ckyk7wzXNjDIOnoePxdl/O5aD0zENQSHkZQSXmM7hQxPbDNnO4G4hqMvtJQR9Yr3
n4Zt0UvTKT+9ZeVUD5kPTUX8EfARr81ZyzUtOq0TvLxkSevnsm86zJhNWhZTF5XK
1nxENTF6xhGB7OjEED5W7UsWNdRe+9htq6gDDCMAv+SNpRfrbLQ=
=iXcs
-----END PGP SIGNATURE-----

--5dNcufZ4prhark0F--
