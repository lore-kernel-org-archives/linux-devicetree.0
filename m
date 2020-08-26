Return-Path: <SRS0=1b9y=CE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F96C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Aug 2020 23:46:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95FA420678
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Aug 2020 23:46:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NiLarTS2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbgHZXqU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Aug 2020 19:46:20 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59410 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbgHZXqT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Aug 2020 19:46:19 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07QNkD3e050387;
        Wed, 26 Aug 2020 18:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598485573;
        bh=F+2g5Ozlp3l1unQ0rk4kWOzBTE/QjR2LI3sor/mKej4=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=NiLarTS21SSF/PdrjNRv3xdMDyCwiCs00sgIQtTFeMbDaf8Bmf2UOc+TZC/uWZpNV
         2HZN0Bol2o70k61MuWRkC2q8KbZhcL+XvQY7J6HHgiaNkdbZs0rQeeew2egVSCr6Yq
         XUSIVcU6/J98ANMjohKO640b4hzFZ4LY1gVm2q8k=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07QNkD0I064497
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Aug 2020 18:46:13 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 26
 Aug 2020 18:46:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 26 Aug 2020 18:46:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07QNkCS4028546;
        Wed, 26 Aug 2020 18:46:12 -0500
Date:   Wed, 26 Aug 2020 18:46:12 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Suman Anna <s-anna@ti.com>
CC:     Tero Kristo <t-kristo@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/2] Fix TI K3 cbass interconnect node names
Message-ID: <20200826234611.4sgr7f34t4toazsi@akan>
References: <20200723211137.26641-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200723211137.26641-1-s-anna@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 16:11-20200723, Suman Anna wrote:
> Hi Tero, Nishanth,
> 
> Following are couple of minor fixes that fix the node names
> for the interconnect bus nodes on K3 AM65x and J721E SoCs. These
> fix the following warnings seen with dtbs_check on the K3 dtbs.
> 
> 'interconnect@100000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> 'interconnect@28380000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> 
> Lokesh has already used the correct name in his initial
> submission for J7200 SoCs.

Thank you. I have staged in the staging branch, once rc3 is available, I
will apply it there and you should be able to see this in -next tree.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
