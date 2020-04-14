Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484CAC2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:48:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2466D20656
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIGVfYNJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440263AbgDNQsN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 12:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440012AbgDNQsM (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 12:48:12 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1849C061A0C;
        Tue, 14 Apr 2020 09:48:11 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z6so14864711wml.2;
        Tue, 14 Apr 2020 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HmHndUdYmjfvwN8+szi9UffSkAWgcwK4XPxePVLmE5E=;
        b=cIGVfYNJIFIXzopt97czJ66YgjE7dsheWI+C8GytAm+zVbtjEemAcHk6ZdRb3V0lBT
         4OMKcSxnkWHVz5e1UM6cU6JX9VvgoWh+pPwkfoMk2fgsbppO7XIh8ktS07sUAvoK0y/N
         u5Ah1U9mChTMnpuuq9YNzWsfq777eO/6OjnNXuC9l18Vg+UQz7oPfnRBlSbdz9GUt6Wi
         H6LH2heqSjvmXdyAiOmSd1lBl9DksddEfLSEy36kBKxUh2Ap0qxfRD4a7iuIieFcGEt+
         BKY1Sj1w06gi4tptdCVbhEpu8alEO8/29tUz1srETZFJ64nRodbntvMjK6vYlm3eJH8e
         2YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HmHndUdYmjfvwN8+szi9UffSkAWgcwK4XPxePVLmE5E=;
        b=GEULIrOnm0/CkxAOGacRkC0sYTdPKP38AP5troBmTTzXx0Lke1lBzt9mOxg2pZN0cb
         SwIhvJmvPgP81+f+444kIQw7UsHltBgNndqZOapFg/TnWYGLL/NqfAyMP8plb9ICepIF
         PhE9jl9QuOWcynf07+q71AcL75+yvEmv0CF/eIuA0bG9q7VJqWIQxaiWIy2uYz/tNDt8
         swWhOtdLudlqEsnfOJbaFTWhRXi11X4pUZmEsxifnFZwRspH64m8Lu1ytIKDKH3xKV4B
         3atWxcOv43pPEzaugx8HS9vJhwf2pM/KhR0Na0p5+R4Sg4vHBstpdDFgpfMm6mTUD5ov
         OT5g==
X-Gm-Message-State: AGi0PuYYgxsJEGo147TFJYUbLQ/PCsIZFj9tiq7ozwTHC/fODSAvDLVo
        kXBXueb0z2IHHzazwyxWrUA=
X-Google-Smtp-Source: APiQypIHuIKA92yozOH6Ncxbv9kbJEehQ9zh8Wp/4dmg7gSGA4CMpUjWByNqYERfgv9OqDb3Yh3TEw==
X-Received: by 2002:a7b:c010:: with SMTP id c16mr776352wmb.73.1586882890736;
        Tue, 14 Apr 2020 09:48:10 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id o13sm20192640wrm.74.2020.04.14.09.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 09:48:09 -0700 (PDT)
Date:   Tue, 14 Apr 2020 18:48:08 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
 Tegra210
Message-ID: <20200414164808.GA15932@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-12-thierry.reding@gmail.com>
 <543bfc3b-2bb9-01d3-62da-89d1f0b18a5b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
In-Reply-To: <543bfc3b-2bb9-01d3-62da-89d1f0b18a5b@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 07:40:55PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > -	/* EMC training timer */
>=20
> Guess this comment isn't really needed from the start, or should it be ke=
pt?

Nope, I'll remove it since the code is already pretty explicit.

Thierry

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V6UYACgkQ3SOs138+
s6FQnRAAwJoMauB0YUdSUVh1pXLf4jHxluqKui/zk3P9bXAk7mLipovO5mcIkkHM
lYPBh/nhQGROQJVqOuf3JBG13bkJvK8DwONh/k6n/GFo6tR8wCid4UX4IEiErdR+
sM/977LWhcid/wgZPtLv4vT2+M3pY3ZdqDOYIVf9ZHxD8DkLIIOKZ5IavNCfD/GF
xA1qhkmrlAiuV3GGP5mFDeq+bYml1ZVfxV2eSFq4fIFWzCcK18AQjzdweOkRLG5t
H3AoaiIVk9D5SnuH1zy/fsWHc0kMhhEE5iSsTL/uUM2Rm8687u9kCzjz0lxEz2Z6
1zOIuQM5rExo+C5IXR+Z7AvVIl3uR+NxJD98JstB6NPK7jPTG7F7PX1gdXVx2VGg
3N/9o7x17N8Ns3mM8enK2YrP605ExK8zvAlJaAbWJDzoeLoQDFsmvSmIKk8Tl5VF
0p+lFEK/T8yIlXwd4xn4pOHmmZX4+dqJP/7v0O2egfcMBRUB48BeCPDv1H0/Lice
taivRgUpG8GZv2VwGNywnXYhpAnvOTOmIxqcFFB8Nqp0abTwoSrYqZ1Nd3dukNHj
7QrRkysO6p2cEA/ZZK7YAuFK3AVk1gSYLJy3hI9LM6rNWe/6jr1H1WY4SteIxvtU
lVkvtwMHwkxbpwrLWoLHRUI+ibmblRdWJjf+1R7Kw7auKbngZEY=
=EqDC
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
