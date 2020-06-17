Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B508C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 14:17:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B6A9214DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 14:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHICmRim"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgFQORM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 10:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbgFQORM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 10:17:12 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 191C2C06174E;
        Wed, 17 Jun 2020 07:17:12 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id q11so2541594wrp.3;
        Wed, 17 Jun 2020 07:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xHucdp/h38zOZR0BfimAbq+vskBs7PZI63d+Fmy/6YA=;
        b=RHICmRimL1M9Gy9mlY5GomnND1WhLpd3lnoE0HJ6XX/Y1pb4nXhJ335aRW0grOSk9I
         OullYdV88XHFlusHsm9GS2yERzG/2AhGcdGpoc+zvOGD50pGpJee2N/TdJBxeld/yStO
         uHXuXyj0VKyfHroNif1gyomp4EJHucgaZx5T8Lu1pCY5AoJa6vklNd9Sp7q4KJsQ9Z2f
         aRmk1cA/v8zU+rl6LxVfT7o9A9d7ZHVtDTgy7OPUuQmE0Kf8NQ2WeMYadyoOX4EQfUWK
         WevM5K0h+8Dgm3ScPznjD5QBH2IlIrPpflbGSJjtQNGyz0ldnaMA/ZPbBDtC05PQLtqs
         bQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xHucdp/h38zOZR0BfimAbq+vskBs7PZI63d+Fmy/6YA=;
        b=W9L5PcfpjPNcg6bTGcbd7rOwGRafjsZ+Izanlq78lOoHodiMePIUORzPI0zOk10Ny7
         A0JDrOa+2onCQfBoeRJJwk2ApiWpmuH2gFOw7L2ON5KOty6Ry7Gm/9u5rHpt7fK6dR5M
         QReYAElBwPRqHrb04/pQuvnpPZB4U6KNaxPywsV3N5g5c94wJuLehRTGX3YcEenb6oLR
         k2YhhCa5MNVsh5YntwpG4G5+2LcOk9uZ2UoxVzSN4d5syMs/g2euV1n+EPUhQwbNyY64
         ftZzBAufv69UIOj/kNLpWOGGvxVfF2NtEb8ClNwIYKsxbAkdLOqyDq4/jEYQI6ikCG57
         Y4XQ==
X-Gm-Message-State: AOAM531mMN/1H0FzJrarNj3mdAky5LN6ZyrMRj8uYOYSeq61+Jjr/PyO
        QEwTC23mFD8vPaouO6tKEctzmxfF
X-Google-Smtp-Source: ABdhPJyQRxOpTD09q4mx6/zcF7p2kcdd04OU6TdLRfW0WNxKcyV1ida42vneC7oFYwWK+z+uJ8pfrw==
X-Received: by 2002:a5d:468d:: with SMTP id u13mr9357002wrq.73.1592403430829;
        Wed, 17 Jun 2020 07:17:10 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id h7sm582337wml.24.2020.06.17.07.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 07:17:07 -0700 (PDT)
Date:   Wed, 17 Jun 2020 16:17:06 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 25/38] dt-bindings: gpio: tegra: Convert to json-schema
Message-ID: <20200617141706.GC3536291@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-26-thierry.reding@gmail.com>
 <186ceadd-317c-a7b2-d4ab-32473f857545@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Content-Disposition: inline
In-Reply-To: <186ceadd-317c-a7b2-d4ab-32473f857545@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 07:24:16AM +0300, Dmitry Osipenko wrote:
> 12.06.2020 17:18, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +patternProperties:
> > +  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
> > +  "^gpios(-[a-zA-Z0-9-]+)?$":
> > +    type: object
> > +    required:
> > +      - gpio-hog
>=20
> There are two problems here:
>=20
> 1. This naming limitation didn't exist before this patch, so it's not a
> part of the conversion.
>=20
> 2. GPIO core uses the node's name for the hog's name. Hence by imposing
> the "gpios-" prefix, you're forcing all hogs to be named as gpios-xxx,
> which doesn't make much sense to me.
>=20
> Please explain the rationale of this change.

We could probably do without this if we didn't enforce additional or
unevaluated properties. Because if we don't match on a pattern here then
all of those GPIO hog nodes would show up as "extra" properties and they
are currently not allowed. If we do allow them, then we can drop this,
but we then have no way to fail validation for whatever else somebody
might want to put into these device tree nodes.

That said, I think additionalProperties can be a schema in itself, so
maybe there's a way to only allow additional properties if they are of
type object and have a gpio-hog property. I'll look into that.

Thierry

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7qJeIACgkQ3SOs138+
s6GJrA/+Izbidb/DwVp99EqfGaOmDTMzV5gJN0QHu61EurvpUzDSGK2xJWrojuvU
tnhkNPZjEzlDTqDvILh1NBBMikSdxo5PzK/7RRHaqZSsMM1txiQaOpTwZ77+NFS9
/xL6kyKeTeaSbX3dtKJf+oxkJBlqfZjYCQdjvI0Vtn7P44b8kNjl7Kcxu0y13gNq
Z5eSuy+SFBC35not1IwhZEpwHFALtRPKthc5m+VJwybvLUI7hr7KXU2XvZECW9f3
AcFE5mmO6tWxCaXaaovjTPzGj55hfSpHAa1IIUxPr255z+Jici80P/zJpqPxqmnj
gYxcouACMqABwjN90ZZymF5uOl3RtMMOK9HwjPPTsn+qE84C5ZLK7vx6+WaRL8v1
GresAhtOXlY+PQ9lAYGwpoWdpaehASh2jC7Thid1uVCCSp5nqoenhg6BoqbF1VLg
ze5A49NgAEX6XEsVixy0AvlqFxBatRK8XbGiOzMlQV3DESQM0OdKdjCYcG6LHcxg
e+ghWhjCwV7obcIi433OnY73aoPBvaJHdmWU9VEfWTbNVkwkh6PDcA78HkxBIZ7L
VE+YI548k9zPG3qwQZMWezL8wIpUzDEDd/hpazAzSoaofUtQQGZlmk0kZL+LSfFv
OvPEpI4LW65arvMkLW5np5qQaoDrsl+MQPOHOBeNDw5F/QxiXbo=
=X4Kg
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--
