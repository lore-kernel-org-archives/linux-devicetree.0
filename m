Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7D1C33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:01:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3E2D2072B
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bW3dF+qJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728920AbgAMWBQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:01:16 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49384 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbgAMWBQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 17:01:16 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DM118W053727;
        Mon, 13 Jan 2020 16:01:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578952861;
        bh=1fwXPsSu3lc6TUM7K7k4xvKPEijcTV9ffOBOPjAr8W0=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=bW3dF+qJTioEB0qrxH31c1dAJCaszrVRvl5Vywrcj4t9WXD3ixWlBGdv8ywE0Kpvn
         OYumHaT/LDkFsAx8UGUVn5ZeD7c8jLHkA4Sk/QAY/Z8mKkclBBa9S6WSohvWEEqlAG
         cwJDzym7e4fpUVK/DhUBAzUyF3eFjx7DO95spkOo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DM11Mk084353
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jan 2020 16:01:01 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 16:01:01 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 16:01:01 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 00DM11Xj010978;
        Mon, 13 Jan 2020 16:01:01 -0600
Date:   Mon, 13 Jan 2020 16:04:47 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Jyri Sarha <jsarha@ti.com>
CC:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <praneeth@ti.com>, <yamonkar@cadence.com>,
        <sjakhade@cadence.com>, <sam@ravnborg.org>, <robh+dt@kernel.org>,
        <maxime@cerno.tech>
Subject: Re: [PATCH v5 2/5] dt-bindings: display: ti,am65x-dss: Add dt-schema
 yaml binding
Message-ID: <20200113220447.4y5smxqba7zw5v2a@ti.com>
References: <cover.1576857145.git.jsarha@ti.com>
 <1007a467492c2a588d4348106313a9f4853f3f20.1576857145.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1007a467492c2a588d4348106313a9f4853f3f20.1576857145.git.jsarha@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Jyri Sarha <jsarha@ti.com> wrote on Fri [2019-Dec-20 17:55:10 +0200]:
> Add dt-schema yaml bindig for AM65x DSS, AM65x version TI Keystone
> Display SubSystem.
> 
> Version history:
> 
> v2: no change
> 
> v3: - Add ports node
>     - use allOf in ti,am65x-oldi-io-ctrl to add both $ref and maxItems
>     - Add includes to dts example
>     - reindent dts example
> 
> v4: - Add descriptions to reg and clocks properties
>     - Remove minItems when its value is the same as maxItems value
> 
> v5: - itemize reg and clocks properties' descriptions
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

