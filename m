Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr690065.outbound.protection.outlook.com ([40.107.69.65]:19136
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S964953AbeF0MYR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Jun 2018 08:24:17 -0400
From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 4/4] Documentation: uartlite: Add clock to the binding
Date: Wed, 27 Jun 2018 17:53:45 +0530
Message-ID: <1530102225-6459-4-git-send-email-shubhrajyoti.datta@xilinx.com>
In-Reply-To: <1530102225-6459-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1530102225-6459-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, shubhrajyoti.datta@gmail.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

Add clock to the binding

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt=
 b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
index df8aba0..7ae9008 100644
--- a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
+++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
@@ -13,6 +13,8 @@ Required properties:

 Optional properties:
 - port-number          : Set Uart port number
+- clock-names          : Should be "s_axi_aclk"
+- clocks               : Input clock specifier. Refer to common clock bind=
ings.

 Example:
 serial@800C0000 {
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
