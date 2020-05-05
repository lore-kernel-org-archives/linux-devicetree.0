Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6871C4725A
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 16:52:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9727D207DD
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 16:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730155AbgEEQwb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 12:52:31 -0400
Received: from foss.arm.com ([217.140.110.172]:45416 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730069AbgEEQwa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 May 2020 12:52:30 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14D8531B;
        Tue,  5 May 2020 09:52:30 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA8E83F305;
        Tue,  5 May 2020 09:52:28 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 00/16] dts/dt-bindings: Fix Arm Ltd. ARMv8 "boards"
Date:   Tue,  5 May 2020 17:51:59 +0100
Message-Id: <20200505165212.76466-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505165212.76466-1-andre.przywara@arm.com>
References: <20200505165212.76466-1-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Date: Mon, 4 May 2020 12:43:18 +0100
Subject: [PATCH 03/16] dt-bindings: ehci/ohci: Allow iommus property

A OHCI/EHCI controller could be behind an IOMMU, in which case an iommus
property assigns the stream ID for this device.

Allow that property in the DT bindings to fix a complaint about the Arm Juno
board's DTS file.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 10edd05872ea..20664c28bfb2 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -74,6 +74,9 @@ properties:
   phy-names:
     const: usb
 
+  iommus:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index bcffec1f1341..ff6c04cde695 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -73,6 +73,9 @@ properties:
   phy-names:
     const: usb
 
+  iommus:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.17.1

