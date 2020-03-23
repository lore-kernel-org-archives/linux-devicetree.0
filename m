Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B40C54FCE
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 10:35:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2DCB62077D
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 10:35:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BD8PkINo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgCWKfG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 06:35:06 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42227 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727810AbgCWKfG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 06:35:06 -0400
Received: by mail-wr1-f67.google.com with SMTP id h15so4116034wrx.9;
        Mon, 23 Mar 2020 03:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kb4Lv5bsGKOyoT35RNZwsybhTbpTu7j4N2rAcNXDNjg=;
        b=BD8PkINofqM+2m3ljrhp7yyLB4gF36LGhIrA52TPmuqRz0G59NwZy12isw2AmuAkgT
         v1uLLWoZSRvMasjsy8uKNF1Hu/kk5qGBU3q2CGhw4seK3Knar8a5iQnTX7yNci8hfppf
         WI+Un9B884eetXV5FLPsRWuumF76GmRa9te6j1Sfp1f1mdRHiSD+C0YCKGZKZDb1Itst
         kn47xmcDWasykdGVnEgTFj7Of6f5w8fnqGS6xEs4ux3XtSEShuObXS1CHOHuifSmjejf
         TtkZCmyyTyP4E1irDmE+RQM3LHjE/isJjmvWa49a4Ajlp/BboCr/UTRWXcSVoiIB1JB5
         lclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kb4Lv5bsGKOyoT35RNZwsybhTbpTu7j4N2rAcNXDNjg=;
        b=Bs6K3hpPZ0R7i0ZqTyJ0RTRUuQl2Nr/amj6b0jlzB+h+1BoFZ1YDP8F+apxIW/Ug9R
         Nw7Uv8eSP8w4J9p7kPuzD6TRIGByw0TOi/UEpuksmn9eWpbFr1+Mo4KHuP6nJn5qYrRK
         YbO0BQ+XkVXvdbcxDczRyPi2JIrA46yadTCxJDmd5wYjutILmQlG3ta88ceS1aFYpXFE
         i57wpgKIr++Ob2dnGIaIzF7QbWfW4/kDqbC3ukBAUI4NJAKaF0JMt7M3/vGy8KIybs3C
         6vqp8QYVBdtZUAnTHglvaBtp496s4yo0/1J3YFbhCHg9RU/9DgzxnAIzFDxl57VMo3Au
         t06w==
X-Gm-Message-State: ANhLgQ18OPuwvSYdKPcggmJfgi6H1nTndZYwDk43GK1iBVoL41lO6XzA
        slj1+dkO6HjDXhYErh94lPY=
X-Google-Smtp-Source: ADFU+vu/O7sXCEcT5dR6Bauzu227GwJoOsPijCPDK2NrevZ8tRNghbiM0ipWULUPYcDi3HppdykmAQ==
X-Received: by 2002:a5d:6289:: with SMTP id k9mr28615174wru.36.1584959702716;
        Mon, 23 Mar 2020 03:35:02 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id w67sm20085951wmb.41.2020.03.23.03.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 03:35:01 -0700 (PDT)
Date:   Mon, 23 Mar 2020 11:35:00 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/8] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
Message-ID: <20200323103500.GA3883508@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <20200310152003.2945170-5-thierry.reding@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 04:19:59PM +0100, Thierry Reding wrote:
> From: Joseph Lo <josephl@nvidia.com>
>=20
> Add the binding document for the external memory controller (EMC) which
> communicates with external LPDDR4 devices. It includes the bindings of
> the EMC node and a sub-node of EMC table which under the reserved memory
> node. The EMC table contains the data of the rates that EMC supported.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - convert to dt-schema
>=20
>  .../nvidia,tegra210-emc.yaml                  | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/=
nvidia,tegra210-emc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,=
tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nv=
idia,tegra210-emc.yaml
> new file mode 100644
> index 000000000000..caf21c08f9cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra21=
0-emc.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-em=
c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra210 SoC External Memory Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: |
> +  The EMC interfaces with the off-chip SDRAM to service the request stre=
am
> +  sent from the memory controller.
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra210-emc
> +
> +  reg:
> +    maxItems: 3
> +
> +  clocks:
> +    items:
> +      - description: external memory clock
> +
> +  clock-names:
> +    items:
> +      - const: emc
> +
> +  interrupts:
> +    items:
> +      - description: EMC general interrupt
> +
> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to a reserved memory region describing the table of EMC
> +      frequencies trained by the firmware

Hi Rob,

the dt_binding_check error aside, do you have any feedback on this
particular property? This is a replacement for what we used to do on
earlier chips where each frequency had its own device tree node, and
each such node had a bunch of properties, which made it not very
readable and cumbersome to parse.

The reason I ask about this specifically is because there are two
levels of bootloaders involved here to pass the information to the
kernel and I'd like to get those patches merged into the bootloaders
while I'm finishing up the Linux kernel support.

Dmitry asked whether the format of this table would need to be
documented in the bindings. I'm on the fence about this. On one hand
we don't have this documented anywhere, but on the other hand, the table
has things like revision fields and so on, so it could technically
change, even though it's very unlikely that it will.

If you do want it formatted, do you have any suggestions on what that
should look like? Should I simply dump the C struct definition into the
bindings document?

Thierry

> +
> +  nvidia,memory-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle of the memory controller node
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - nvidia,memory-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra210-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #
> +    reserved-memory {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +        ranges;
> +
> +        emc_table: emc-table@83400000 {
> +            compatible =3D "nvidia,tegra210-emc-table";
> +            reg =3D <0x0 0x83400000 0x0 0x10000>;
> +            status =3D "okay";
> +        };
> +    };
> +
> +    external-memory-controller@7001b000 {
> +        compatible =3D "nvidia,tegra210-emc";
> +        reg =3D <0x0 0x7001b000 0x0 0x1000>,
> +              <0x0 0x7001e000 0x0 0x1000>,
> +              <0x0 0x7001f000 0x0 0x1000>;
> +        clocks =3D <&tegra_car TEGRA210_CLK_EMC>;
> +        clock-names =3D "emc";
> +        interrupts =3D <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +        memory-region =3D <&emc_table>;
> +        nvidia,memory-controller =3D <&mc>;
> +    };
> --=20
> 2.24.1
>=20

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54kNEACgkQ3SOs138+
s6HGbw/8D3FMkRoHso29aJcXd+/hiG0qdIcibTe1TKRxxTnhKsgvv2OmUza/erFr
LdSaPpSnQh0oJmhy0AJErTuyIBXlunn4cT1uaLTs/0fWQ/gWvKS53lvPpJMctjU9
baut4xlJRxEtZCjofZXb1+elMvSvbt/25D/rS7a/fiCQ2ycKkWtDe5s96X1/Unsp
o7IHFnpb6b/QoNxrj/Oe/As/VLlEYm/7qpGcM9FYWGF/pTM/deaUT55leK+5+Ivz
CaS02xPMvcWW/bW1Ra72d0Wkox/1Q/phXiHS7D2LMfT5UFHE0x7ge3hFo/abkuAo
0OgKDB+5xeRKPxtDSfcI8P6B4KczVxHOMqxDOP/KiENt5ALJ3+ziykm013eqd65H
CZHKSbXvsRK44bknU3pOW1xcc1aZaqwl3tkW0Lcn5DIZkwQoV4/HVAt2CNgjPuNt
kTLiA4r4ihpZCpDNWubV3os5gs8AaaZnS/8Ww14FsQW5zD9NH3toEITLaWCn0UMO
UeIfgxCGQ2RgKaKRszXsMDC6R7i4X0kO+675PiIixsL5LlwEhOcbPp/+dkaU5q+Z
W2c5c3xwFez6FbcuLoYOez9Mcj5p5pFbrFPQknFmyk4Nqb9fBQtU5wwsxD53mGO2
r8Bpz30EBRWsYibJsB2mpnfE+R2GWpV9TIXbmLPAHfR/mwQqmD8=
=jRIY
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
