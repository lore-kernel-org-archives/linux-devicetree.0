Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DD5C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 21:56:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBD1C20775
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 21:56:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jLKM82n/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgGHV4I (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 17:56:08 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34576 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHV4I (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 17:56:08 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 068Lu4CS035725;
        Wed, 8 Jul 2020 16:56:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594245364;
        bh=XaaHSvurwO3Of0+afndZ3dr3Py9hwzyQs4kynZ2rCpM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jLKM82n/+D+zYSPpQLkYMdZ6g/GEPJ2rejstUc1IAKA03waxs3IKEOuVhf5neu1vz
         BO1qRqsUnlH2sBWzITsMeaXAHfUWlo2+XXVbb6XH8dV6Is7el2OEHGvGWpr3E5zoCV
         PQtHETEcGuM5cnKKBfmHbeFy1baIcdx937XFtOOk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 068Lu3jQ063706
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 8 Jul 2020 16:56:04 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 8 Jul
 2020 16:56:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 8 Jul 2020 16:56:03 -0500
Received: from [10.250.32.229] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 068Lu3GY028307;
        Wed, 8 Jul 2020 16:56:03 -0500
Subject: Re: [PATCH net-next 1/2] dt-bindings: dp83867: Fix the type of device
To:     Fabio Estevam <festevam@gmail.com>, <davem@davemloft.net>
CC:     <robh+dt@kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200708212422.7599-1-festevam@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <62d60830-4209-869d-fe2c-fb30a642e2c3@ti.com>
Date:   Wed, 8 Jul 2020 16:55:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708212422.7599-1-festevam@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Fabio

On 7/8/20 4:24 PM, Fabio Estevam wrote:
> DP83867 is an Ethernet PHY, not a charger, so fix the documentation
> accordingly.
>
> Fixes: 74ac28f16486 ("dt-bindings: dp83867: Convert DP83867 to yaml")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>   Documentation/devicetree/bindings/net/ti,dp83867.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> index 554dcd7a40a9..c6716ac6cbcc 100644
> --- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> @@ -24,7 +24,7 @@ description: |
>     IEEE 802.3 Standard Media Independent Interface (MII), the IEEE 802.3 Gigabit
>     Media Independent Interface (GMII) or Reduced GMII (RGMII).
>   
> -  Specifications about the charger can be found at:
> +  Specifications about the Ethernet PHY can be found at:
>       https://www.ti.com/lit/gpn/dp83867ir
>   
>   properties:
Acked-by: Dan Murphy <dmurphy@ti.com>
