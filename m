Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DEBC433E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 00:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44A2D207DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 00:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TWpMnmSh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgH1Al4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 20:41:56 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57148 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgH1Al4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 20:41:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07S0frdE103398;
        Thu, 27 Aug 2020 19:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598575313;
        bh=9zOnZD9Me7ZIn9EEvZT/yq42uu4kaMLSD/XhOwSfKks=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=TWpMnmShJ0FxKT4wAlaj4yC85+StvETf9a8Wz1Tclvq7uE6LeUth9UHg+LE7C6Vtj
         ZmmLFL99/DXDx5HC+p6zv39pL5aUD1O050tE4RfQX6RSpHRHcAjs3Zalhvs49BDmzF
         13nuanKSGXt4+nbjzSzsOE+HBxCQEIJtpRdUF1MA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07S0frLi104243
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Aug 2020 19:41:53 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 19:41:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 19:41:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07S0frKh102686;
        Thu, 27 Aug 2020 19:41:53 -0500
Date:   Thu, 27 Aug 2020 19:41:53 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>
CC:     Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/8] Add C66x & C71x DSP nodes on J721E SoCs
Message-ID: <20200828004153.coon5q6u6uv4znqi@akan>
References: <20200825172145.13186-1-s-anna@ti.com>
 <1fc9eb3f-d56c-5d3e-ecf7-f30711051995@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1fc9eb3f-d56c-5d3e-ecf7-f30711051995@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 10:28-20200827, Lokesh Vutla wrote:
> 
> 
> On 25/08/20 10:51 pm, Suman Anna wrote:
> > Hi Nishanth,
> > 
> > The following is a revised version of the series [1] that adds the base
> > dt nodes for the 2 C66x and 1 C71x DSP remote processors present in MAIN
> > domain on J721E SoCs, and the required nodes to boot these successfully
> > on J721E EVM board. It addresses the cleanup comments from you.
> > 
[..]
> 
> FWIW, Series
> Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks. I have applied this series to my staging branch for now. Once
rc3 makes in with the irq chip changes, I will rebase and push to
next.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
