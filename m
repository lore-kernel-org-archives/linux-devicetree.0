Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD15FC47255
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 21:38:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F891206F5
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589233102;
	bh=APUZo3/WV2kNevqYRH+Ucvs6mDdyWHcwpHNg3vwKyOU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=ffXpgBKQ2XomuUxMav1Rqe2YbV8oBq3omLocjvoeMCBnjTPnat/bxqRmQR0zNoP88
	 dmM22EdGX/648XLbA+76OkyJAtcx4RuYm1Z9wpos3oEmELsk7bSszyASmpkZEYAwVa
	 0LFEugrVzIYh/gN5Ouvc/liHlkwu/KHcBnq+uhe0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgEKViW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 17:38:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:43546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbgEKViW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 May 2020 17:38:22 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46EBE206F5
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 21:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589233101;
        bh=APUZo3/WV2kNevqYRH+Ucvs6mDdyWHcwpHNg3vwKyOU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pn18pPp8UXY4ndHqotnJOcKP1kDx7QE1J+wDQJYsQt23EUy6qgZC0Gg3FgLhPBlcl
         iRK/PtNTPsmhEPjeGORmeHTjrwRbIKApllHw87Uh9uRGZm5ui2NWcp5yashNIivUWN
         DFTRNgAAhyw8csaMFbY81jtcJB6lMlkfvFZA6oHw=
Received: by mail-ot1-f47.google.com with SMTP id m13so8840822otf.6
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 14:38:21 -0700 (PDT)
X-Gm-Message-State: AGi0Pual6mfU7MemLo8Ni//iP8ESjtoNVHBmZqKI5mXACgaGtAbnzWvn
        bkp20bz/AReejMIe8eQ5wjgqTSdAzVuDl5fImg==
X-Google-Smtp-Source: APiQypI3uLQdj5Wxc59CQ2x0CyttJaVUX2j5fQdC/RmLf4fuIfphK8YAvNw/nSvhyK/dMfDWzuFoiL2McIlbnZRpD3c=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr13404384otl.107.1589233100557;
 Mon, 11 May 2020 14:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200424112634.20863-1-ricardo.canuelo@collabora.com>
In-Reply-To: <20200424112634.20863-1-ricardo.canuelo@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 11 May 2020 16:38:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK+obuG_NxDXDKUe2f4v_YWjQQ3Y+zQVYt5emnJizVqSQ@mail.gmail.com>
Message-ID: <CAL_JsqK+obuG_NxDXDKUe2f4v_YWjQQ3Y+zQVYt5emnJizVqSQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: analogix_dp.txt: convert to yaml
To:     =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     devicetree@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Yakir Yang <ykk@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Apr 24, 2020 at 6:26 AM Ricardo Ca=C3=B1uelo
<ricardo.canuelo@collabora.com> wrote:
>
> This converts the DT binding for the Analogix DP bridge used in
> the Exynos 5 and Rockchip RK3288/RK3399 SoCs to yaml.
>
> Changes from the original binding:
> - phy and phy-names aren't defined as 'required' (rk3399-evb.dts doesn't
>   define them)
>
> Signed-off-by: Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com>
> ---
> This binding is meant to be used in conjunction with
> Documentation/bindings/display/rockchip/analogix_dp-rockchip.txt
> and
> Documentation/bindings/display/exynos/exynos_dp.txt
>
> I was careful to define the bindings to be flexible enough for both
> cases, since the properties might be slightly different depending
> on the SoC.
>
> Tested with
> make dt_binding_check ARCH=3Darm64 DT_SCHEMA_FILES=3D<...analogix_dp.yaml=
>
> make dtbs_check ARCH=3Darm64 DT_SCHEMA_FILES=3D<...analogix_dp.yaml>
>
>  .../bindings/display/bridge/analogix_dp.txt   |  51 --------
>  .../bindings/display/bridge/analogix_dp.yaml  | 120 ++++++++++++++++++
>  2 files changed, 120 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/anal=
ogix_dp.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/anal=
ogix_dp.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp=
.yaml b/Documentation/devicetree/bindings/display/bridge/analogix_dp.yaml
> new file mode 100644
> index 000000000000..a29a79d92c4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/analogix_dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analogix Display Port bridge bindings
> +
> +maintainers:
> +  - Yakir Yang <ykk@rock-chips.com>

And this email address bounces, so find a new maintainer.

Rob
