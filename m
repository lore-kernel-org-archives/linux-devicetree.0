Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7DEC00523
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 03:46:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 783CA20848
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 03:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578455162;
	bh=Ihl+3pdCOlhiMQtJMYRapemNry7m7Oc+/e/RZqPfzGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=bFgFXM1vekP2n080w3Su5mZ6dkkana1MLhpN1whN9ElknxX6GXu0sicuhs8gao8GU
	 iEKTqTURHZBeuidTtUhdJ6r+m57mwlyD0Ellxp3QWma1WJNu6xmnDgvDLCh4+A2RuT
	 ydpLBJoUuncWBHruRUCk5C1fC2vnxDWXJFqzmdKA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgAHDqB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 22:46:01 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42153 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgAHDqB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 22:46:01 -0500
Received: by mail-oi1-f195.google.com with SMTP id 18so1470493oin.9
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 19:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=r+pFes6TBL9qlt9DAArVbPYLSHaTdO8S1tCZhBCIPEc=;
        b=rpoOyjquoE8HlWnkYdLr5XsYG2HjezZM4dFD0yOcLbXFxnaPYgbSRqk7bctaFl/R8C
         xkx+eX09OWjT60fefviMZJMIO4hlduJavX/iBslgFeTVn5Eutq6lDV+94iTVLZGv/0Gl
         tm/4mnNn6otzP01/habmTS/Ew6NZ+xtAaCu7p4Ww0nM3zX8xRcD7QxxTN210Eu+dVFsB
         MUaNzzP46up9jzViBxTLLisnTQ1vC0Ak1L8UMwccVOPZJiOROhf+/snyOLb+Z+PHKdyy
         RKhYshDxdAke/zmu0zNX6F0LXX98rXVhOYKNYdtxq9AsuxHVmHVBJH3S+X6WyImk6+dS
         1oTQ==
X-Gm-Message-State: APjAAAWcfqh/bmx2pDux8lrOIwWK5TvYP3fUqd0iSwWk2v6CEpaTSyfu
        dyLTgNgl6FqKmoh0dWudn8Uwog8=
X-Google-Smtp-Source: APXvYqyD7MkYbUM3VzyFdWZuav47RtjwfZlEhZyfjZ92aIrzB+CQcOqt019up3x5TpozdjXnDd/5Kg==
X-Received: by 2002:aca:b183:: with SMTP id a125mr1469049oif.83.1578455160694;
        Tue, 07 Jan 2020 19:46:00 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f1sm657145otq.4.2020.01.07.19.46.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 19:46:00 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219e3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 07 Jan 2020 21:45:59 -0600
Date:   Tue, 7 Jan 2020 21:45:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org,
        lee.jones@linaro.org, lars@metafoo.de, pascal.huerst@gmail.com
Subject: Re: [PATCH 02/10] dt-bindings: i2c: Add documentation for ad242x i2c
 controllers
Message-ID: <20200108034559.GA27808@bogus>
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-3-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191209183511.3576038-3-daniel@zonque.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 09, 2019 at 07:35:02PM +0100, Daniel Mack wrote:
> This device must be placed as a sub-device of an AD242x MFD node.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../bindings/i2c/adi,ad242x-i2c.yaml          | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/adi,ad242x-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/adi,ad242x-i2c.yaml b/Documentation/devicetree/bindings/i2c/adi,ad242x-i2c.yaml
> new file mode 100644
> index 000000000000..ded92f8a791b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/adi,ad242x-i2c.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/adi,ad242x-i2c.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Analog Devices AD242x I2C controller
> +
> +maintainers:
> +  - Daniel Mack <daniel@zonque.org>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +description: |
> +  This module is part of the AD242x MFD device. For more details and an example
> +  refer to Documentation/devicetree/bindings/mfd/ad242x.yaml.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad2428w-i2c
> +
> +  clock-frequency:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'

Can drop as it already has a type.

> +    default: 100000
> +    enum: [100000, 400000]
> +    description: Specifies the I²C clock frequency in Hz.
> +
> +required:
> +  - compatible
> -- 
> 2.23.0
> 
