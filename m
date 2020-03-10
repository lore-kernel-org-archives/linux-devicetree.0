Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAC0C18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:12:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 922CA21D56
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:12:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8F2v/by"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgCJRMN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:12:13 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54921 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgCJRMN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 13:12:13 -0400
Received: by mail-wm1-f66.google.com with SMTP id n8so2280377wmc.4;
        Tue, 10 Mar 2020 10:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LKUhAxSDiXZz9k+Am7IwqG8TBjJAqywF+N6KA2tyh0c=;
        b=H8F2v/bybE9ZEaybwe80VCAqEnD7JxdIpHfUUvto4kZ+pYayYL8mOYC0Sb7rln/Cq7
         50foEmGx8WRQBv/l8IlQ/EqJe02QcwZrVFO4wLqDuRqWzAjr6+I31BqseijJr3XchS/S
         U9JerH/ADnnbW1T+oTFcmsWozjSitJF2rtTnLeCGb0/GlVcX8iggEQymVn39sZIZJtuT
         t2ZEcMwKxBD+Wz3FE1o8uxBIpImQOO2944Gy2NQAPSoqvFei30lpuvLKnm1jFCzTkFFZ
         3qQRc/v/2MNKPqmIJMFi/KZGPC8IU2Z1PkL1P9v6BH+UzHO9//5eeKX7x/vENl+Wx9Mp
         6Djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LKUhAxSDiXZz9k+Am7IwqG8TBjJAqywF+N6KA2tyh0c=;
        b=FZr5BZoEHFJLN7cWz9LxB3zmBnS8DLhl3I0yM7jsiBZiLOXtQNxwPvuXQqxz8qTQGD
         YPemVvQGrmGcI2EnUAKA8lvWiOud2XYA/HNPjBA8i7IWv7brNqYnaOsmUeBENu+zbVpX
         kKXwuXiIrCATSWhbcUdV/juU8T47m21hgaGjgpJEF4JQhWSzvBB26S09X2MU/vLCJtJO
         heGlYISX1MpiOuZz1aXRjAl62RohqlJAoqNB2U9M2Geu//RG0QKo4tGlq0yDF1fVfU6R
         cLZXzV6pQ3z0JroH0cEZ9TYWdWK0JpBMjt+/M+MqYzpZK52FAUQJ8jZvbgrdPABsJAAO
         JvQg==
X-Gm-Message-State: ANhLgQ2BZpZQdt4F2ykr53jpVWZc5OXZVUtSpacYoLt3H6YdZngMOEit
        ty70h+pf3FBvBKDr9hhKkfjIvccB
X-Google-Smtp-Source: ADFU+vsBEK9JNpFIt1tv8l5t900LrWPohb/2G7vL+e1mQNvDYuytSY9FTrnvi6owLE6AoGu4Ev2+Vg==
X-Received: by 2002:a1c:b4c1:: with SMTP id d184mr3121260wmf.160.1583860330609;
        Tue, 10 Mar 2020 10:12:10 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id g5sm213909wrr.57.2020.03.10.10.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 10:12:09 -0700 (PDT)
Date:   Tue, 10 Mar 2020 18:12:08 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/8] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
Message-ID: <20200310171208.GE3079591@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-5-thierry.reding@gmail.com>
 <67295862-0898-87d1-ddb2-660713501bca@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
Content-Disposition: inline
In-Reply-To: <67295862-0898-87d1-ddb2-660713501bca@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:35:01PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 18:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Joseph Lo <josephl@nvidia.com>
> >=20
> > Add the binding document for the external memory controller (EMC) which
> > communicates with external LPDDR4 devices. It includes the bindings of
> > the EMC node and a sub-node of EMC table which under the reserved memory
> > node. The EMC table contains the data of the rates that EMC supported.
> >=20
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v5:
> > - convert to dt-schema
>=20
> ...
>=20
> > +  memory-region:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle to a reserved memory region describing the table of EMC
> > +      frequencies trained by the firmware
>=20
> Shouldn't the table's format be documented?

I'm not sure that's needed here. A proprietary bootloader creates this
table and the kernel has a structure for it. Describing the exact layout
in the device tree binding seems a bit excessive.

Thierry

--KuLpqunXa7jZSBt+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nymgACgkQ3SOs138+
s6Fj5BAAmv+mvasJUdui0XMVUv4sBs9YLxhTG+7acJVbOtaCfrhyxXoIoI3Y+PpF
HwS5ueYZ/cl+OHk0zkXiUWx8bZ6lQzZHw10iSkdLFAZze2LZmms9vHbIMwYaF+g9
APNbwV+anz+If2OTSXP1AFYorlo9myooQy4hBHILwy8pXcMnJg7FYIZkYtq8L836
ffkocgrgeo4QfP1JKLXbyb3fsT5rwoxrKiaLNCxH/+vNOdxuMnstI9QhZxFNvNgu
DlFXjRfpnlK99G7wfbqEYn8aP0VQ2l/6UeFGG37PTCBZX6WWg9WpWrMqzacKJO6K
+Esu24qd266pgSu2Tw9iy09JYOVqWwlPWQg0O47IFs0fCq2nj+ldJ7eJJ6uTIIsu
b/OOK2wh5zJ/rYy+9mR+IsjNtsux2vXXElJrj4kMvcNFuC70VfAeihGIB5PtlFOP
diCYDy8BJKwH0mPRbf9cIu1N885HNAhDilEw3o9QvtuyYYSeO+A4i55kBA+yc3RZ
+2MRvFaI28cNU6FrXuHAvBxnfLaH6AKVgGd16mW+0A34xlKiLqlzwjc/2pub4Udn
1MDG5vnvAWIutHjR0KOraodPzntxR8y0HJmihMTY2iNA87OolC7UjoNxpJcc0p7T
znsyuk0wZUYktfTHaJz9rPpk+LYecFvNue0jKSzQbukSU4ah0vA=
=DG9g
-----END PGP SIGNATURE-----

--KuLpqunXa7jZSBt+--
