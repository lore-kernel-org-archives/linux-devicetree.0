Return-Path: <SRS0=v28C=OU=gmail.com=thierry.reding@kernel.org>
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: media: tegra-cec: Document Tegra186 and Tegra194
Date: Tue, 11 Dec 2018 10:48:39 +0100
Message-Id: <20181211094841.16027-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

The Tegra186 and Tegra194 contain a CEC controller that is identical to
that found in earlier generations. Document the compatible strings for
these newer chips.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- new patch adding missing compatible strings

 Documentation/devicetree/bindings/media/tegra-cec.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/tegra-cec.txt b/Documentation/devicetree/bindings/media/tegra-cec.txt
index c503f06f3b84..da3590f0b7a1 100644
--- a/Documentation/devicetree/bindings/media/tegra-cec.txt
+++ b/Documentation/devicetree/bindings/media/tegra-cec.txt
@@ -8,6 +8,8 @@ Required properties:
 	"nvidia,tegra114-cec"
 	"nvidia,tegra124-cec"
 	"nvidia,tegra210-cec"
+	"nvidia,tegra186-cec"
+	"nvidia,tegra194-cec"
   - reg : Physical base address of the IP registers and length of memory
 	  mapped region.
   - interrupts : HDMI CEC interrupt number to the CPU.
-- 
2.19.1
