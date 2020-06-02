Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52609C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 16:41:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 179DB206C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 16:41:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jkD8x6Hb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgFBQlB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 12:41:01 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:58954 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgFBQlB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 12:41:01 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 052Gf0FQ067956;
        Tue, 2 Jun 2020 11:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591116060;
        bh=+mTnfIsJYZQRfBUfB9T1W2u4RkDrLmVcrlSfgciDLpU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jkD8x6HbXKpuzp5sMgsX3BKuoS2oFxX0M41lMHrkxeoQ/ke6K6UZTze2havm+0aB2
         PfvHd3TUi16EgTjV4jYqozuZ4ViBUXxRqHf0r5RN3d4BKfae4rRcFLJXC01oB/04/G
         D2J3wWtsL/RYiu2QBEvogAEiV3Vw2TacsDAJ/cCQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 052Gf0tq125568;
        Tue, 2 Jun 2020 11:41:00 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Jun
 2020 11:40:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Jun 2020 11:40:59 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 052Gexff089020;
        Tue, 2 Jun 2020 11:40:59 -0500
Subject: Re: [PATCH] dt-bindings: property-units: Add picoseconds type
To:     <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>
References: <20200602163900.2556-1-dmurphy@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <d804e10a-3823-9ab7-583f-709bc3d5ea5b@ti.com>
Date:   Tue, 2 Jun 2020 11:40:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602163900.2556-1-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Rob

On 6/2/20 11:39 AM, Dan Murphy wrote:
> Add the '-ps' picosecond unit suffix for property names.
>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   Documentation/devicetree/bindings/property-units.txt | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/property-units.txt b/Documentation/devicetree/bindings/property-units.txt
> index e9b8360b3288..00094070bdac 100644
> --- a/Documentation/devicetree/bindings/property-units.txt
> +++ b/Documentation/devicetree/bindings/property-units.txt
> @@ -17,6 +17,7 @@ Time/Frequency
>   -ms		: millisecond
>   -us		: microsecond
>   -ns		: nanosecond
> +-ps		: picosecond
>   
>   Distance
>   ----------------------------------------

Need to resend I missed the linux-kernel on the maintainers.

Dan

