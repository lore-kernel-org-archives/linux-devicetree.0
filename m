Return-Path: <SRS0=ySGx=QB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38915 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbfAYOwG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Jan 2019 09:52:06 -0500
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] dt-bindings: firmware: tegra186-bpmp: Remove name property
Date: Fri, 25 Jan 2019 15:52:02 +0100
Message-Id: <20190125145202.2982-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

This property is not used by device trees and was likely supposed to be
a hint as to what the BPMP node should be named, rather than describing
a property of the BPMP node.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
index 0c10802c8327..ff380dadb5f9 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
@@ -8,7 +8,6 @@ which can create the interprocessor communication (IPC) between the CPU
 and BPMP.
 
 Required properties:
-- name : Should be bpmp
 - compatible
     Array of strings
     One of:
-- 
2.19.1
