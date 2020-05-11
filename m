Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8F7C54E4A
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 21:31:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A453206D9
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 21:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589232674;
	bh=Ht4tmod7oVmyuZg/6MZf9IDqVAdGJ2Sf2iz6PJHLa1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=R6mq4dBikpL0BGKH1zJ3BzTAUCHoixrQTRI76Y5N4NCsELhsEiz6SW1tHGt95qlIZ
	 GQYnkCcIPQft5k412YchUyQaHFbNjhYQawR/uy1ykn0T7VNYKxipgrugHbb2fy6I4O
	 iGaGeQ72AaGbLMqedztbilFvn7RvVM2lj0U5K/rA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgEKVbN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 17:31:13 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46985 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgEKVbN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 17:31:13 -0400
Received: by mail-ot1-f67.google.com with SMTP id z25so8804028otq.13
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 14:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kPA8XGO7yNv52UhCsPudyrmEJijL7uMi7QSa8Mydd9k=;
        b=Sf62CavHbJFOmoP73cUi7R/zX/vcVOmmrFfCALzGDvJ86mYOs1nya/JQyBdRy+ka3U
         SYcM+i23oc4cS/kcX8fQDqHgP1L673CXH+tT8KQ7b5Lr85OKnILk/6oRYiLSkJ3nRzNK
         O4sJdkCR8L+yhpOsyvhEU/qM00tcLjxN5ZjRl7tvnLv1uYJ1+mBaFutLp3LvBb9VA3Ep
         vOvuzzfGlJIQnOPh5ZNyEFJBUSEtxxmZQ6rVU4mT5Yna/5Ybl9HaOfzMnTw5HKsXHNwt
         kxKbtAkJAfK8Nh/7ahWSwq4EcVbHhQaFc0r2x7FNNTldh3E4PpkwcM7kCkf2FjMliWez
         rrqw==
X-Gm-Message-State: AGi0PuZ789J6C2z7EksLggdQACxg9jE16NZqVtcBwUsZnt1qpkIWLqEr
        aXQ9Vk5xE+lpLfahVTMka259pjM=
X-Google-Smtp-Source: APiQypL4+opiwGiUpyi/On/i50F4N6Thq7Tn9+S3jk6cgVHzZLF/gMehnGeEgdQ48kw05CUcBwcQbw==
X-Received: by 2002:a9d:6c94:: with SMTP id c20mr14793398otr.318.1589232670619;
        Mon, 11 May 2020 14:31:10 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v8sm3177795oos.0.2020.05.11.14.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 14:31:09 -0700 (PDT)
Received: (nullmailer pid 13715 invoked by uid 1000);
        Mon, 11 May 2020 21:31:08 -0000
Date:   Mon, 11 May 2020 16:31:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     devicetree@vger.kernel.org, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, ykk@rock-chips.com
Subject: Re: [PATCH] dt-bindings: display: analogix_dp.txt: convert to yaml
Message-ID: <20200511213108.GA3374@bogus>
References: <20200424112634.20863-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200424112634.20863-1-ricardo.canuelo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Apr 24, 2020 at 01:26:34PM +0200, Ricardo Cañuelo wrote:
> This converts the DT binding for the Analogix DP bridge used in
> the Exynos 5 and Rockchip RK3288/RK3399 SoCs to yaml.
> 
> Changes from the original binding:
> - phy and phy-names aren't defined as 'required' (rk3399-evb.dts doesn't
>   define them)
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> ---
> This binding is meant to be used in conjunction with
> Documentation/bindings/display/rockchip/analogix_dp-rockchip.txt
> and
> Documentation/bindings/display/exynos/exynos_dp.txt
> 
> I was careful to define the bindings to be flexible enough for both
> cases, since the properties might be slightly different depending
> on the SoC.

They need to be converted all at once to schema.

> 
> Tested with
> make dt_binding_check ARCH=arm64 DT_SCHEMA_FILES=<...analogix_dp.yaml>
> make dtbs_check ARCH=arm64 DT_SCHEMA_FILES=<...analogix_dp.yaml>
> 
>  .../bindings/display/bridge/analogix_dp.txt   |  51 --------
>  .../bindings/display/bridge/analogix_dp.yaml  | 120 ++++++++++++++++++
>  2 files changed, 120 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix_dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
> deleted file mode 100644
> index 027d76c27a41..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -Analogix Display Port bridge bindings
> -
> -Required properties for dp-controller:
> -	-compatible:
> -		platform specific such as:
> -		 * "samsung,exynos5-dp"
> -		 * "rockchip,rk3288-dp"
> -		 * "rockchip,rk3399-edp"
> -	-reg:
> -		physical base address of the controller and length
> -		of memory mapped region.
> -	-interrupts:
> -		interrupt combiner values.
> -	-clocks:
> -		from common clock binding: handle to dp clock.
> -	-clock-names:
> -		from common clock binding: Shall be "dp".
> -	-phys:
> -		from general PHY binding: the phandle for the PHY device.
> -	-phy-names:
> -		from general PHY binding: Should be "dp".
> -
> -Optional properties for dp-controller:
> -	-force-hpd:
> -		Indicate driver need force hpd when hpd detect failed, this
> -		is used for some eDP screen which don't have hpd signal.
> -	-hpd-gpios:
> -		Hotplug detect GPIO.
> -		Indicates which GPIO should be used for hotplug detection
> -	-port@[X]: SoC specific port nodes with endpoint definitions as defined
> -		in Documentation/devicetree/bindings/media/video-interfaces.txt,
> -		please refer to the SoC specific binding document:
> -		* Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
> -		* Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
> -
> -[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> --------------------------------------------------------------------------------
> -
> -Example:
> -
> -	dp-controller {
> -		compatible = "samsung,exynos5-dp";
> -		reg = <0x145b0000 0x10000>;
> -		interrupts = <10 3>;
> -		interrupt-parent = <&combiner>;
> -		clocks = <&clock 342>;
> -		clock-names = "dp";
> -
> -		phys = <&dp_phy>;
> -		phy-names = "dp";
> -	};
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp.yaml b/Documentation/devicetree/bindings/display/bridge/analogix_dp.yaml
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
> +
> +description: |
> +  The Samsung Exynos eDP and Rockchip RK3288 eDP controllers share the
> +  same IP. This binding describes the nodes and properties that are
> +  common to both SoCs.
> +
> +  Please, read this together with
> +  Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
> +  and
> +  Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos5-dp
> +      - rockchip,rk3288-dp
> +      - rockchip,rk3399-edp
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Physical base address of the controller and length of memory
> +      mapped region.

That's all 'reg' properties, drop.

> +
> +  interrupts:
> +    maxItems: 1
> +    description: Interrupt combiner values.
> +
> +  clocks:
> +    description: Phandles to dp clocks.

Need:

minItems: 1
maxItems: 3

> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 3
> +    additionalItems: true
> +    items:
> +      - const: dp
> +    description: Must define at least "dp".

That's what the schema says.

> +
> +  phys:
> +    maxItems: 1
> +    description: Phandle for the PHY device.

Drop

> +
> +  phy-names:
> +    const: dp
> +
> +  force-hpd: true
> +
> +  hpd-gpios:
> +    maxItems: 1
> +    description:
> +      Hotplug Detect GPIO. Indicates which GPIO should be used for
> +      hotplug detection.

This should be marked deprecated because this belongs in a connector 
node.

> +
> +  ports:
> +    type: object
> +    description: |
> +      A node containing SoC-specific port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +      Please, refer to
> +      Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
> +      and
> +      Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
> +      for SoC-specific information about port and endpoint definitions.

Is the port numbering different? If so, probably should just have 2 
separate schema files.

> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object

Needs 'description' to say what data each port is.

> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +      port@1:
> +        type: object
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    dp: dp-controller@145b0000 {
> +        compatible = "samsung,exynos5-dp";
> +        reg = <0x145b0000 0x10000>;
> +        interrupts = <10 3>;
> +        interrupt-parent = <&combiner>;
> +        clocks = <&clock 342>;
> +        clock-names = "dp";
> +
> +        phys = <&dp_phy>;
> +        phy-names = "dp";
> +    };
> +
> +...
> -- 
> 2.18.0
> 
