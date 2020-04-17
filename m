Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4E9C2BB85
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 07:08:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C10922201
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 07:08:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXBJLJH4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728689AbgDQHIA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 03:08:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728105AbgDQHH7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Apr 2020 03:07:59 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A00C061A0C;
        Fri, 17 Apr 2020 00:07:59 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k13so562971wrw.7;
        Fri, 17 Apr 2020 00:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R6f7+5GvUI8/osvhifRKheRB5YMwbn4gSSK11WxjPyY=;
        b=oXBJLJH4PLH3RK1yBkxfgzRuw6DjqbfhrWdBWb+E/LvH+qG159gfIb+Is374+RVUfA
         Cs71LkEMWR9ELAQ9gjPk1YxP3WfWBMKv8a21B8KL3aCjtFCygi6wZSk5GJQh0xji3is4
         IrVkuiXxsbmdVxxxdrm0x0/Od0Br1BgOjDttlU3lY64TcZULAN97ugMUuwJKQTCu4dN7
         J6Cfe4EnfY5JpPnkMa4SLPI9cA2bIeLlnf5AAqioHSZavu96FJW+LQG0MOlIcI3AbjM+
         JN1pVkfXZH0/eoMoN6ERJWMApP2KOCE4gudwHBIK8ht17PWv+Aiaq871X3Gi2FGK1h6N
         TKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R6f7+5GvUI8/osvhifRKheRB5YMwbn4gSSK11WxjPyY=;
        b=nQe84mQ7sXZ3/qD72XKPH//I41mFU2fMb1su9xxX+VA9inrLKJsX1Imnbzu33Jf/OY
         HbPZ7VpTYJbHAkKUqmpVby/Imqti9pvqXZIvvO/ylB5aiHPAtXyNrVjNqw2Nc7DRu8Ze
         bpuby/+e5ddJaxv9nCgPWdLXMt6hJJ06yEbUlXQj78mlq/oPQxQT3f0VgZQ+gsPTzAnI
         0SnVw41Y8pndOlITnqdTZ9hDvxqc3QCO1O49hvVUad44pxKrSA2ZJZnBFaPTRWIBPtOb
         wQVFJd+P6p5hI7AtqSoPZAWAsQ4reALwZKlb3ImClHsaCkmfcuit6FFswg9kv6fxCAis
         2jFw==
X-Gm-Message-State: AGi0PuZb5gmdtU6dOVgdz3VeNmGrLZqONqBx1dG+ii/gTdhj/cfail1S
        w4gqjVhEwRxIVNy+8nU5VAk=
X-Google-Smtp-Source: APiQypJJtr+UZ6RDe7C4PsLdNv1nMBygM5ArD9/3+LuVDtv01cumvUwtJ7R+nXfuJFTLFostTvHrug==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr2250620wrj.165.1587107278003;
        Fri, 17 Apr 2020 00:07:58 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id u7sm7044306wmg.41.2020.04.17.00.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 00:07:56 -0700 (PDT)
Date:   Fri, 17 Apr 2020 09:07:55 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm: tegra: dts: Kill off "simple-panel" compatibles
Message-ID: <20200417070755.GA1573554@ulmo>
References: <20200117230855.25567-1-robh@kernel.org>
 <CAL_JsqLDsoJteGC6BRMFvPZ0pekOU71eUNQUqh74we_BB7RZ_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLDsoJteGC6BRMFvPZ0pekOU71eUNQUqh74we_BB7RZ_g@mail.gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 04:02:58PM -0500, Rob Herring wrote:
> On Fri, Jan 17, 2020 at 5:08 PM Rob Herring <robh@kernel.org> wrote:
> >
> > "simple-panel" is a Linux driver and has never been an accepted upstream
> > compatible string, so remove it.
> >
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: linux-tegra@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
>=20
> Ping. This never got picked up.

Indeed, I somehow missed this. Applied now, thanks.

I did take the liberty of splitting up the patch for 32-bit ARM and
64-bit ARM but reused the same commit message and authorship, so I hope
you don't mind.

Thierry

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6ZVckACgkQ3SOs138+
s6G7ig//Sa5UUxsU1rQzbWSzOABzwUMTFWwoEOr17cFjrHwxV06b/jUYICr3yKDn
Qdyr4e4PNRYiDZUWwM5FpY6/Xa0tmqKY+zCv8/Q0KE2RhB1lZFFTkjLSiZ4Eg25A
ge8urVNALc4Z8pCJElYGFL7LCcDPEXcOsNFjCjrUaie4Jivd62A0rQsjb1Ib7VSf
QF/156ZMz67iURk7ssKHy0jOdoimXX7e9se96TghvL9CH10RBcJehU/lWnls3S0X
HhcEt/scIk9CYePhxb+XxdJgy79PJoCImqf17tmsRWq00405BA9PL/lbqmLYlJha
7A9wXu1pHcU8W5SPNtefWCTT0QBTbE8vx4mqa51pnjDvKzntz7WTaiQsMot1SoKO
g4WP4QFLqLRK4dEA4nZU9Yer+jnubOYy9LEV+R8Xtcp4gX5YEEBHd1ZZpSxBPTX3
lZtaaIsNCCwMYfwCaWK/MA13sJPBK8aIga3EE4Nc+QYuWig0vdrfyEcg0kAxPpeL
1MG+oYdU5COwgxxeGVv+LbTLWGMJ8KQR7jBuYGviaxPEd5trk6KolT4bK3ALIRsY
LD1AZB6GdWEjEXc109WmB8yu8av3IpKl879JDl3rK0SuuyvKHOlAr20yuoS1GPdG
qkO7AUVbe4YbXsrTsH2hVyYjPIF6VK694bc6NvJlQIimqxtkqT4=
=pkFW
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
