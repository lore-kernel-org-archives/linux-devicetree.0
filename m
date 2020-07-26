Return-Path: <SRS0=vke8=BF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D3DC433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 06:55:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9F2A206F6
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 06:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgGZGzM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Jul 2020 02:55:12 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:57242 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgGZGzM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 26 Jul 2020 02:55:12 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id EAA6F80462;
        Sun, 26 Jul 2020 08:55:07 +0200 (CEST)
Date:   Sun, 26 Jul 2020 08:55:06 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: Add DT bindings for Powertip
 PH800480T013
Message-ID: <20200726065506.GA1691925@ravnborg.org>
References: <20200725211335.5717-1-marex@denx.de>
 <20200725211335.5717-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200725211335.5717-2-marex@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=-VAfIpHNAAAA:8 a=VwQbUJbxAAAA:8
        a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8 a=HjWte2sARek0_tVLlIUA:9
        a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=srlwD-8ojaedGGhPAyx8:22
        a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=sptkURWiP4Gy88Gu7hUp:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Marek.

On Sat, Jul 25, 2020 at 11:13:34PM +0200, Marek Vasut wrote:
> Add DT bindings for Powertip PH800480T013 800x480 parallel LCD,
> this one is used in the Raspberry Pi 7" touchscreen display unit.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../panel/powertip,ph800480t013-idf02.yaml    | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml b/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
> new file mode 100644
> index 000000000000..8a2a4f79f365
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/powertip,ph800480t013-idf02#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: POWERTIP PH800480T013-IDF2 7.0" WVGA TFT LCD panel
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: powertip,ph800480t013-idf02
> +
> +  power-supply: true
> +  backlight: true
> +  port: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +...

The binding matches what we have in panel-simple.yaml.
So it should be added there, and not an independent binding file.

	Sam
