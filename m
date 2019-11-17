Return-Path: <SRS0=biny=ZJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BF5C33C9E
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 12:46:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 484AC20727
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 12:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfKQMqO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:46:14 -0500
Received: from inva021.nxp.com ([92.121.34.21]:41550 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726059AbfKQMqO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 17 Nov 2019 07:46:14 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 04A28200712;
        Sun, 17 Nov 2019 13:46:13 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 860BA20012E;
        Sun, 17 Nov 2019 13:46:07 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 89FD44029F;
        Sun, 17 Nov 2019 20:46:00 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH RESEND v3 09/15] arm64: dts: imx8qm: add lsio ss support
Date:   Sun, 17 Nov 2019 20:43:49 +0800
Message-Id: <1573994635-14479-10-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573994635-14479-1-git-send-email-aisheng.dong@nxp.com>
References: <1573994635-14479-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The LSIO SS of MX8QM is exactly the same as MX8QXP. So we can fully
reuse the exist LSIO SS dtsi. Add <soc>-ss-lsio.dtsi with compatible
string updated according to imx8-ss-lsio.dtsi.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v2->v3:
 * no changes
v1->v2:
 * change to the new two cell scu clk binding
---
 .../boot/dts/freescale/imx8qm-ss-lsio.dtsi    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
new file mode 100644
index 000000000000..6fe390641010
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2019 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+&lsio_gpio0 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio1 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio2 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio3 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio4 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio5 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio6 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio7 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_mu0 {
+	compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+};
+
+&lsio_mu1 {
+	compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+};
+
+&lsio_mu2 {
+	compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+};
+
+&lsio_mu3 {
+	compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+};
+
+&lsio_mu4 {
+	compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+};
+
+&lsio_mu13 {
+	compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+};
-- 
2.23.0

