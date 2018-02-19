Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34827 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932190AbeBSXEa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 18:04:30 -0500
Received: by mail-pg0-f66.google.com with SMTP id l131so6423377pga.2
        for <devicetree@vger.kernel.org>; Mon, 19 Feb 2018 15:04:29 -0800 (PST)
From: Moritz Fischer <mdf@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: power: reset: gpio-poweroff: Add 'timeout_ms' property
Date: Mon, 19 Feb 2018 14:59:17 -0800
Message-Id: <20180219225918.2311-1-mdf@kernel.org>
Sender: devicetree-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, sre@kernel.org, Moritz Fischer <mdf@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Add 'timeout_ms' property to support boards where the 3s timeout that the
current driver defaults to is too short.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
---

Changes from v1:
- Addressed Rob's feedback (timeout -> timeout_ms)
- Added to old example rather than creating separate one

---
 Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt b/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt
index e62d53d844cc..3f557b344dc4 100644
--- a/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt
+++ b/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt
@@ -27,10 +27,13 @@ Optional properties:
   it to an output when the power-off handler is called. If this optional
   property is not specified, the GPIO is initialized as an output in its
   inactive state.
+- timeout_ms: Time to wait before asserting a WARN_ON(1). If nothing is
+              specified, 3000 ms is used.
 
 Examples:
 
 gpio-poweroff {
 	compatible = "gpio-poweroff";
 	gpios = <&gpio 4 0>;
+	timeout_ms = <3000>;
 };
-- 
2.16.1

