Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66213C33C8C
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 12:12:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FCFC2087F
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 12:12:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=intenta.de header.i=@intenta.de header.b="MqcIzY3K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbgAGMMB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 07:12:01 -0500
Received: from mail.intenta.de ([178.249.25.132]:31252 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726937AbgAGMMB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 7 Jan 2020 07:12:01 -0500
X-Greylist: delayed 344 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Jan 2020 07:12:01 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=Content-Type:MIME-Version:Message-ID:Subject:CC:To:From:Date; bh=yu3PLm+8T3Mx/VSxTyUUuChYt5tKi+SrAfDxJHZn6Zo=;
        b=MqcIzY3KOEIcIueRfXgZuSsZ5LLhY6fyWzgX+YreRLWPeOi0E4hmRug0NktpzfTpRnxpfo5Y0ksOijsyUEm8bEF9ncyMtjmaSkjqjw826kXhGo0SLz3KYhT/txBro+UZN/PFXrNL139CmLSalD9qXLBrLzL8OaKBub5JWKoeTfYLziiOAC5ZnCPWSDKxItml7qYJoURE7TXmpLPHDtot/UDL5W3d2kuuXB/abAkS+M37QU2bZYLGnxfkfhNCV0qOlz6UMYDRxyqfJ5BZLUrXEY4mAEuJBKnno+2ulK+GAfTJHPSKcunZg2m2lU1IovnpzhzA3940Q+4u026Ppc4zrw==;
Date:   Tue, 7 Jan 2020 13:06:15 +0100
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] dt-bindings: mfd: da9062 can be a system power controller
Message-ID: <20200107120613.GA746@laureti-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The DA9062 can be used to power off a system if it is appropriately
wired.

Signed-off-by: Helmut Grohne <helmut.grohne@intenta.de>
---
 Documentation/devicetree/bindings/mfd/da9062.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index bc4b59de6a55..4b53a5b7147a 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -38,6 +38,10 @@ Required properties:
 See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt for
 further information on IRQ bindings.
 
+Optional properties:
+
+- system-power-controller
+
 Sub-nodes:
 
 - regulators : This node defines the settings for the LDOs and BUCKs.
-- 
2.20.1

