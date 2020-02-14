Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840DEC3B18F
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 09:22:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59E85222C2
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 09:22:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XeDClSzX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbgBNJWl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 04:22:41 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54626 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727965AbgBNJWk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 04:22:40 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01E9MOs5113423;
        Fri, 14 Feb 2020 03:22:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581672144;
        bh=KA3DcS8FdpmaMcpdKbqJws8HhoUKSQQclgurVLEjBBw=;
        h=From:To:CC:Subject:Date;
        b=XeDClSzXDT1wWavxOdO4esH9o3DvZC8pKeqDuH9kjpTtulX0ESnS5qoTwInpC8Xhr
         RtFy4IK+rhfcq2Q3EUcaEgru+/xAx7fJo34foM6+svUrbcNoFHNcHe7ADXg5byt8qm
         seNZUOvw1WuEzCfozV6nqq8ShHJJP4fdC2lB+uvc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01E9MOhF026423
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 14 Feb 2020 03:22:24 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 14
 Feb 2020 03:22:24 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 14 Feb 2020 03:22:24 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01E9MJj6086345;
        Fri, 14 Feb 2020 03:22:19 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>, <praneeth@ti.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
Subject: [PATCH resend 0/2] dts: keystone-k2g-evm: Display support
Date:   Fri, 14 Feb 2020 11:22:13 +0200
Message-ID: <cover.1581671951.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Resend because the earlier recipient list was wrong. 

Now that drm/tidss is queued for mainline, lets add display support for
k2g-evm. There is no hurry since tidss is out only in v5.7, but it
should not harm to have the dts changes in place before that.

Jyri Sarha (2):
  ARM: dts: keystone-k2g: Add DSS node
  ARM: dts: keystone-k2g-evm: add HDMI video support

 arch/arm/boot/dts/keystone-k2g-evm.dts | 101 +++++++++++++++++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi    |  22 ++++++
 2 files changed, 123 insertions(+)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

