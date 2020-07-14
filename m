Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABB0C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 09:17:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5630A21D7B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 09:17:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxbrLwBR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgGNJRZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 05:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgGNJRY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jul 2020 05:17:24 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFA2C061755;
        Tue, 14 Jul 2020 02:17:24 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o18so20745127eje.7;
        Tue, 14 Jul 2020 02:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bK07gtBUBD0BesHdQADm+h4gj4iWTeWSi9aPbh2+tpM=;
        b=fxbrLwBRMLqDBiKNRnGECmAkqW7IUkz5/xeNJ0ImDnpMVjOSkOtRlJq7Yq6J6Joeb9
         n+Fmq8sNpQSxAiRqcj/Cj9qkzCPK4J0cS+cS28ye9FznJwrEIBX2PF9b6ZVzeZyNA4R8
         AkJealOwuowxWCDOdkxK6OiopGu1oYL7TVz5DfKrxHaROahOvB9TpNAlKsyfFFNST70G
         E5WYwH32bZu0CDMqWJfTBeNVnQ5BZieQNxoDA/+bnc8j4TXHkArVpvEBCeOB0wXSVNNv
         fxnWjEBeBmHQ1OGjmXhTYe7Jkqk3mK3zeXYnAm9XIMHi0CsRlahukgQdlQUMT+vjI7tF
         w14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bK07gtBUBD0BesHdQADm+h4gj4iWTeWSi9aPbh2+tpM=;
        b=XBat/jp05hhCh2cCUV5qOeMsBtzROjTxrjDRXVPW/rSCZ3APNiuGPnkdevWU/l3axG
         TBARpHKE1ZDiHChBxzmOql65GGXYL9bNjrQTzgoyGQO0h04pMiZQIPj3Zh8aB+XNdeJV
         bNSAflMHxdUXHX5HXnPxJ6HPopnD8FARa5nkFHOOwWPUszpYwFH1sfSb81vG/yfMDWsZ
         PvxeC2IQnBDOoYylxni2IHK5EL25PjlLFMcbfVbY3UIicJjQtkEp2OLMWziFY3vJo2Gc
         YIiFM3HL/6aysfkLX6krodUoo8bfLJpyjbfeIcRRKiyMCgtFWf7/Qg7bRbFbn0M0eYlz
         DeiA==
X-Gm-Message-State: AOAM532EOFPT8KCGzxGvS6N1OlOrBMEij2TH84hGYfwfH6n/V4FuFyeL
        oUz3tngN62X1KhjLYAd0oYA=
X-Google-Smtp-Source: ABdhPJzNcrp9ccQ5pVK4GrdkHxjwMR43kE2lAp7jU+VzcgpYVkSXwJRhRn87jdUYPi2fH6N/WD4rhw==
X-Received: by 2002:a17:907:2489:: with SMTP id zg9mr3586716ejb.48.1594718242868;
        Tue, 14 Jul 2020 02:17:22 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r6sm10027299ejd.55.2020.07.14.02.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 02:17:21 -0700 (PDT)
Date:   Tue, 14 Jul 2020 11:17:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH] arm64: tegra: Add support for Jetson Xavier NX
Message-ID: <20200714091720.GC141356@ulmo>
References: <20200712102506.23686-2-jonathanh@nvidia.com>
 <20200713161701.30449-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline
In-Reply-To: <20200713161701.30449-1-jonathanh@nvidia.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2020 at 05:17:01PM +0100, Jon Hunter wrote:
> Add the device-tree source files for the Tegra194 Jetson Xavier NX
> Developer Kit. The Xavier NX Developer Kit consists of a small form
> factor system-on-module (SOM) board (part number p3668-0000) and a
> carrier board (part number p3509-0000).
>=20
> The Xavier NX Developer Kit SOM features a micro-SD card slot,
> however, there is also a variant of the SOM available that features a
> 16GB eMMC. Given that the carrier board can be used with the different
> SOM variants, that have different part numbers, both the compatible
> string and file name of the device-tree source file for the Developer
> Kit is a concatenation of the SOM and carrier board part numbers.
>=20
> This is based upon some initial work by Thierry Reding
> <treding@nvidia.com>.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>=20
> I have updated the author and given credit to Thierry for doing the
> initial work on the change.
>=20
>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>  .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 343 ++++++++++++++++++
>  .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 296 +++++++++++++++
>  3 files changed, 640 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-=
0000.dts
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi

I need this patch to avoid an error being flagged by checkpatch:

--- >8 ---
diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentati=
on/devicetree/bindings/arm/tegra.yaml
index 60b38eb5c61a..53845db64df1 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -101,3 +101,11 @@ properties:
           - enum:
               - nvidia,p2972-0000
           - const: nvidia,tegra194
+      - description: Jetson Xavier NX
+        items:
+          - const: nvidia,p3668-0000
+          - const: nvidia,tegra194
+      - description: Jetson Xavier NX Developer Kit
+        items:
+          - const: nvidia,p3509-0000+p3668-0000
+          - const: nvidia,tegra194
--- >8---

I'll submit that separately and have applied this one in the meantime.

Thanks,
Thierry

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8NeB4ACgkQ3SOs138+
s6FPwhAAgVXj380VKc1EoXEsYut5/hDLgGF8xQqGNQ3VQ2gVmHYL5pvWV8eYsxmU
bVKDpQVr5ogndrH8IX9SbKbF5CJP7ZwieWetPjYk7P/v8LFU4RqN4+vXz/2vN1/O
+VF51NGo1bXAySixylRmrX4Okmme3jDi3+Fn566O5atXqswh+iBFmBh/NvHloMSc
VeosCiM9dc57wGLPKQqj6taAYPRSK24q5tiqQVQKYztshNcVbP4n44FTDQCDQBgj
Q+IFYcr0f2CyKmzIhQp1a9DAotrKlgKoTOTV6otRHSrmvQD4/fwelu+yUriHu5T0
WYL0WflCqMMcdstCE4qV0OdsPXW53pH+wmRFk4FTF5TugkyCDWRbKJrWqoy3LSc+
mV3ipsQ4tdlN2bCV2kOr85HPAXAQ7NOvuiUF5lo3Tfo6Q0hxNOrJ8aXkv2+V75Ei
sBCUCLrzHc1TCoffk2J/SmafkbQVVb6nGR5i4CPsSU5C3jIS3ZyI587VvW1j1GXb
AXtOWRqo5AtCty5IiTZlLvgEXNcnYeaFP7KKweLW72H4qrmUJMpGGd/jP8ay1Eb/
58VbD8Yfla2qiE0qf1cSqimhogwTBJmZS9Hjz4Ma1BPBJGx2hBNznndYUAnmf+2J
LzMZiNwLEOJ2lAg9/AchUDCKZel8uLcEu6Ak1LG11RDgIW0f2zQ=
=Rl5v
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
