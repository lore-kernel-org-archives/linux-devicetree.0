From: Rich Felker <dalias@libc.org>
Subject: [PATCH v3 01/12] of: add vendor prefix for J-Core
Date: Wed, 25 May 2016 05:43:02 +0000
Message-ID: <b6d33800300bde8f1d9a7b88a715d741548fad4a.1464148904.git.dalias@libc.org>
References: <cover.1464148904.git.dalias@libc.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1464148904.git.dalias@libc.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

The J-Core project (j-core.org) produces open source cpu and SoC
peripheral cores synthesizable as FPGA bitstreams or ASICs.

Signed-off-by: Rich Felker <dalias@libc.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 86740d4..9c070b8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -126,6 +126,7 @@ invensense	InvenSense Inc.
 isee	ISEE 2007 S.L.
 isil	Intersil
 issi	Integrated Silicon Solutions Inc.
+jcore	J-Core.org
 jedec	JEDEC Solid State Technology Association
 karo	Ka-Ro electronics GmbH
 keymile	Keymile GmbH
-- 
2.8.1
