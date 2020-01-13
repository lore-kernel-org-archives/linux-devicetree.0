Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F9AC33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:01:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D1B721556
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M3hZ27ZK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728918AbgAMWBh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:01:37 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54414 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728769AbgAMWBg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 17:01:36 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DM1R0f008048;
        Mon, 13 Jan 2020 16:01:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578952887;
        bh=eNTijv2UyQtC4PHses4FMl4R64oQ2eQ2tdB3G59Jlrg=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=M3hZ27ZK6rbnIYIRaTE6CNJ8KGOM6mQBznzzXtX9s2Yaa02QinPQU4xr4AaLXLXmp
         u395ZFC3UqQ1JaV3/Ulxkk6N+PxeEMwi8gKDY1HDvxzuNRXtGBKbXx93H+2vY9GU0S
         3Qka3rp2mA/TiBf0w2rehydvebpZhjlrsjMFe/9M=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DM1Rm1055723
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jan 2020 16:01:27 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 16:01:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 16:01:26 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 00DM1Q4B011935;
        Mon, 13 Jan 2020 16:01:26 -0600
Date:   Mon, 13 Jan 2020 16:05:12 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Jyri Sarha <jsarha@ti.com>
CC:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <praneeth@ti.com>, <yamonkar@cadence.com>,
        <sjakhade@cadence.com>, <sam@ravnborg.org>, <robh+dt@kernel.org>,
        <maxime@cerno.tech>
Subject: Re: [PATCH v5 3/5] dt-bindings: display: ti,j721e-dss: Add dt-schema
 yaml binding
Message-ID: <20200113220512.5xqikwseah2rylwj@ti.com>
References: <cover.1576857145.git.jsarha@ti.com>
 <e05570c9c5c0a22f5aaa36dd2503fe918b1f941e.1576857145.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e05570c9c5c0a22f5aaa36dd2503fe918b1f941e.1576857145.git.jsarha@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Jyri Sarha <jsarha@ti.com> wrote on Fri [2019-Dec-20 17:55:11 +0200]:
> Add dt-schema yaml bindig for J721E DSS, J721E version TI Keystone
> Display SubSystem.
> 
> Version history:
> 
> v2: no change
> 
> v3: - reg-names: "wp" -> "wb"
>     - Add ports node
>     - Add includes to dts example
>     - reindent dts example
> 
> v4: - Add descriptions to reg, clocks, and interrups properties
>     - Remove minItems when its value is the same as maxItems value
> 
> v5: - itemize reg, clocks and interrupts properties' descriptions
>     - there is no "vp" reg-name, only "wb" for write back
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>
