Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA69C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:30:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD4C120657
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:30:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BkHQG9c/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgEOIag (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 04:30:36 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38652 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgEOIag (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 May 2020 04:30:36 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04F8UYsj117872;
        Fri, 15 May 2020 03:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589531434;
        bh=FzLqY4zqnh7lT0ruj5ttks18c1pb/faHZFOL7D9hrTU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BkHQG9c/pPB0PBJuGuaqc9zobeXRXr6oUBOoFW15C/HuV8NG/ZX5A4kW03Tmjdx6J
         6zhCLJwibnPbejNM8lsLUdI1leXlBAEooSGpct9u+jFoSbnZcsSXTuxuo4e1qnWSAn
         lbjGCg42g4ygoQ5s+cPwZkKDcIfFtgesCZMpswJ0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04F8UYiq012401
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 May 2020 03:30:34 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 May 2020 03:30:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 May 2020 03:30:34 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04F8UWjB117146;
        Fri, 15 May 2020 03:30:33 -0500
Subject: Re: [PATCH 3/4] dt-binding: phy: ti,omap-usb2: Add quirk to disable
 charger detection
To:     <kishon@ti.com>
CC:     <robh+dt@kernel.org>, <b-liu@ti.com>, <devicetree@vger.kernel.org>,
        <vigneshr@ti.com>, <nsekhar@ti.com>
References: <20200515080518.26870-1-rogerq@ti.com>
 <20200515080518.26870-4-rogerq@ti.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <3d7a50dd-7764-b6b7-89e6-77fa57a9eca7@ti.com>
Date:   Fri, 15 May 2020 11:30:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515080518.26870-4-rogerq@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 15/05/2020 11:05, Roger Quadros wrote:
> Add "ti,dis-chg-det-quirk" property to disable the USB2_PHY Charger Detect
> logic.

On second thoughts I think it is better to use soc_device_match instead of DT property
as we are not going to have separate DT for SR1.0 vs SR2.0.

cheers,
-roger
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>   Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml b/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
> index ecfb28f714ea..ec3e85a17bfa 100644
> --- a/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
> +++ b/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
> @@ -54,6 +54,11 @@ properties:
>         (deprecated) phandle of the control module used by PHY driver
>         to power on the PHY. Use syscon-phy-power instead.
>   
> +  ti,dis-chg-det-quirk:
> +    description:
> +      if present, driver will disable charger detection logic.
> +    type: boolean
> +
>   required:
>     - compatible
>     - reg
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
