Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A97DC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 14:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDE332098B
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 14:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuFAzfU5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgFPOr6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 10:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbgFPOr6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 16 Jun 2020 10:47:58 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94680C061573;
        Tue, 16 Jun 2020 07:47:56 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id b82so3158178wmb.1;
        Tue, 16 Jun 2020 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Lyw9ZzqOPjJY4HAOxqRLcYECnvae7XM/53xcqed98xs=;
        b=AuFAzfU5U8yvoARHFE9BByJNPbj7Egv6NjctAXu6EaC74eDqwkYcOJiniQFqET5XqS
         YyxwyVgwvqSwCAt7D6pt+aoSM7eZMeHiYaUA6blDysms00QTeyeTYHu5DRiAbKDGU8Zv
         3qWjp65Sr3oRPbowYhJXFqvW23I+FjvXWr6a1pGIqaGMr64h2EXMFTUK+Z/Gqy2k74/4
         +xjwMtlGu0M/LffiPn6Qaa1N5oyclY++/Scn+xXe1XQRjNpzujva+ktL7DULIIa2fvan
         c4q8THUBI0VMCA4hUg2vO2qMS5iFD75SkksnbHBdcnYWnwEUpPdLNDn/0HorhTty/UE8
         BR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Lyw9ZzqOPjJY4HAOxqRLcYECnvae7XM/53xcqed98xs=;
        b=AaosfnbDhJmwV5kWFjDdgtU8TRN5dzAwJPtQwJbpKIqgNKOZ1SQBC5N1saqbzVPkFg
         al8/ovWRks66klByxDCJPlpFLvIPThfjQPwRgWQ68piAbmR4JjT4tX5LqfEFXRSurkXq
         Y2RBjn6+EBQeqmV33ScdUFKVWwURVoBNkwzg433sz8UchtFYB1lbD9NHjZGa95O1qe/D
         k5c+iehuFl8TwF2oJqZ8YvBw4yR7lj1DlShMHqkdAH1YmtptpOkEB7KJ5h2Ge8tRC+km
         Vtrn8qNXTERBeCiUce8QtNFXNzeQ+DXYadk6v6yoJXYQsSYezi2/4eFw3q+bETpmLBkw
         JYgw==
X-Gm-Message-State: AOAM531yzDJprrndEvJubNvbYD0rtjiIHS7I9tEdKBB7JgXKv0wrkyZc
        12mhLSBks8zy2bW4LbBIxeE=
X-Google-Smtp-Source: ABdhPJyogHWFGVJS6VX4pvJHrdwtzHqzSkjhhPLl1NT8ItCN/D1Fj9e1QcSlMWO59+WLolTXUrDCPg==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr3457655wmc.1.1592318875308;
        Tue, 16 Jun 2020 07:47:55 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d24sm4201054wmb.45.2020.06.16.07.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 07:47:54 -0700 (PDT)
Date:   Tue, 16 Jun 2020 16:47:53 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 08/38] dt-bindings: display: tegra: Document interconnect
 paths
Message-ID: <20200616144753.GC3000485@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-9-thierry.reding@gmail.com>
 <82888e53-c539-7d61-666d-bd6dbc494bfe@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline
In-Reply-To: <82888e53-c539-7d61-666d-bd6dbc494bfe@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 06:52:44PM +0300, Dmitry Osipenko wrote:
> Hello Thierry,
>=20
> 12.06.2020 17:18, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> Commit description is missing, checkpatch should warn about it.
>=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../display/tegra/nvidia,tegra20-host1x.yaml  | 52 ++++++++++++++++---
> >  1 file changed, 46 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-host1x.yaml
> > index 3347e1b3c8f0..684fe25641f1 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-ho=
st1x.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-ho=
st1x.yaml
> > @@ -97,8 +97,17 @@ properties:
> >    iommus:
> >      $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
> > =20
> > -  memory-controllers:
> > -    $ref: /schemas/types.yaml#/definitions/phandle-array
>=20
> Why memory-controllers property is removed?

Because it was accidentally added in patch 7. This is leftover from an
earlier set of patches.

> > +  interconnects:
> > +    description: Description of the interconnect paths for the host1x
> > +      controller; see ../interconnect/interconnect.txt for details.
> > +    items:
> > +      - description: memory read client for host1x
> > +
> > +  interconnect-names:
> > +    description: A list of names identifying each entry listed in the
> > +      "interconnects" property.
> > +    items:
> > +      - const: dma-mem # read
>=20
> Please notice that Host1x has two memory clients: one for DMA engine and
> second I don't know what's for, maybe for indirect memory accesses. Why
> you skipped the second path?

I'm primarily targetting Tegra186 and Tegra194 with these patches
because we need the interconnects properties on those platforms in order
to correctly set the DMA masks at a global scope. For Tegra186 and
Tegra194 I can only see a single memory client for host1x.

Looking at the register documentation, the host1xw and host1xr clients
do exist on Tegra210 and earlier and they are used for indirect writes
and reads, respectively.

I don't think we use indirect reads/writes, so we can probably do
without the corresponding memory clients. Alternatively we could
conditionally add them on Tegra210 and earlier.

Thierry

> >  required:
> >    - compatible
> > @@ -489,6 +498,26 @@ allOf:
> >              iommus:
> >                $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > =20
> > +            #interconnects:
> > +            #  items:
> > +            #    - description: memory read client for window A
> > +            #    - description: memory read client for window B
> > +            #    - description: memory read client for window C
> > +            #    - description: memory read client for cursor
> > +            #    # disp only
> > +            #    - description: memory read client for window T
> > +            #    - description: memory read client for window D
> > +
> > +            #interconnect-names:
> > +            #  items:
> > +            #    - const: wina
> > +            #    - const: winb
> > +            #    - const: winc
> > +            #    - const: cursor
> > +            #    # disp only
> > +            #    - const: wint
> > +            #    - const: wind
>=20
> Is this really intended to be commented out? Looks like this is an
> unfinished patch.

I started adding this after finishing Tegra186 and Tegra194, but then I
ran into various other issues and wanted to do this step by step, so I
plan to go back to Tegra210 and earlier later on and stub them out.

However, since I had already done the research I wanted to leave these
in here for later reference, so I didn't have to go back and look this
up again.

> In the patch [1] I used memory client names for the interconnect paths.
> I like yours variant of the naming, it is more intuitive.

I only noticed after posting this series that you had sent out the
series for interconnects and that it conflicted in the bindings.

But yeah, I do also like the contextual names better because they are
more intuitive.

> [1]
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20200609131404.175=
23-23-digetx@gmail.com/
>=20
> I'll rebase my series on top of yours patches once you'll get them into
> linux-next. Looking forward to v2!

There's quite a bit to review here, but I also have a couple of patches
that depend on these, so yeah, it'd be great if this could go in sooner
rather than later.

Thierry

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7o25YACgkQ3SOs138+
s6Eo/hAAwozV0hE0VB+QuRcHIfq8OEujXsQXxA+kDVCgbCwCF+2ymfSu4uzUhWnD
73/a1MoHrnmEIHDsrTO9jSHlqVYWrD6GOK+ITW14Eckj3Z/T+rJWdflwrqMko9Z9
gkaBmZ88cGIYQJiHalVXHIEAvAoNS7V8E4c27CQbjTq9QTdGaeMRAYDrWWLzd23P
q3ibmsJZ2bhAzPXo9XSe8hmoNVhbmZI0q3+7y7e28q9UmimhyF48nY/rT4XTg4aY
5N++oqAnDgWAV1NIXEdbS+KpFlzOxAN9oL6LAUILO0u9ANW8dDwq/Deb5N4HMmeg
YPo/H0GcRnqESIkfOPJEX9DxPjpUElXhZTNzPAbiawvNFuy2gqrWw4mGrtwRTQDw
mtvUvfXSo3sn3M99veGm/7Tl/L09mYJOzUl76+SmzVZDVoAaZaPRFm6ZJ+mmrrtW
XuKzRyCz6Go2a9Of1uH98VDm+nm/38nFwlAeRvBnBaLEpP+Udt0Dkmmpx0gHZxbO
x5OF2/v7UJ2yCw9av0q1sA5HTKVsOer31yDieCM9UlbrpavGWWbAP701zeuXHqbM
w6/ZSMddU6hoPHWQWMwD5pCL+g9JkItudDir3cAVaRtYAGaPAFdduyZq0CQNrWXP
OS2lKiOH2Imx0YaeCtQ0wunpnxPtimTtrjNnikQqlgHpmWyaECg=
=bQCD
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
