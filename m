Return-Path: <SRS0=opqW=PX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33626 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727410AbfAOMKs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 15 Jan 2019 07:10:48 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so2735007wrr.0
        for <devicetree@vger.kernel.org>; Tue, 15 Jan 2019 04:10:46 -0800 (PST)
From: Vladimir Vid <vladimir.vid@sartura.hr>
Subject: [PATCH v2 2/2] dt-bindings: add Methode Electronics vendor prefix
Date: Tue, 15 Jan 2019 13:11:15 +0100
Message-Id: <20190115121113.5636-2-vladimir.vid@sartura.hr>
In-Reply-To: <20190111172055.30451-1-vladimir.vid@sartura.hr>
References: <20190111172055.30451-1-vladimir.vid@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Vladimir Vid <vladimir.vid@sartura.hr>, Andrew Lunn <andrew@lunn.ch>
List-ID: <devicetree@vger.kernel.org>

Methode Electronics, Inc. is an international
engineering company headquartered in Chicago, IL.

Signed-off-by: Vladimir Vid <vladimir.vid@sartura.hr>
Cc: Andrew Lunn <andrew@lunn.ch>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389508584f48..cfd4413f2723 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -237,6 +237,7 @@ melfas	MELFAS Inc.
 mellanox	Mellanox Technologies
 memsic	MEMSIC Inc.
 merrii	Merrii Technology Co., Ltd.
+methode Methode Electronics, Inc.
 micrel	Micrel Inc.
 microchip	Microchip Technology Inc.
 microcrystal	Micro Crystal AG
-- 
2.19.0
