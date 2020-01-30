Return-Path: <SRS0=K0Un=3T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C036C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 18:25:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BB6D20661
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 18:25:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729601AbgA3SZ5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jan 2020 13:25:57 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:59254 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729597AbgA3SZ5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jan 2020 13:25:57 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 4A2452005D;
        Thu, 30 Jan 2020 19:25:51 +0100 (CET)
Date:   Thu, 30 Jan 2020 19:25:49 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     michael.srba@seznam.cz
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/2] dt-bindings: display/panel: add bindings for
 S6E88A0-AMS452EF01
Message-ID: <20200130182549.GA21265@ravnborg.org>
References: <20200130171128.29251-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200130171128.29251-1-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=gEfo2CItAAAA:8
        a=doRB7wx00yQXQO78LT4A:9 a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22
        a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Michael.

Thanks for the quick feedback and the conversion.
There is a few things you need to improve as noted below.

	Sam

On Thu, Jan 30, 2020 at 06:11:27PM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds dts bindings for Samsung AMS452EF01 AMOLED panel, which makes
> use of their S6E88A0 controller.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
> Hi,
> Thanks for the review. I believe I've fixed everything, and I tested that 
> I get image on drm-next with these patches applied.
> 
> Changes since v1: use yaml format for the binding
> ---
>  .../panel/samsung,s6e88a0-ams452ef01.yaml     | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
> new file mode 100644
> index 000000000000..3d9b480ec706
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0-only
For new bindings please use: (GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
Filename must match

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung AMS452EF01 AMOLED panel with S6E88A0 video mode DSI controller
> +
> +maintainers:
> +  - Michael Srba <Michael.Srba@seznam.cz>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6e88a0-ams452ef01
> +  reg: true
> +  reset-gpios: true
> +  vdd3-supply:
> +     description: core voltage supply
> +  vci-supply:
> +     description: voltage supply for analog circuits
> +  enforce-video-mode: true
enforce-video-mode is not referenced in the driver - is it relevant?

> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd3-supply
> +  - vci-supply
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    panel@0 {
> +		reg = <0>;
> +
> +		compatible = "samsung,s6e88a0-ams452ef01";
> +
> +		vdd3-supply = <&pm8916_l17>;
> +		vci-supply = <&reg_vlcd_vci>;
> +		reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> +	};
No tabs in yaml files. And fix indent so it matches.
Closing '}' below 'p' in ports.



> +
> +...
Drop - not needed.
