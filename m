Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DC6C83006
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 12:21:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95C852072A
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 12:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVHJv8nD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgD1MV0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 08:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726645AbgD1MVZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 08:21:25 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A73C03C1A9;
        Tue, 28 Apr 2020 05:21:24 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b11so24383843wrs.6;
        Tue, 28 Apr 2020 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gQggrWVxtlWooHJ9VvmMjmE6560rDoPz8QZk/w9nGfo=;
        b=IVHJv8nDbrtfq5tdFexHAMTsPWZ803scNQRQKY+ISa4BbE+YECsfirgQ/S3MPdYhH6
         0bwck8PpsJMlwLtQoyG5YWtamswbd3krm8bMowxOBCGHRZjsCtwqEBtJ2dNnYn2JhcLj
         yOtSrT1IEd6WYSyryGcGnd/NzMVNhvgmwpoVhFVvFazZHxpW8GYKzV7zKOyMueUcI00d
         ZAdBc54nJOz+glnQ0J1HqzG2wXa7zLK6fBiMzrmxuv4J88u6yB6F37tvzfVyztw1rGEh
         LGxLOjKQ4v1a3WDrFck8dYGDbeqLmfBFs09owl41HHq/J+ufj13ye7RAAXd67q4WjH2m
         mqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gQggrWVxtlWooHJ9VvmMjmE6560rDoPz8QZk/w9nGfo=;
        b=BWZtahYK7i2cuvi1trxCpjB7uNxC3kfI542n9X1FnOV1MKHIQBy107LukdsakHpfVm
         nhrJXqtn9IzvsmiMzZ+dxdt3Te4wMOrgoBCuO6JUTkiiHD9cThI2PtHjddmimh4/92F0
         qHTZqU6gr97tbZU21nRuPQ2MJtIuM4BKMHF0uZlvlScGRjdZP/3dlDq8Bu4f3PwR8byq
         Dpn/B78W13DYd+IsY9gZvsS6u5qgDvSnnEDWdkDh+BodOnJixw3PmIZG+ppY/Ryp2Jly
         oZzBC2LwK6TrchYqPKQxC6M/iK2pEnMJSbxSJdkn/pC9dlH0HQlITNz1DOLYBnyjzCTO
         miAw==
X-Gm-Message-State: AGi0PubJXZDIZlR342CxMdeANbH9GN10ae4CtAfRhc5yFVPONOHO4iE6
        e2Q+ZZ12IJoiKt1ddsXEIRQ=
X-Google-Smtp-Source: APiQypJoUxDi9VtW8QtRjJtJubunQk2bk/KU3MhPGbODlHzGpoj4Jnd+OiIVJ+ozdHhcjSApv2ppiw==
X-Received: by 2002:a5d:4485:: with SMTP id j5mr31113728wrq.427.1588076482889;
        Tue, 28 Apr 2020 05:21:22 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id a9sm2932215wmm.38.2020.04.28.05.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 05:21:21 -0700 (PDT)
Date:   Tue, 28 Apr 2020 14:21:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH V1 3/4] usb: gadget: tegra-xudc: Add Tegra194 support
Message-ID: <20200428122120.GM3592148@ulmo>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
 <1587022460-31988-4-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VLAOICcq5m4DWEYr"
Content-Disposition: inline
In-Reply-To: <1587022460-31988-4-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--VLAOICcq5m4DWEYr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 01:04:19PM +0530, Nagarjuna Kristam wrote:
> This commit adds support for XUSB device mode controller support on
> Tegra194 SoC. This is very similar to the existing Tegra186 XUDC, with lpm
> support added in addition.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc=
/tegra-xudc.c
> index 52a6add..fb01117 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -3494,6 +3494,13 @@ static const char * const tegra186_xudc_clock_name=
s[] =3D {
>  	"fs_src",
>  };
> =20
> +static const char * const tegra194_xudc_clock_names[] =3D {
> +	"dev",
> +	"ss",
> +	"ss_src",
> +	"fs_src",
> +};
> +

This looks identical to tegra186_xudc_clock_names, so there's no need to
duplicate them. Just reuse the other one for Tegra194.

With that fixed:

Acked-by: Thierry Reding <treding@nvidia.com>

--VLAOICcq5m4DWEYr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oH8AACgkQ3SOs138+
s6G2ag/8CU0kKOqPbPmx1dYndCz1V9xbrpIjqRROzzgU7SJ+NGfKfceJe7gTfGZM
AZKeUlVoN494QnDJSB4Z1wII+i14sio5Y7kznzURcHniZnv2leNqI3jlagiVYCOe
nTgBwCPp7Ls/pzgmOlULelIVr/7xtEbxXFB9V6VCkV67jEmsaea8FUGmksXIC+YN
u/oFdPHWhXw96NHF1PBHpyuLNdGyw8iXB/zLn/zJC05eSfQirP1xb5oWDXZNIe+9
OZjNEWv7hMJEpt+Xe7T+6EBSH50Se+yMfj6qX6uZGHM1xY33JT80K2acbAOsKxYT
6JBTUQ655uYJu8+fxV1yl8eUJhYUjkU/NLTJROBqKBD4TqOsNxFSiqVckEXG0d0p
T/r3mKHEKbC7NB/Fd7xL4JTWkK8erqLWzgqOzc4iz3lJ2KHEPpnWkWsGGBqiMJPV
BUUugLiZ6XWi5S3L1OXkqV5Ritz5PWaHzLSYHaihSO7e8p3WDdDNAcLPcy651buQ
cBjHlsMbABNo459gBdiEvbDX7MWkNzWr8QjBzOK1wigVSUav9wKvutCwaFsIRJfh
44KtPIK+cdyaQIoK3rFHKaTnNlD6857wJWqhuOyYTcd9znRh/e0xU3d1Jwvb6mBv
a+osPQeem0I+hhJg8dP/FqLGHK52oM5kA1IZNPh5ZOTX9d+dh50=
=BU7n
-----END PGP SIGNATURE-----

--VLAOICcq5m4DWEYr--
