Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4892BC33CAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 21:27:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D8192187F
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 21:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578950863;
	bh=FA28n6ktJxQUYxR/tTujAqhPiQ18OaQ/XL1refTxLls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Xn62yiBURLH+LXLoYKbqMgkJaPgWF4/SEkpIV3mbhkvz2jJlTbaDXw36y2PCQAkf6
	 DDpLrTuBXbITaX7qH11gIubw0jj5yX01ufE2wic/HpE9hnlIHE+2uVUrz74MX7gNPM
	 RMj/rdTGcCpgrwm6YWqqqaxHQPtuoc/vBvwyAHnc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgAMV1j (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 16:27:39 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33392 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgAMV1j (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 16:27:39 -0500
Received: by mail-oi1-f193.google.com with SMTP id v140so9793642oie.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 13:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wpi+Y6/xhviC2Sqtl/ej/5/Y4u+j7SMkoib6d0WEkK8=;
        b=bFcaIoEW5z38qHieevq8dqEJmEDwF6HCfB7tAsw+1SbNqkHvqiEe9hi+jwF+Ztifl+
         mvm+WpoD/kkaloL1UYug16N3l8C+Sclw0p+F/D130B9CWqJR5UrlI8wyhXlw5x9ik8U2
         AkX5SE+5mEH1iK8RT0zr2XbahQ3R73dEdXRtWan1xKTChs/SYfu2Ay4uOXEgpkLidcNH
         ZIGoB6kygTlbVAx+BL+yZ9pDL1YpjoHvDqrGexqSYPI6MaoiMvK36sEKHwqp3qO3sRUo
         AoZGAxe0tJGn12/locFZX7O8PN9nDO9sQczzSHAHiSQlUDfL7NtekxdamRdVRe3mpZvR
         0+Sw==
X-Gm-Message-State: APjAAAV5FRX23+ExrjFt5xper7NdnYMMlx9msBhIBeXyDkFfQpcuCX80
        kkMT3I/Z1diHAYsy/s1jy6WMlLg=
X-Google-Smtp-Source: APXvYqwL01BLa8LUhp228Q+Aj3XPNRTaGt1ElsgsVQDbyjSfPWEcOX3+LDBvg7VYfYRL2r2urqAcXw==
X-Received: by 2002:aca:dfd5:: with SMTP id w204mr14728675oig.95.1578950858277;
        Mon, 13 Jan 2020 13:27:38 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r23sm3933677oij.38.2020.01.13.13.27.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 13:27:36 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220b00
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 15:27:35 -0600
Date:   Mon, 13 Jan 2020 15:27:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: clock: Convert i.MX8MQ to json-schema
Message-ID: <20200113212735.GA9275@bogus>
References: <1578642914-838-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578642914-838-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 10, 2020 at 03:55:12PM +0800, Anson Huang wrote:
> Convert the i.MX8MQ clock binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../devicetree/bindings/clock/imx8mq-clock.txt     | 20 ------
>  .../devicetree/bindings/clock/imx8mq-clock.yaml    | 72 ++++++++++++++++++++++
>  2 files changed, 72 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/imx8mq-clock.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8mq-clock.yaml

Fails 'make dt_binding_check':

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8mn-clock.example.dt.yaml: 
clock-controller@30380000: clock-names:0: 'ckil' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8mn-clock.example.dt.yaml: 
clock-controller@30380000: clock-names:1: 'osc_25m' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8mn-clock.example.dt.yaml: 
clock-controller@30380000: clock-names:2: 'osc_27m' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8mn-clock.example.dt.yaml: 
clock-controller@30380000: clock-names:3: 'clk_ext1' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8mn-clock.example.dt.yaml: 
clock-controller@30380000: clock-names:4: 'clk_ext2' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8mn-clock.example.dt.yaml: 
clock-controller@30380000: clock-names:5: 'clk_ext3' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8mn-clock.example.dt.yaml: 
clock-controller@30380000: clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8mn-clock.example.dt.yaml: 
clock-controller@30380000: clocks: [[1], [2], [3], [4], [5], [6]] is too short

> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8mq-clock.txt b/Documentation/devicetree/bindings/clock/imx8mq-clock.txt
> deleted file mode 100644
> index 52de826..0000000
> --- a/Documentation/devicetree/bindings/clock/imx8mq-clock.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -* Clock bindings for NXP i.MX8M Quad
> -
> -Required properties:
> -- compatible: Should be "fsl,imx8mq-ccm"
> -- reg: Address and length of the register set
> -- #clock-cells: Should be <1>
> -- clocks: list of clock specifiers, must contain an entry for each required
> -          entry in clock-names
> -- clock-names: should include the following entries:
> -    - "ckil"
> -    - "osc_25m"
> -    - "osc_27m"
> -    - "clk_ext1"
> -    - "clk_ext2"
> -    - "clk_ext3"
> -    - "clk_ext4"
> -
> -The clock consumer should specify the desired clock by having the clock
> -ID in its "clocks" phandle cell.  See include/dt-bindings/clock/imx8mq-clock.h
> -for the full list of i.MX8M Quad clock IDs.
> diff --git a/Documentation/devicetree/bindings/clock/imx8mq-clock.yaml b/Documentation/devicetree/bindings/clock/imx8mq-clock.yaml
> new file mode 100644
> index 0000000..881c01c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx8mq-clock.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/imx8mq-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8M Quad Clock Control Module Binding
> +
> +maintainers:
> +  - Anson Huang <Anson.Huang@nxp.com>
> +
> +description: |
> +  NXP i.MX8M Quad clock control module is an integrated clock controller, which
> +  generates and supplies to all modules.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mn-ccm

Wrong compatible...

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 32k osc
> +      - description: 25m osc
> +      - description: 27m osc
> +      - description: ext1 clock input
> +      - description: ext2 clock input
> +      - description: ext3 clock input
> +      - description: ext4 clock input
> +
> +  clock-names:
> +    items:
> +      - const: ckil
> +      - const: osc_25m
> +      - const: osc_27m
> +      - const: clk_ext1
> +      - const: clk_ext2
> +      - const: clk_ext3
> +      - const: clk_ext4
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mq-clock.h
> +      for the full list of i.MX8M Quad clock IDs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +examples:
> +  # Clock Control Module node:
> +  - |
> +    clk: clock-controller@30380000 {
> +        compatible = "fsl,imx8mq-ccm";
> +        reg = <0x30380000 0x10000>;
> +        #clock-cells = <1>;
> +        clocks = <&ckil>, <&osc_25m>, <&osc_27m>,
> +                 <&clk_ext1>, <&clk_ext2>,
> +                 <&clk_ext3>, <&clk_ext4>;
> +        clock-names = "ckil", "osc_25m", "osc_27m",
> +                      "clk_ext1", "clk_ext2",
> +                      "clk_ext3", "clk_ext4";
> +    };
> +
> +...
> -- 
> 2.7.4
> 
