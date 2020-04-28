Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF60C83000
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 12:16:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA0A7206F0
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 12:16:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjR9IzQ8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgD1MQe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 08:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726361AbgD1MQc (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 08:16:32 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A793C03C1A9;
        Tue, 28 Apr 2020 05:16:32 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k13so24408923wrw.7;
        Tue, 28 Apr 2020 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KJcceZKHt8YY/nAlytIbRqg+XVhvkXqTJQkvmynr/Jo=;
        b=PjR9IzQ8VD3sksu/DJg+ZCI27xjQM2hp3LDGLLrBEn6lwZoi0hx0FbNn34GGPXBU0g
         4Pyqp/f/L4WeeqIp40aL724tWTQGScWi8CBHzbhDCa6DXk9WPMrG89YTkEe2hM2eRpXX
         XYQPpDzxx6W2PQ8VlJbvMlL499j+fGlTO9BjitN8n/U4zyLsmf2xwczWdpmdaRgmDVVB
         DALWUIskfHDPpTFWeGfrQvjp3y9Br9LsaksIico9cRhGq3JgwHmU+UPM+7zEBYOSYH5P
         tbmeKkMJZC/w+gw8S0W7mw4EQa1I4aUe6ln2WUkDQHsNzyfXSx2qKvpVrm9r3SsvcYvY
         GwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KJcceZKHt8YY/nAlytIbRqg+XVhvkXqTJQkvmynr/Jo=;
        b=WJSzPyA6963HzxAR5jVQyknqMG1cG6TctzoOu4XWm4lth2/eTn6KqPnuV/9QQbRLIJ
         QnMFcQMevyaSTO3PlKn9It5ULukrMCt9v90fjFlHnCY+JbaCgiu/0TzhCoyx3LUjvrnS
         fAdUImpmKwd8bHs3UeTdE/9c3ebHEFB2xMv9BSXbLdDo9LHjBZ6e7lSWJG7pCfSZbPuB
         e1jU/2uYFGrJr2E+zf1RtYlr1WclJtAO2XFtiG1OkGVKy/XhXke7XH9ZI9hHQHCmwAEc
         XmiY1bTYW/hGTo3NDCi70W30QADQFJeGAC58iaI6iqpBs9KbMuBW9yhvFZy1FeynJlLp
         KVIA==
X-Gm-Message-State: AGi0PubD6celFiJxp4xp/ecPpK0uZ6TNYlhp039i/zEsu6Mt511Sm12/
        qpRRHztd78Cg+bbIY517OtY=
X-Google-Smtp-Source: APiQypInzRT5VmQThYG3hxKLRxdUsWIeHCEjdaSPbMEX3fOsSnTEiOElIJit9A8BQBrWmmHk6GooDQ==
X-Received: by 2002:adf:e9cb:: with SMTP id l11mr32334378wrn.24.1588076191212;
        Tue, 28 Apr 2020 05:16:31 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id s30sm25530090wrb.67.2020.04.28.05.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 05:16:27 -0700 (PDT)
Date:   Tue, 28 Apr 2020 14:16:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH V1 2/4] arm64: tegra: Add xudc node for Tegra194
Message-ID: <20200428121626.GL3592148@ulmo>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
 <1587022460-31988-3-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m+jEI8cDoTn6Mu9E"
Content-Disposition: inline
In-Reply-To: <1587022460-31988-3-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--m+jEI8cDoTn6Mu9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 01:04:18PM +0530, Nagarjuna Kristam wrote:
> Tegra194 has one XUSB device mode controller, which can be operated
> HS and SS modes. Add DT entry for XUSB device mode controller
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Looks good to me, I'll pick this up into the Tegra tree.

Thierry

--m+jEI8cDoTn6Mu9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oHpcACgkQ3SOs138+
s6F38w/8DcNjQD7ygu05FLIvH5mMzvp/ZOq1zIJxBqJ39kNj1aGgyT1wlnw0d6o7
MfdVgIC2Z4rRXaGjGkD1UAvatjkgOUhdONYBJVM7FvoGmv/+1KRSR03ibr+EZtvy
WfCxoj11GHauJlzuYulg+6fpnCxzhXn4RSBDSm1/12Vp3BbQvjOcdidEHCQYbDHy
mV8ylgoNrJ/DW56wsWlMYsdoTWBuSh6S3NsC1rEzKVs31+qcp1qIhVTJegdS4KZF
hr6QasS7SQy2z1VRkFqh+D4fRUErOWHiheJ0EPO/UQpQTnQQW3hO9IHEV3r1N3BQ
SJV6/4pDaJuKJE1qXfu5QfqYuoD5ZR2ViWE3cEc6VNxGoRu1uGTfs+/fDi0Bz6oR
INDmJuNXyB+KtrWWooSQMOZ5naawEDRHojCvDJUA+l/474MI6v/RxLCoj9QD9ECx
AvbALWhpwSzUJWszB4cMBdMuDmKE23V85gDU4Md7VcwqOSelUnoauVeVNmlKwAt7
Y4FmRC5pL7CZCnP0jHGAEexEnxQaCbMdXe3TN9eRt5RVqj0ks3MkWyJ7PIu63Bu1
o4yZma2mkq7skiM2e9Ari8JgMBQ+EjBHtpG4kshmkJJpzbrDHH79f3w9hTw49q25
MCSr+mpc2gnWKx1BPBJHlGSKVVHXyWNEWWFdbI4eK8dmnsVnm0s=
=2SXp
-----END PGP SIGNATURE-----

--m+jEI8cDoTn6Mu9E--
