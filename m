Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3DAC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 14:51:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE1BB208D5
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 14:51:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwDvYY/B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbgFPOvN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 10:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728250AbgFPOvM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 16 Jun 2020 10:51:12 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7508C061573;
        Tue, 16 Jun 2020 07:51:11 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r15so3386007wmh.5;
        Tue, 16 Jun 2020 07:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N5FrS7eLre6JCdPt9ClKcrCASb1Q1BMFMvVwKZtd/8M=;
        b=jwDvYY/B3Led6A87gAIUeWlgkvR9hXxs21zGYsxqLv/xYV2ikUfYrT7w+Fd+0dbKgQ
         uJxDRzefQnoSdtq16r+xnGwFk/WORMNK5RGDD2oe5JzfHA2xWHSgNZR2CFVkqVnasaMQ
         mcI0IIw2DH9dUMU6eq0AibXYDtXdwW+inT+OeIQF28UEhVsDh/vSy87K4uALgvtt+iak
         0CWveMjHq0+XpEDUmYB6KqA/p7ooFY5CGM2+q2gd33/z0lfuO9wGanvNuAbYmekorv7w
         2TOsF3cnmY8vCfQklcPVRQYGHhYRaQxwzKQxQ++Is1gAw8J1ulukkKepcsjT2K8/pdCG
         IkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N5FrS7eLre6JCdPt9ClKcrCASb1Q1BMFMvVwKZtd/8M=;
        b=gxE0zqb60AFSdwVRb/PPSuhtkt5f3LMv83amoZWhsgIatJfxQLElhIA+NxMDuMr8z/
         Ao9lXc/E6h81U6L2/Razie3X/HjEA15lKbOirCfHVVgaT9u91WYVlv85fYcoNRgslVp7
         Ya7+TO05V+cP21IzYwpo00Nw3ihzjXhi67auHl6T/MZnN1TgMCWREoO37uLwWLpfi+hV
         bkIh3VQja4nzDwC5SyWXeZlWXWUeISGCeX36DJjv1yTUTjJQjkPYfV+9vmbAgIljXfld
         bdejLCt5vsftk5bgLhVMZkYhMBXarHh7ZM7BmGw0HB6QJTxbfSsm7nH2dGmPOYT+AtqR
         1e9g==
X-Gm-Message-State: AOAM533rhxeBhUDJjUP2guyke//2czMOavQCAmtZz8x3MjStNjOSKghL
        JSfDux8MG3czFSbpylSHoko=
X-Google-Smtp-Source: ABdhPJxlfihhDdkqiAeVStkjK4MrFepxyKFZsU7N6657NRvw/Ds+0k46Kv4ICr24T8vtAxA74NYOuQ==
X-Received: by 2002:a1c:814c:: with SMTP id c73mr3561366wmd.140.1592319070473;
        Tue, 16 Jun 2020 07:51:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u12sm29609898wrq.90.2020.06.16.07.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 07:51:09 -0700 (PDT)
Date:   Tue, 16 Jun 2020 16:51:08 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 07/38] dt-bindings: display: tegra: Convert to json-schema
Message-ID: <20200616145108.GD3000485@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-8-thierry.reding@gmail.com>
 <b20cede8-a9ee-c70d-913d-d0a05d7826b0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Content-Disposition: inline
In-Reply-To: <b20cede8-a9ee-c70d-913d-d0a05d7826b0@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 06:54:45PM +0300, Dmitry Osipenko wrote:
> 12.06.2020 17:18, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert the Tegra host1x controller bindings from the free-form text
> > format to json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> ...
> > +  memory-controllers:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - interrupt-names
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - ranges
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
>=20
> This memory-controllers property didn't exist before the conversion. So
> this is not a pure conversion, which makes it a bit difficult to review
> the changes. Could you please factor out the addition of new properties
> into a separate patch?

The memory-controllers property was from an earlier draft of this series
and is no longer needed. I'll remove it.

In my opinion, these schema conversion patches are difficult to review
in general, especially the likes of this one for host1x because they are
fairly complex to begin with. All existing Tegra-based device trees do
pass validation (although there's a small patch needed to support the
unevaluatedProperties keyword that's new in json-schema draft-08), which
gives me some confidence that they are at least correct from a content
point of view.

Thierry

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7o3FsACgkQ3SOs138+
s6E+Fg/7B2Mg67amrSqKm2vNSvOzWyYs2Z/D6ReeV771HsvqioHA9WtYx/jGyuTd
SZkOLaMO2Rx7S+LbR/Vybq930SGzX4syeMvB9ZQvQPBLxiYeHsbuMRjAxIfoX9F3
fN5vD+0h0ateIPUPB7KnoBxZOkPLoaILXAd5TG9dRRjoyq3hoQonprlF5NbcSP6Z
HkP5qo+4ImX7cCknNpAiIkYtIlbECmK2R8z0euX9p8qbIYJ3WmlNQZnB8csHdSLI
PDKSICspFkZUuzS1bL2Q7W8qtXOGa+goFa5In8ncI1JONL8U/mAgSmdRTe5JWaN4
xMFs2Yy1lJVcAbcMzH25hzaFulm1/s55JMDeIthE+/ucB5YrSDTUUfTPkknJT9oG
RKz+HyKHnel8o6kPupt/B5sVCrVdUMyGxZUUv0gjZdq2VfqAjIUtjre2G4kV45jN
HWzH51XPVefxocdcBUjp8xlHC9HSYr8CcGZAhd/kdTC6zgsEUBWYe+HS98vsjqf0
gkdwVDe3dPkydvCM16cY5ZHYf0em7nR02vb4kVA4F5JHg2pctiMxxXvM6MgJU3Ae
RnSYXLjmZtU00qOWP+GwF3Na+1N/6DN44c/uZk9As9sen+ipNeFmmmNQwjsiSi+m
mmEATY3V1PXPCN5aYqOyhdgct0rXa3d3iGlYE9gDgcLJljJ+Ci8=
=BqQz
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--
