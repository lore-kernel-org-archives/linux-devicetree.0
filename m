Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3ECC38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 19:27:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3368721835
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 19:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6unrzNT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgEGT1l (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 15:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726320AbgEGT1l (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 15:27:41 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB37C05BD43;
        Thu,  7 May 2020 12:27:41 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l18so7758667wrn.6;
        Thu, 07 May 2020 12:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LlPLDfwje1tAdN3zsiBftfq/kTS7lRiyrpRwWyfLplE=;
        b=M6unrzNThRfyWrZVItZ/vv2gQIz9R3orZi/f29sjnr6s2E6udusGdMOkvWNy24MJWW
         IG72WdmO+QQPsdidvgI35T718pNf0usOFEo5uO0YO8I2WSH8jkM+ONyw9mUpqvlSCyQN
         xF8DlsTaeOu3kRJXMRH+2p806dKUPrmr4zbUY00R5onhnzmdIMoc9T/wsqHlmVmmdyOH
         VsnPfmSTyVj93S/9M2q7q0qf1N6f1HBYPL1g+rCYbw7Wwh526vxaMoV0hPuIhinLC1HX
         tPkA3zpGGtToGKp0HtzxsRRJ1kiKsc7EpXriSJKOxOVijowmqtZNWlyPfRwXgf15DFel
         0n6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LlPLDfwje1tAdN3zsiBftfq/kTS7lRiyrpRwWyfLplE=;
        b=AYNPo5ex/DO9k3h2PcNhog3ZyH5HPejpsi60+KJrcVrjXbU4tUgCiosQAGd/AO4xc+
         zyuFVRlv/g0y+C18XyQwtvpBO4BM2GfvSe+MgWK5IwKuDyiqISj/D2NUhU7czXICW/En
         dV1EBXbU3R/BE7JwXNDmdYRu/miAOckQEEQ7NqQv8y4nfz83RGEFOwVvP0A3VoKDGpGm
         wzQWU17zeWD00DYzEJaYJr4blLBPOB9pU2LP+mB8YL/IyW9UFXtD/e3IlQKGLWiqzZYv
         VDVwiTQU6rcl7wKThfSvvwQZhmRuugFUp9DEsHBEIOprCzcczOL/zvGkof0tHgM1QHkr
         xkbA==
X-Gm-Message-State: AGi0Pubt4/K3XiHHTCSiXNNM8xzS5GubeJeBVD281Z1ThlQqtahhicDb
        WGjka5WHDEFSsIXmGzQPcDsfa8z7OaQ=
X-Google-Smtp-Source: APiQypLEvlk9fY0LQRrNunJJ4ly3QRqhHeoVn2/nPql9tAv1ZvP1clgNwqxrUPLpEepxu8BDr6+CBw==
X-Received: by 2002:adf:e90b:: with SMTP id f11mr17056980wrm.364.1588879659978;
        Thu, 07 May 2020 12:27:39 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id s12sm9171650wmc.7.2020.05.07.12.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 12:27:38 -0700 (PDT)
Date:   Thu, 7 May 2020 21:27:37 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] soc/tegra: pmc: Enable PMIC wake event on Tegra194
Message-ID: <20200507192737.GB2905961@ulmo>
References: <20200507101349.14118-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline
In-Reply-To: <20200507101349.14118-1-jonathanh@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2020 at 11:13:48AM +0100, Jon Hunter wrote:
> The PMIC wake event can be used to bring the system out of suspend based
> on certain events happening on the PMIC (such as an RTC alarm).
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-5.8/soc, thanks.

Thierry

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl60YSkACgkQ3SOs138+
s6Fz1g//Q5iLIzPYo4fuJLRgZp7tCFNkrigukibQ22iSDLgmes6200DvfkFd4o9j
PeFSs4LsS+/cP7lc5jS7PyKBH2QfTvYqCPFSpb5aKS9YUhagGdNcFcTYnMIp+JCW
gngiBV36gBHKMortvFh6hhO1KPNKhltWEDwdUj04bRJ7n2q52ZBR1PUkvTPiVeZR
mIk4kW1HTk6Tl29rLZ003HhL7aluyGsQsQwk72S7/P4PxRTvCYcgDamBetymvHwF
CGI5MKXslq6oQ8+hOAr8h3uQKEzuGeufxWoIkUEr1h5OS2yyp4bcP3tdYzwQCzcP
ZE+a7Zw1vZOmpZ7h1lmhQP3M6rLLKrra26alHnFUnXzE4ELbmksxNh2UAcw7DyhO
INy2hwjUTGT08HtBDLUIaLGcZCRMFnVuOu2BNwUkR9UzO5/gqqpXgFb+eTLdHZUL
w07KEYtM67f074LIn3BsOF83NjOW4GA9yF90Jf36xd97LWWWkb3U2W1DEVV0EFHx
kQcYKUmA6R2j5otTwe7HgkBwPpnvlNYmhHwOYNplbE7YYn6XAOepqOfp/A/rkHhp
3KRUe5TKOC0Hc3yeV/sVv+JovgK+3LCVTNSreOSgOdWdrHxCUjhoNcim9vgg8ROV
n8+oDDXzXTpbWKctMSlSQuu48z2VKQUSOdio5pGisJgmQIttLOU=
=/INY
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
