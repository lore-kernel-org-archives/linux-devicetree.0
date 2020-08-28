Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81B4C433E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 00:41:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4034207DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 00:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VS2y2vsi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgH1AlK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 20:41:10 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56612 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgH1AlK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 20:41:10 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07S0f5ew078371;
        Thu, 27 Aug 2020 19:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598575265;
        bh=gq9TpIit4AtNz03cUcNM1m1LIpdafovigMyFbu/xCHA=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=VS2y2vsilBfByaDVceeu8DhZgU1xGQOfH4mmvzsjg+N2oatxkfkyDeswwlk/3JU9c
         iZfG4Lrdb5cWAuyHLp1JjC9UFFGL1oSfxLYkvYA5Y2fY13pkqerokYvDRZAiOGABJY
         sPepWs/czyZBYMOvM4uEadPKfBzRjreXUrcXJD8A=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07S0f5Cp083861;
        Thu, 27 Aug 2020 19:41:05 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 19:41:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 19:41:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07S0f5V6025971;
        Thu, 27 Aug 2020 19:41:05 -0500
Date:   Thu, 27 Aug 2020 19:41:05 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>
CC:     Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ti: Convert K3 board/soc
 bindings to DT schema
Message-ID: <20200828004105.givypeu3vextefc6@akan>
References: <20200827065144.17683-1-lokeshvutla@ti.com>
 <20200827065144.17683-2-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200827065144.17683-2-lokeshvutla@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12:21-20200827, Lokesh Vutla wrote:
> Convert TI K3 Board/SoC bindings to DT schema format.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  .../devicetree/bindings/arm/ti/k3.txt         | 26 ----------------
>  .../devicetree/bindings/arm/ti/k3.yaml        | 31 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 32 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/ti/k3.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/ti/k3.yaml


Thanks for doing this, but I have a problem with dbs_check and dtbs
W=2 build warnings on existing dts files that this exposes further..
Do you mind pulling this patch out of this j7200 series ? I would
rather us cleanup the warnings a bit as well, and deal with yaml
conversion seperate from j7200 bindings?

We will need Rob's ack anyways, I would rather we look at things
independently.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
