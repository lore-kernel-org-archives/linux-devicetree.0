Return-Path: <SRS0=uzRV=5Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAFCC2D0EF
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 19:31:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 427D9206DB
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585683090;
	bh=Jt5CuRwPmHl6A7qpcheE+r8WnPTsg9Vy8MY7OiamGpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=TgYBCOkhsYTd+OCB7Lfw4YdnclbwL0e8D+yllQvBeaBxgMDmgso88aZUvwRI5pkHA
	 N9FQiD6r5etYH6+dHR7SBuimA/S2hyQq0uAUXTZ+9VsAttmD1JSusM9k84Hv41Xe3i
	 PGpIElJNZfW4vFftSY//Vd6Ghl8DLhYrWBQBk/ik=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbgCaTb3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 15:31:29 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:39158 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbgCaTb3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 31 Mar 2020 15:31:29 -0400
Received: by mail-il1-f193.google.com with SMTP id r5so20633766ilq.6;
        Tue, 31 Mar 2020 12:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4E3rOca8V8PqiExuCYVosA0xfKnTr6EMn3Z9j+lzY0I=;
        b=ElIQJTjTUzMcEAykiFtupHoAC3BsqGZq9r2vV5WP4B+flFUp1Gals1NHHsrC6gIxvL
         lgH/yB628vlICjtxQ3sEwGS1et3KXezyTZdNpTiyjipDCUxs1wifNAt84ydhkL2pIbIS
         d5GIUpOZjeUFg3dowYdOwCJ9RM/OGWuON0tLHOEOFrWTsvPtLxeSh0CNyiLF45025WjW
         TJVw+a/gpVF8h8XZI6kWJfa8XX+kWt43AQJ6yQ7ybCF2F+auJF/p2BdiPg4VKnGBtzRM
         3027b8ZuBixmS0H707uVmbZunHs9iTY3DY76AZJ6B4FJuhQuKj7RaSgX5HmydCK/+OCL
         7fdA==
X-Gm-Message-State: ANhLgQ29QC9mPrfLj0XUXEE5pJQvug+njQfCf5dfPDpFOHLJ22OAWzSh
        XETqrPsKwFslIGykDSCVQA==
X-Google-Smtp-Source: ADFU+vvpYU1W+QnpfWkq+2/wT8SBpnlfPrg6qX7DKaI/XsuDkVjohw5Nsj4P4wIQ6O/g1ZUHs4b96A==
X-Received: by 2002:a92:5e92:: with SMTP id f18mr18940362ilg.19.1585683088851;
        Tue, 31 Mar 2020 12:31:28 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id i4sm2598643ilq.4.2020.03.31.12.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 12:31:28 -0700 (PDT)
Received: (nullmailer pid 29462 invoked by uid 1000);
        Tue, 31 Mar 2020 19:31:26 -0000
Date:   Tue, 31 Mar 2020 13:31:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     kishon@ti.com, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com
Subject: Re: [PATCH v3 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Message-ID: <20200331193126.GA27304@bogus>
References: <20200324071030.19801-1-peter.chen@nxp.com>
 <20200324071030.19801-2-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324071030.19801-2-peter.chen@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Mar 24, 2020 at 03:10:30PM +0800, Peter Chen wrote:
> Add Cadence SALVO PHY binding doc, this PHY is a legacy module,
> and is only used for USB3 and USB2.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v3:
> - Fix more schema errors
> 
>  .../bindings/phy/cdns,salvo-phy.yaml          | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> new file mode 100644
> index 000000000000..a36e21e1808c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 NXP
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/cdns,salvo-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Cadence SALVO PHY
> +
> +maintainers:
> +  - Peter Chen <peter.chen@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,salvo-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: salvo_phy_clk
> +
> +  power-domains:
> +    maxItems: 1
> +    description: phandle to the associated power domain

Drop. That's every power-domains property.

> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +
> +    usb3phy: usb3-phy@5B160000 {

Should be lowercase hex.

> +        compatible = "nxp,salvo-phy";
> +        reg = <0x5B160000 0x40000>;
> +        clocks = <&usb3_lpcg 4>;
> +        clock-names = "salvo_phy_clk";
> +        power-domains = <&pd IMX_SC_R_USB_2_PHY>;
> +        #phy-cells = <0>;
> +    };
> -- 
> 2.17.1
> 
