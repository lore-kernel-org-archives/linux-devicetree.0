Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7046C2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 09:25:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8466220771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 09:25:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pmeerw.net header.i=@pmeerw.net header.b="mhtg0s+g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895466AbgDOJZm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 05:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2895392AbgDOJZj (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 05:25:39 -0400
X-Greylist: delayed 545 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Apr 2020 02:25:39 PDT
Received: from ns.pmeerw.net (ns.pmeerw.net [IPv6:2001:1b60:2:23:1033:103:0:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51540C061A0C
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 02:25:39 -0700 (PDT)
Received: by ns.pmeerw.net (Postfix, from userid 1000)
        id BF03DE01FA; Wed, 15 Apr 2020 11:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pmeerw.net; s=mail;
        t=1586942181; bh=ncylDpaKZtZ3lQN73jxuqouhPNIAVzjx8bLjlP9nz5k=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=mhtg0s+g0ilGFTzcsBfizbiURCnXTRRY1jX0Qb/JFJFYM5LSyE8sWSn8+3NVJlVCO
         5AS6xpO0shx+tUAqCmjgRX32ZBqzEpbLUHcmnrZXCGo7VrGoKGCsitOxujArgSoBuR
         HMc+e0mDtENmCVSP23nb8IED4MeTFgThhkbL/h5c=
Received: from localhost (localhost [127.0.0.1])
        by ns.pmeerw.net (Postfix) with ESMTP id B46E9E019D;
        Wed, 15 Apr 2020 11:16:21 +0200 (CEST)
Date:   Wed, 15 Apr 2020 11:16:21 +0200 (CEST)
From:   Peter Meerwald-Stadler <pmeerw@pmeerw.net>
To:     Saravanan Sekar <saravanan@linumiz.com>
cc:     robh+dt@kernel.org, jic23@kernel.org, devicetree@vger.kernel.org,
        linux-iio@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: iio: add document bindings for wsen-itds
 accel sensor
In-Reply-To: <20200415065535.7753-3-saravanan@linumiz.com>
Message-ID: <alpine.DEB.2.21.2004151114590.22614@vps.pmeerw.net>
References: <20200415065535.7753-1-saravanan@linumiz.com> <20200415065535.7753-3-saravanan@linumiz.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="324302256-1364362776-1586942181=:22614"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--324302256-1364362776-1586942181=:22614
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 15 Apr 2020, Saravanan Sekar wrote:

comments below, some typos

> Add device tree binding information for wsen-itds accel sensor driver.
> 
> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
> ---
>  .../bindings/iio/accel/we,wsen-itds.yaml      | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/we,wsen-itds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/we,wsen-itds.yaml b/Documentation/devicetree/bindings/iio/accel/we,wsen-itds.yaml
> new file mode 100644
> index 000000000000..165cdf71966d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/accel/we,wsen-itds.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/accel/we,wsen-itds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Würth Elektronik WSEN-ITDS triaxial acceleration sensor
> +
> +maintainers:
> +  - Saravanan Sekar <saravanan@linumiz.com>
> +
> +description: |
> +  Acceleration and temperature iio sensors with an i2c interface.

sensor

> +  The sensor provies additional application specific features like

provides

> +  tap detection, 6D Orinetation, Free-fall, Motion and Activity.

orientation

> +
> +properties:
> +  compatible:
> +    enum:
> +      - we,wsen-itds
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: phandle to the regulator that provides power to the accelerometer
> +
> +  vddio-supply:
> +    description: phandle to the regulator that provides power to the sensor's IO
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      accelerometer@18 {
> +        compatible = "we,wsen-itds";
> +        reg = <0x18>;
> +        vdd-supply = <&vdd>;
> +        vddio-supply = <&vddio>;
> +        interrupt-parent = <&gpio0>;
> +        interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +      };
> +    };
> 

-- 

Peter Meerwald-Stadler
Mobile: +43 664 24 44 418
--324302256-1364362776-1586942181=:22614--
