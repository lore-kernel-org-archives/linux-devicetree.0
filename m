Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CD0C352BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:03:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3EAC20787
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SklB+Vqh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505473AbgDNUDT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 16:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2505426AbgDNUDP (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 16:03:15 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8ABC061A10;
        Tue, 14 Apr 2020 13:03:15 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id d17so9071095wrg.11;
        Tue, 14 Apr 2020 13:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WqVnj8IFqGFdEmOyYb2VJCmzmj0VgFnWDZJfvzhuPyg=;
        b=SklB+VqhZ46ohUYET8E6jXmY8wW6RRrTs4SCQyaBtpwKvr7z2GXmuBvLmCfm4MQPbS
         WSFZs1g/a6emv/+YA0Qib2Tn48Zus+tc7U23tUY7b6yhkr84CimIQ7POZDknh1Q7Dd3J
         +8JQd9RGtv5g/jrnbKEJUrMBwiBPU4nNOIpuhA5YjHfJRAw5cLQHicTLAO3h0g13dKXx
         owAX49kmERRtDkLaFYEHFraXX0TRNVVCUN6fbqmipxaZlXKmDyvSRK+bDscy/P137DhY
         cuQPJOZZm1APOlFfJqiFCEm7eZa8m2nsqABdt7fJdEJKjI09tgh8q74tFSIr/Ni6f0nG
         BYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WqVnj8IFqGFdEmOyYb2VJCmzmj0VgFnWDZJfvzhuPyg=;
        b=PoP71cwFRB37RBVdzy0wxxsOgkZvIdX4yN2zaeOvnw3VJci4cneyI4txFvyRx/Z4Le
         olK3FkScP3DtFf4soH7FcNh/MjdBZavzwj4FCo+rd5RTBmoOJtfIyoiU5QT64iOw4v1s
         2AxPXFnCMpMjpp1xL4cFTJ04mrIpECEQN3AHBj6Ej/nU1PY/cs6oM+fg5pCF8lBuVyOQ
         PxqK27eRwPGTI0u57Qtl37DJPTXZwQkpnMhuEDRc8zQeqSbWl3hJs1I6jlFGsiutROCj
         5s7qQhpiMbiWx9AisBUIntFxT9aqerNjZX5VQJMEgC3vVdU2+4DDumu2b5mGHKtweinD
         2iww==
X-Gm-Message-State: AGi0PubRrL1AUOeonKlsVUD4QBLn1GAz4DxBiE1o8Rsl4+hscM9kB9+4
        yD1AKAKgGsg/SBWkSrGpqag=
X-Google-Smtp-Source: APiQypKgPX3t+vOJEeyj4pvhZH15r6VnpobtlBCeEn6P8paVe6JSM3adiGxoEVtV/+jQrRn6tgcvxA==
X-Received: by 2002:adf:92c2:: with SMTP id 60mr21461043wrn.379.1586894594044;
        Tue, 14 Apr 2020 13:03:14 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id v10sm8236763wrq.45.2020.04.14.13.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:03:12 -0700 (PDT)
Date:   Tue, 14 Apr 2020 22:03:11 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 10/14] memory: tegra: Add EMC scaling sequence code
 for Tegra210
Message-ID: <20200414200311.GD15932@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-11-thierry.reding@gmail.com>
 <682c661d-ea3a-7b9a-42f0-d5473b969aa2@gmail.com>
 <20200414154526.GP3593749@ulmo>
 <e050baee-89cb-dba1-544e-77b1662ac6b7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Content-Disposition: inline
In-Reply-To: <e050baee-89cb-dba1-544e-77b1662ac6b7@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 07:27:43PM +0300, Dmitry Osipenko wrote:
> 14.04.2020 18:45, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> What about to try to replace this massive egyptian construction with a
> >> single "u32 val;" ?
> >=20
> > I actually tried that after condensing what this used to look like into
> > the above. The result was a huge failure because some of these temporary
> > values end up being reused, so I ended up writing bogus values into some
> > of these registers.
>=20
> It should be fine to keep those variables that are getting re-used. It
> looks like there are much more variables that are never re-used, and
> thus, they could be replaced.

Okay, I made another pass over it and it looks slightly better now. I've
kept a couple of the "option"-type variables that are constant but in my
opinion make the code more readable compared to hard-coding them. In the
cases where I kept them, I declared them constants, so the compiler will
hopefully be able to optimize the code and their purpose should also be
clearer.

Thierry

--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6WFv0ACgkQ3SOs138+
s6FzPBAAsxspbLBGVMeeFtVE44f5t8cfCBGGqafBdGqgKya9ZWRdsHhEsusz+GxT
aqf7mRltFdusi9G66Sc2gq/YgFkC4cZJ+jWXoaUf+GCh85/zUBobWJxuL3BAYLS+
+1nxcoPGekN+Vux0NpGT2o1TYOFY4tF8SN7MJjm6+6dStevEerMRopmrn6YdICng
YCbAoQhocSmmAgLOfXfwyXZqpShCrBBsW1hZnQLKZWwzCjHo20WuAqSWQtL/Izsr
4LSK1YZc8TRKZw7P4VBVirzAIibR8NemHTCfftksjcBbKGl/ya/c5s6c5xntKYoc
tszI33NOqlLXt3udgxcGtXUoGe9swC+oKcf5iCQIh72xazbJZrLkigvh3HzS+Ct4
nb9IaPrik+iWv8jupxpKdbCCD/IgxR8KDCnNcLnSIOacqTpxMIPWP7L266ifOHkc
2qmdvCD/n6I2CizHgINLaZzPcw99AdJ60lZQgelPtcMQ7gwefb8Zh4OhjuCTt4Os
rJqhMAJ3lfK8cdK8OrcjNgDPKi1+avp9Srm10dXpyats0MPJgpNO7g6v9wwMN3zN
cwDTJGCLezBG6oNwsxJLnCX1OflOZTa+STTOGvfndsWk7QJ5PmYXcBmY8grxSEiB
3zhbpRaOdVtut6WAGQ8c+tgx5UXGVtj2TwmPgtySlc1jdltV3Bg=
=ofH1
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--
