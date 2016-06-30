From: Kieran Bingham <kieran@ksquared.org.uk>
Subject: [PATCH v2 1/3] dt-bindings: Update Renesas R-Car FCP DT binding
Date: Thu, 30 Jun 2016 17:50:28 +0100
Message-ID: <1467305430-25660-2-git-send-email-kieran@bingham.xyz>
References: <1467305430-25660-1-git-send-email-kieran@bingham.xyz>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1467305430-25660-1-git-send-email-kieran@bingham.xyz>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kieran@ksquared.org.uk
List-Id: devicetree@vger.kernel.org

The FCP driver can also support the FCPF variant for FDP1 compatible
processing.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
---
 Documentation/devicetree/bindings/media/renesas,fcp.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
index 6a12960609d8..271dcfdb5a76 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
@@ -7,12 +7,14 @@ conversion of AXI transactions in order to reduce the memory bandwidth.
 
 There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and FCP
 for FDP (FCPF). Their configuration and behaviour depend on the module they
-are paired with. These DT bindings currently support the FCPV only.
+are paired with. These DT bindings currently support the FCPV and FCPF.
 
  - compatible: Must be one or more of the following
 
    - "renesas,r8a7795-fcpv" for R8A7795 (R-Car H3) compatible 'FCP for VSP'
+   - "renesas,r8a7795-fcpf" for R8A7795 (R-Car H3) compatible 'FCP for FDP'
    - "renesas,fcpv" for generic compatible 'FCP for VSP'
+   - "renesas,fcpf" for generic compatible 'FCP for FDP'
 
    When compatible with the generic version, nodes must list the
    SoC-specific version corresponding to the platform first, followed by the
-- 
2.7.4
