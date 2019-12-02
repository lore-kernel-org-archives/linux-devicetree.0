Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6205C432C3
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 23:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B891820684
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 23:31:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FHbq7/qo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfLBXbu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 18:31:50 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:38843 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfLBXbu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 18:31:50 -0500
Received: by mail-wm1-f43.google.com with SMTP id p17so1447639wmi.3
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 15:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xWcs6YBFvK3VWP3N+z+8H4QcT8nQTNi3hW2Yzv1rJdI=;
        b=FHbq7/qo14idRh4Ycz3BnsTzhOXiVAEwxYErTdKgCSDH61utWT62Z7CfuhzZnQdL+B
         pxz030T16txh09dKbYYBucqWounpt7XrZXahIEa5f9HVvtWfiA30+WXyFp8rGY3MSKXG
         uAbONxC7GcKnHmhyp/SFHpGKIEZYln3HNhz3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xWcs6YBFvK3VWP3N+z+8H4QcT8nQTNi3hW2Yzv1rJdI=;
        b=jlyGFlTv362c7j0rmVoub1el7+Po4yPLD1OEYUdFma5o3GoX6FT9k/E/N/ye8UUIer
         uPccFUR7EBGM/dx98TCHYO0X7ZDnFnPuoOcW/Big++aznhJFTwNLr3jfjbhUjeqF7+qr
         f5b/gOxlg9e5Sg3desFExsUeOACJWqEGM6WHqjys2GIXoBallojeA8xCsH+aLrOV9hYz
         4w5c9KWn9xNKbKh+YU+4RQKYomtylLnxP5NfDg58maWyQvihmQaksr7SMm+5E/2l6IQP
         vDpXV6rOW9KBBkMoDNCb2/yjPXKzF8E0IKXZ0NteKn2bGF6hE4N3qbnRWa4jv+3Ko+A6
         rvXg==
X-Gm-Message-State: APjAAAVKsY2UBIrLu63PHo4AJNA6YdRfCu7YZ/hA+tZIvWG10kLnBFeX
        NTLMG5n5EwviweyLnCFVbhte8w==
X-Google-Smtp-Source: APXvYqxmaGXdgBpgNe29YrOm+siaQQufajyUm4E1xiLmmCBSR0ydUEMysFw8OjRat34k1cVFfuznvQ==
X-Received: by 2002:a7b:cf39:: with SMTP id m25mr4427262wmg.146.1575329508184;
        Mon, 02 Dec 2019 15:31:48 -0800 (PST)
Received: from rj-aorus.ric.broadcom.com ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id c72sm1066197wmd.11.2019.12.02.15.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 15:31:47 -0800 (PST)
From:   Ray Jui <ray.jui@broadcom.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH 1/2] dt-bindings: soc: Add binding doc for iProc IDM device
Date:   Mon,  2 Dec 2019 15:31:26 -0800
Message-Id: <20191202233127.31160-2-ray.jui@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202233127.31160-1-ray.jui@broadcom.com>
References: <20191202233127.31160-1-ray.jui@broadcom.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add binding document for iProc based IDM devices.

Signed-off-by: Ray Jui <ray.jui@broadcom.com>
---
 .../bindings/soc/bcm/brcm,iproc-idm.txt       | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,iproc-idm.txt

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,iproc-idm.txt b/Documentation/devicetree/bindings/soc/bcm/brcm,iproc-idm.txt
new file mode 100644
index 000000000000..388c6b036d7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,iproc-idm.txt
@@ -0,0 +1,44 @@
+Broadcom iProc Interconnect Device Management (IDM) device
+
+The Broadcom iProc IDM device allows control and monitoring of ASIC internal
+bus transactions. Most importantly, it can be configured to detect bus
+transaction timeout. In such case, critical information such as transaction
+address that caused the error, bus master ID of the transaction that caused
+the error, and etc., are made available from the IDM device.
+
+-------------------------------------------------------------------------------
+
+Required properties for IDM device node:
+- compatible: must be "brcm,iproc-idm"
+- reg: base address and length of the IDM register space
+- interrupt: IDM interrupt number
+- brcm,iproc-idm-bus: IDM bus string
+
+Optional properties for IDM device node:
+- brcm,iproc-idm-elog: phandle to the device node of the IDM logging device
+
+-------------------------------------------------------------------------------
+
+Required properties for IDM error logging device node:
+- compatible: must be "brcm,iproc-idm-elog";
+- reg: base address and length of reserved memory location where IDM error
+  events can be saved
+
+-------------------------------------------------------------------------------
+
+Example:
+
+idm {
+	idm-elog {
+		compatible = "brcm,iproc-idm-elog";
+		reg = <0x8f221000 0x1000>;
+	};
+
+	idm-mhb-paxc-axi {
+		compatible = "brcm,iproc-idm";
+		reg = <0x60406900 0x200>;
+		interrupt = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
+		brcm,iproc-idm-bus = "idm-mhb-paxc-axi";
+		brcm,iproc-idm-elog = <&idm-elog>;
+	};
+};
-- 
2.17.1

