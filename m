Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4E4C433E2
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 09:18:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D96D221D7B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 09:18:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+tQ+ydr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbgGNJSy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 05:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgGNJSy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jul 2020 05:18:54 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC9D7C061755;
        Tue, 14 Jul 2020 02:18:53 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id z17so16311228edr.9;
        Tue, 14 Jul 2020 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nuLDVwUTXPiVmLbADGnToaQAJmJT7APkUOrp1HIBRm8=;
        b=K+tQ+ydrgyDvOi9FQSBR0lKBOvWCQ1KSWH47wTjpD2EPyo2cx0kiYvLYb7eu98X8YW
         hwzwkllmJUxz6EHCHAvdR7AtGHxXMbbSLEMlYOIrdNEYPzO3Y+mGP1HqRZN6xN+l2JDI
         6bXlqLfO7eFj7Cq2YNY4NCr4TbqVT9jAP4pPz1M2GxtWcEFHaG6NltQm642w5daeNf2D
         cjInINi2TnQC/mfSivzJp3HM9ILF37Rtl9kEtZ0kSHcPZ3vmmFXa4rZ3lzaU+ekNuIuN
         TWGqbZUCLVvL5vDy9iVFbzSDjlUK/VfFqeK1f8Ay93cpP6/nyYxrvGBj1y8lEpRT/WJ6
         gctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nuLDVwUTXPiVmLbADGnToaQAJmJT7APkUOrp1HIBRm8=;
        b=pfRPrM29yfw26vITBPtybJilwTgCPaqb1oSMR0xWB0av/fX6GiW4Cop1UTl6SeP5Ez
         mRfBRmIz9GwE1y99tX4LAyTdKUcSDDCErajxWi5o0kvH9W3ecKQ5WOp39qVyiubyce/U
         F6Lmc7h/zcimw7r4qD1vIQIAk/+3B0UqeYY6OfYrbh//8wgUQtqbx7uqPlkb9crvP9M0
         pojRQS8lXC21Lkd6RueF0U5/++u0jvAW8P0W513yyi5/vdoqo6hG5a6Eydp22ABzKbPC
         q8XB7UNYv/3sf6J+5cIWoxHRudwl7n6d3RNtfPgjKODd6IOjDxr3ffl2zoYUrZiBJqF7
         57HA==
X-Gm-Message-State: AOAM532TRmdlrAW0nQpl9gp261sWpyWchpY35RaZfT7sTrrF0TtcT//e
        KeuROIEuhB1+iRM7DcQTTbY=
X-Google-Smtp-Source: ABdhPJxvT81lPcB69ScITsSkd2mVshXRvNp8kl7nVBN6RoXp87X1TTxI3pzMs8221h5uCLtMMiWlKw==
X-Received: by 2002:a50:b941:: with SMTP id m59mr3450063ede.321.1594718332624;
        Tue, 14 Jul 2020 02:18:52 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bs18sm14019738edb.38.2020.07.14.02.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 02:18:50 -0700 (PDT)
Date:   Tue, 14 Jul 2020 11:18:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: tegra: Enable DFLL support on Jetson Nano
Message-ID: <20200714091849.GD141356@ulmo>
References: <20200712102506.23686-1-jonathanh@nvidia.com>
 <20200712102506.23686-3-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RhUH2Ysw6aD5utA4"
Content-Disposition: inline
In-Reply-To: <20200712102506.23686-3-jonathanh@nvidia.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--RhUH2Ysw6aD5utA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2020 at 11:25:05AM +0100, Jon Hunter wrote:
> Populate the DFLL node and corresponding PWM pin nodes in order to
> enable CPUFREQ support on the Jetson Nano platform.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)

Applied, thanks.

Thierry

--RhUH2Ysw6aD5utA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8NeHgACgkQ3SOs138+
s6GTrBAAveQYfikelPWoSGyB7pOtruDvFpIQ5mth2Gq+WsQcCiH2Wd4PEW3qucj4
787DGzApuSlKpD8g6lP0RlUqFkSD0Diye9l1sNUodUranfc0VoM5bf8ctUcPnTiP
E2WETtWnzZXhP/Lsn/Bf/lL483G52vWDx/UZSO/74SkUyZUhjKYu8OcDTnd4pigb
mwKhxOtt5m4ic/RLT/OgH41AFQo8Ac8j01rjZZ/3Bhy8jQ/xpfAfCF6sui5eGPn6
Wcpf+IU0GOZeZCYhsYRf3hjrhqe05Yhbfx5PVwgl8M5UHLooH3XXe0aa7xoesRfq
tss9OFAf7C+rG9NodN93xnPmGwD22H2wFSGpV2mPn+oZELw06OFJs/C74SJNdtOX
ba58yrtUxbdacKXwl+I7+TwxLDLzPLOQWN2rXeecooInw7M5CkjUxTmh5B+JX/pV
6Vg8jR/3apz46k2UWilwe4o5vwixIHvUqSENfSM4BajQDe0RN1pZL2h9aNwtlpTv
29JdNnG3Q8SOastfjTJEWIXitjYpXpfaCbfiPJr8Nc3vWoWhSy/TQAcWxpI/EeWy
iOcLfXbLpdh5oDgtDKZ9lJIMEehagV+v3FOgMGpSaNPZ4hlfGBl1vmelnmAyTOSA
0F7b7M4AkYhrPRRjHUkboknTclVoQdkSUfO99MDg31iUfi8aUNM=
=eYI1
-----END PGP SIGNATURE-----

--RhUH2Ysw6aD5utA4--
