Return-Path: <SRS0=Xnq8=HX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41569 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751262AbeEDNFh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 4 May 2018 09:05:37 -0400
From: Bastian Stender <bst@pengutronix.de>
Subject: [PATCH v2 2/3] i2c: Documentation: i2c-topology: i2c-mux-pca954x can be mux-locked via dt
Date: Fri,  4 May 2018 15:04:48 +0200
Message-Id: <20180504130449.13730-2-bst@pengutronix.de>
In-Reply-To: <20180504130449.13730-1-bst@pengutronix.de>
References: <20180504130449.13730-1-bst@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Michael Lawnick <ml.lawnick@gmx.de>, kernel@pengutronix.de, Bastian Stender <bst@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Bastian Stender <bst@pengutronix.de>
---
 Documentation/i2c/i2c-topology | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/i2c/i2c-topology b/Documentation/i2c/i2c-topology
index f74d78b53d4d..165af7898e50 100644
--- a/Documentation/i2c/i2c-topology
+++ b/Documentation/i2c/i2c-topology
@@ -47,7 +47,8 @@ i2c-mux-gpmux             Normally parent-locked, mux-locked iff
 i2c-mux-ltc4306           Mux-locked
 i2c-mux-mlxcpld           Parent-locked
 i2c-mux-pca9541           Parent-locked
-i2c-mux-pca954x           Parent-locked
+i2c-mux-pca954x           Normally parent-locked, mux-locked iff
+                          specified in device-tree.
 i2c-mux-pinctrl           Normally parent-locked, mux-locked iff
                           all involved pinctrl devices are controlled
                           by the same i2c root adapter that they mux.
-- 
2.17.0

