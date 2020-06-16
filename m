Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A37C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 14:34:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67FB9208B8
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 14:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+M1vdMd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgFPOeF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 10:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgFPOeE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 16 Jun 2020 10:34:04 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8348AC061573;
        Tue, 16 Jun 2020 07:34:03 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id r15so3319941wmh.5;
        Tue, 16 Jun 2020 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1RXOsD4er6euNm4Y3pGIbFv5vsP1r8Shs/hjtRp0DZQ=;
        b=r+M1vdMdp9zM/ddhm+2pI+amzmINTNFTgT0N5hsITl+b18n/XtBYnUPaCRZZBr2Izb
         FPZwvyN+AnEafRpQW474cJoGmCTU5A2awd9vmT1csf57nZsNIIx4KnbnrwerRAxJOiz3
         rPc17MDwsGSAf4jAToy0fk+jsloi6vAMhYt9oLz9P1jynwIxC10k25/20W9vYuM2P5QX
         0+KSv06pPhJUzytEsf5r0lHjr3mKNsMZw88dX+HWYNyKM6boyvYL0Cdgmaz5T+Jv/M2J
         uJGUuL7E8ieBAtyXmauntl7Tft4SDarx6VU1FOxZCm9OTJOSi2AgP8YRPcorpg/CIAB2
         86Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1RXOsD4er6euNm4Y3pGIbFv5vsP1r8Shs/hjtRp0DZQ=;
        b=XcthODQTxrEaxmPs2CnPBPVq31Dgx27cmMI653dbC0oZpFXc0Wh5bLNrLKRwwnp8S0
         ZBmx1W4IAjNbU7JiiamiRu8CPZr/hUSP0+MZAoUsXgZfUUovnQTvcK+6PYQ5Ba01Jkj8
         gUDhqsQ+aIC61GhF9DQD8I4HG3t405+DgX5j7vgIUch2Ug1Ydo6ScZZI04ShJUEcG3RA
         j6r6CDJqbu6D4D7dcVjN7lv0Xhff+b2VtSU+a7XuOBOogh9M201Fkc0Jo9PDdfiYIAVf
         EaYUxiuLR62KmFjWlXO2ii9tUxtDn9GwQ5xqGK37L0b8XjWAsa4hRMjEgHubRsK2jDIU
         P9PQ==
X-Gm-Message-State: AOAM533UIOWllW9qwcotjYU/lVDQo3ZymQs+tLfX26H0ubZf5jCuhEmH
        rS7tkJXer6GjCvla5scHBU0=
X-Google-Smtp-Source: ABdhPJyODwUr1UHdlJXlA27bJIg01l+fvkx6DQue3MN0m7C/40JhUAPnwR9jcOHemEuXExgWKYKHwg==
X-Received: by 2002:a1c:c908:: with SMTP id f8mr3580666wmb.150.1592318042168;
        Tue, 16 Jun 2020 07:34:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y14sm4044126wma.25.2020.06.16.07.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 07:34:00 -0700 (PDT)
Date:   Tue, 16 Jun 2020 16:33:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 31/38] dt-bindings: panel: simple: Use
 unevaluatedProperties
Message-ID: <20200616143359.GA3000485@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-32-thierry.reding@gmail.com>
 <CAL_JsqKHkW8Q-prwEP_tkyWHUU5YuQHOipzjZ9MWa9M+uMoCkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKHkW8Q-prwEP_tkyWHUU5YuQHOipzjZ9MWa9M+uMoCkg@mail.gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 08:28:13AM -0600, Rob Herring wrote:
> On Fri, Jun 12, 2020 at 8:20 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Using "additionalProperties: false" results in rejecting any of the
> > properties defined in panel-common.yaml, whereas the intent is to
> > inherit the common properties defined in that file.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simp=
le.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index 34fe3d42b829..c58bc90ffd43 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > @@ -275,7 +275,7 @@ properties:
> >    port: true
> >    power-supply: true
> >
> > -additionalProperties: false
> > +unevaluatedProperties: false
>=20
> But we've listed the properties we use here. Some of the common ones
> may not be applicable. Maybe they are and if so, then you should drop
> all the ones listed with 'true' with this change.

Looks like the only one I need this for is ddc-i2c-bus, which is already
contained in panel-common.yaml. unevaluatedProperties: false is able to
look into that and hence doesn't flag this as extra.

However, I can also work around that by adding a "ddc-i2c-bus: true" to
panel-simple.yaml, which seems like it's the currently preferred way to
do this. Is it expected that once jsonschema/dt-schema support the
unevaluatedProperties keyword that we'd move towards using that instead?

Thierry

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7o2FQACgkQ3SOs138+
s6ExBw/9EB6cRu6J3S8O3Qku+EHrCFgikSr6SIclBZ6Rh/OQBVAWBUenyvEtBKRX
R9wCmfiqtZZ07Zkjt5vrchKnnmkwKHnRb61Kf3STUxOKi4v7AwgUCu6KA/nUze0+
pF5VpZU0EbsYHPdUn2Ho0YNXo6J6CnE7aCUerstpAnHaCbAFquGgVzQW4irPFYP6
GYGf23qpN8JvCKokLC/Va+7vOw+ajh8Be6N8QG/V9nS+AJa+IcLcNvJUo9ZuU65q
w4+4foKq2bJVe175RLAvWM8Nmu0Djdq6R/FUQAQSg6hXUCcxMLPmve6dUd5+B1i5
Mo5PvG3hAr/pDZdgrlDmMG7pqOoJBxmOnFmp65GAIt8chH9/tHqp6QcajPMQdvl4
VVrNiAeZ8Swm9momu+w0O1Fx9IsOCUCCU1pE1RjX3Swgm3BD2S9TI182bUFetC+N
R0mJ/U9kkWV9cu/KbKrUBPxdcglGliXIhVgb7MUA3BMzY1/+jOUT89XjBlXeazGc
WwtfG8Yb4LwgbpdXLNvJA4XOuT/F6DGGRbbncEAuBUpHxxjcVxjMegjB/p1xm7zC
eCDSqVXewA8Gz9PP2XLi+Hp020w+seHaLYeC44P4wX1Bho5v38KOTL0hNcrFfwdu
l85dl+MXcfhOK4NEd6jOg3JWDMdyIjhl52H/j0m7K1yH7bPV2AU=
=hcVb
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
