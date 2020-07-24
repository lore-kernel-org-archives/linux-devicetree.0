Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7080AC433E3
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 03:33:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C96420709
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 03:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="On4okG88"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgGXDdZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 23:33:25 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50062 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbgGXDdZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 23:33:25 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06O3XLU1066510;
        Thu, 23 Jul 2020 22:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595561601;
        bh=F2fnxcpYyG6Y47IBGoLmem+GlrKezAOhZXxPkQzktkc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=On4okG88TjXJlasg0A+zCkvwG5s0iJyANyYtKOMs1hCMQODu1XJG2303i6qD2he8Z
         9pGofM601hRuMctwUx4KUVJj2KikWWcVRHOheOcj7u6+rwNCsTLXsmGdNNs8nbvqTu
         iRVNe5tTzGOmYbebVj7gVpisei1eNb3kdJc9xuH4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06O3XLR4046322
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 Jul 2020 22:33:21 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 23
 Jul 2020 22:33:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 23 Jul 2020 22:33:21 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06O3XIHp095786;
        Thu, 23 Jul 2020 22:33:19 -0500
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am65: Fix interconnect node names
To:     Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Nishanth Menon <nm@ti.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200723211137.26641-1-s-anna@ti.com>
 <20200723211137.26641-2-s-anna@ti.com>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <8bc7a153-0e7e-2a66-95d6-7aa0dfa20e4b@ti.com>
Date:   Fri, 24 Jul 2020 09:03:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200723211137.26641-2-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 24/07/20 2:41 am, Suman Anna wrote:
> The various CBASS interconnect nodes on K3 AM65x SoCs are defined
> using the node name "interconnect". This is not a valid node name
> as per the dt-schema. Fix these node names to use the standard name
> used for SoC interconnects, "bus".
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>

Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks and regards,
Lokesh

