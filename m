Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6D7C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 12:52:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 014AF2071E
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 12:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGjaS27V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729997AbgA0MwU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 07:52:20 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:39498 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729501AbgA0MwU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 07:52:20 -0500
Received: by mail-wr1-f41.google.com with SMTP id y11so11132915wrt.6;
        Mon, 27 Jan 2020 04:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gE5t1/vnlTHQ6N2H2BaBlhcPCilvP7pyb0dIUFQV9Fc=;
        b=aGjaS27VSnF8F8IQ49CEQiX8QYy++l02kxPcH6xUsV8RqAWDjrj4UU3bTRmPtQLYbH
         DobHQohZIEKEzomRaB4R82MVbrLtoF2FhzeabCOzP0ZcYGLQLIfRuDA5x53qLpoTdakh
         1W+A8o1jg2889jwCa4HWvtMJoX8r+hOwZvFpzwfnF1AlUSOkwypmIN+LiRRyBJ2xL6jJ
         J/bJr6s/XvcInq2ou6CPHF5uvk5Vci3PVDtJ2xwjDPobj2XGmNE1QRlKTEDzmObHJY0K
         9mmw7CjnMqarWYp2ZQg7NoxWO4XYoJp2jlgWfkBTuABd0bbRNTuNEpQBOdYEanabHhJI
         zrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gE5t1/vnlTHQ6N2H2BaBlhcPCilvP7pyb0dIUFQV9Fc=;
        b=sLatIvqESa7VVEr+q9FZeo8aLGuDI95Onc7kSfySuC7riaN6WKK3F5bzRFxecuR6Z2
         vz3+lMHdERbDPZnLTwnv6exObTnslqKgCwbGyM954Dv2dGsHOM5AZzgChQcv4DT56UaK
         t+GD7GX1FNF0IXi0tIxruMx67QHwcos4p+xs2Yhrdhq20JBEIPndjjcVv/eS+rHaZR8F
         hdHON0tBJsZkcJgMXPR0DHZCAwDW1DkbpJNWwHmAV2QBFJm4NcJmjAMOhe4sMzGaSBdv
         svsl1+cYU19HWTx98+uys9LZB5+dkDQPK+VQ498LLLCyOOVTtopMFbVGTESzKed2pnNt
         u9fw==
X-Gm-Message-State: APjAAAUn4nGnHrHekqyd8Xdw/wHyV0tgCpQs6o491sqOTcACUimcivrw
        ZfDj5pEDK5o1krBLIqHfdkw=
X-Google-Smtp-Source: APXvYqyGy8fWThkG+JLbgm1XQNvxZGemG3znV+0H0LxZa5OOViXoFr4VnlU4N/XLjS5s62PyAIa6LQ==
X-Received: by 2002:adf:a41c:: with SMTP id d28mr22772868wra.410.1580129538327;
        Mon, 27 Jan 2020 04:52:18 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id t5sm20268329wrr.35.2020.01.27.04.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 04:52:17 -0800 (PST)
Date:   Mon, 27 Jan 2020 13:52:16 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Message-ID: <20200127125216.GC2117209@ulmo>
References: <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
 <853bb7bd-8e04-38ac-d0d6-a958135a49be@gmail.com>
 <f915949a-b46e-26fe-f103-fbc8d1fa3bb1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline
In-Reply-To: <f915949a-b46e-26fe-f103-fbc8d1fa3bb1@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 01:03:57AM +0300, Dmitry Osipenko wrote:
> 27.01.2020 00:56, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> [snip]
> > Thinking a bit more about how to define the ICC, I'm now leaning to a
> > variant like this:
> >=20
> > interconnects =3D
> >     <&mc TEGRA186_MEMORY_CLIENT_BPMP &emc TEGRA_ICC_EMEM>,
>=20
> >     <&mc TEGRA186_MEMORY_CLIENT_BPMPR>,
> >     <&mc TEGRA186_MEMORY_CLIENT_BPMPW>,
> >     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
> >     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW>;
>=20
> I forgot that each ICC path should have SRC and DST, but you got the idea.
>=20
> This should be a more correct variant:
>=20
> 	<&mc TEGRA186_MEMORY_CLIENT_BPMPR &mc TEGRA_ICC_MC>,
> 	<&mc TEGRA186_MEMORY_CLIENT_BPMPW &mc TEGRA_ICC_MC>,
> 	<&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &mc TEGRA_ICC_MC>,
> 	<&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &mc TEGRA_ICC_MC>;

This seems wrong again, because now we need to make up this TEGRA_ICC_MC
ID that doesn't exist anywhere in the hardware. So we're no longer
providing a hardware description, but instead are building hints for a
use by a Linux-specific framework into the DT.

Thierry

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4u3QAACgkQ3SOs138+
s6Ey4A//Ravurx17XVBLLytw2Ez2J5uO0PFw2M1G3FfEIq0n1cT2oye0vO1RhI2a
tvtP+tKkicx9DDJVCDEni3cAl/uoyIHJNCA8jHj5yaXQVdZSxsGai1dsiWzRk0Ff
aI3lazLfkCVWlGpXvtZG9bf2GOvFS6Y1mOxs/5OMhewSFp/iWCR6y/2yOk9+bJo6
zpZ41SnOFgg/BaDrn1eAApNm5Y3dxXdJ1y5+iDs4ZgdXA/gGJ2WRAbse1PoglmTB
wdL6p4ieSXbAaHiB38rQP7Xs9Mv5gZoaw+p9HOAiP2fsvSAol5S2rMq+MJuj9Bbc
zoVRnmFYAYDwKLRfj8opRhHp0CLN1v7nQaYuqRJXfSIPsawm7kgzf9c++etQD4H9
9rpDnQceLrORDUQxZUc6pjMAAWsRsxJtT04C4bodtTeT7shUZk9rs1SA8R6YvFf9
Ubb/PEa6tv1RF08a6rfaloEybZw0cnwe52Q/5ye0T5VyN2F6gM+sr66EyxG2CNDD
l/mlVkTz8f9k+Vil0KoBjyUAOx2pY8w3pATiLUA6ST5NjkPa3YMZVhAKuQVFEM4S
tygXspNRL9ZvhfJZR2pRfyO+pKUsBtOeXNCGaEtfw7kKKhrvab4ZnghA9vjsWMSu
AzeYasSvKdSAqo9SUHdT8aIAhCBr3AjRNxEwO5hB8xjOejejeeU=
=fese
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
