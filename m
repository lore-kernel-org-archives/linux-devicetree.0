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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F049BC83008
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 12:25:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF61C206A1
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 12:25:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvOVlnDd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgD1MZQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 08:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726739AbgD1MZQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 08:25:16 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204B8C03C1A9;
        Tue, 28 Apr 2020 05:25:16 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k13so24441096wrw.7;
        Tue, 28 Apr 2020 05:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=781oNo11x931cim0fl8S1PiQGZJbX/Ze59g07/BoxgM=;
        b=CvOVlnDd5fDcNAf95b63/H/YM7RVcHI1AsIXCZWs6gsASaiIrkBZZkrIruuBH9BLU3
         Uo/4trUJNULx5eRudzZ4inAv9067APiAs04NPlbwXStqBqxPyIsWYRAEeiRmbqN8CW+S
         xLnyweO/An8GSYeEecBbC4e5D2gmZpK69UoD6V/ErJB08gn+A3aeknbXlUuOm1eHCjQH
         pys9lKHWLP369LJa+OqWrzAyX36BnkkolunQNX6Iw6E44B2ZOzJ23UPR/f5HOiB80Fgq
         Key+z9TLf00n/nIgoUePNFEPE/gqrSx7i5Q3jw9u/jncMVw0vVpD4grN+naolCu2oqBK
         W3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=781oNo11x931cim0fl8S1PiQGZJbX/Ze59g07/BoxgM=;
        b=jeWyAfLeFhuf/iSriOsctbvKgDKMkI0WMcOoKWaqsV9AMmDFHpNC45TxnBYPPnz6bj
         GKkrliKXjwBDHa/woX8EPh4ViTO0TEZSbfx6soHvazszJ9ZI65Jf9bdVTCvtzI60tsPm
         K2IhKs0P4IhkotOpfef9MW4yMyiTEH78Ma9ULfdClrnwv87sced5z2q9jidIT1DQAHBQ
         cST1zG6yA7owwKbIxGR1151tu/zv8LLrcjEJ7LjbJ33Xlr2QJ4kBOpTMPNbWz7sAWOLY
         PeYoAH8C7UO3ggowFp4yksaMMtOlBzXvjSktiuvMaQgVQ6/1oX3rcO6hcVExR5vGCViv
         5gtg==
X-Gm-Message-State: AGi0PuaB1odfwnSk8ByeXaDeMg93stS2cEITISCOoyjJB0/7f/FoEZuN
        QxTjrTJmkOu1PrLcfrQv69o=
X-Google-Smtp-Source: APiQypLDXIxO7A0O4EZ58eEalijCyP8izHMI3fCOongyuPYiyfJfo3JND95DyqhBt4AHPgT+1LPYKQ==
X-Received: by 2002:a5d:5304:: with SMTP id e4mr31268481wrv.87.1588076714459;
        Tue, 28 Apr 2020 05:25:14 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id j4sm24826680wrm.85.2020.04.28.05.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 05:25:13 -0700 (PDT)
Date:   Tue, 28 Apr 2020 14:25:12 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH V1 4/4] usb: gadget: tegra-xudc: add port_speed_quirk
Message-ID: <20200428122512.GN3592148@ulmo>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
 <1587022460-31988-5-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NJSRbAqOy4NeGDns"
Content-Disposition: inline
In-Reply-To: <1587022460-31988-5-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--NJSRbAqOy4NeGDns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 01:04:20PM +0530, Nagarjuna Kristam wrote:
> Add port_speed_quirk that modify below registers to limit/restore OTG
> port speed to GEN1/GEN2.
> SSPX_CORE_CNT56
> SSPX_CORE_CNT57
> SSPX_CORE_CNT65
> SSPX_CORE_CNT66
> SSPX_CORE_CNT67
> SSPX_CORE_CNT72
>=20
> The basic idea is to make SCD intentionally fail, reduce SCD timeout and
> force device transit to TSEQ. Enable this flag to only Tegra194.
>=20
> Based on work by WayneChang <waynec@nvidia.com>
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 106 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 106 insertions(+)

You're telling readers what you're doing, but after reading the commit
message, I have no idea why this is being done. Can you provide more
information on why exactly is this needed? Why do we have to limit the
OTG port speed?

Thierry

--NJSRbAqOy4NeGDns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oIKgACgkQ3SOs138+
s6H1XRAAgIkN+EUOOO1bRRCqdItpBhUzAnXz56qxx16NpYjpIjJPHwPtCDwb2XhK
NK6gSk93H07QtoJtWLRt74q5c/exqcYbFDpP1Zx1tnPaK9IlTi0x450TBO6cW5QC
NDeOAyRwckbJT16Iab59ZOM6uSIW2VnB2eHHmEiq46mKPm/TQb2aE3lJMjkNskE7
ZzW7SCNwfkJu7r8WcDq/+4jYjg+/0viQ/jd8gyZCJ+WqQu+G6qlPws2D7sVlta6Z
PjC4lWFddArpC6W1Xvhq+I0cDJ4ActilTeIeOnSPF60T52S1Uso4cJRBn0AwGcaG
Eoab3z2D9s1HkbvCwbteWpMnXWuscXasxKonQ71Z4ifwcQFxoXRtNLBFKrX+Zdxy
azEmdmu/6WF5AY28LvmM36UzWvQgPcXimOE2Bb+fOUOb7jW4qtqTNbBPtSJg8zqP
NlzMxQ5JDfxhdG7W/A9MzV31cuDjLSWCI59BGSEOcoKjN3ehapybAHxfacvpqarz
VoEvo/KG2AykqH8Xx5DJU7eLyOHZKSTF86mHKCucU2G+7NcdMi+j8kQwhzY41rDH
2G4Jh8ycg/HpjIdQLXebWLZh+afh2M0LxX9ShM6MJ4KrTph0hbnzf72mCHhmRzFk
C5g1JrwbmRR+tdwsfbSUHOnK7S4J+kG65VCCuyKexREetPWzeY0=
=KTH2
-----END PGP SIGNATURE-----

--NJSRbAqOy4NeGDns--
