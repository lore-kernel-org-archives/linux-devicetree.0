From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: Add vendor prefix for HopeRun
Date: Wed, 15 May 2019 12:44:56 +0100
Message-ID: <1557920697-18057-2-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1557920697-18057-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557920697-18057-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Thierry Reding <treding@nvidia.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-Id: devicetree@vger.kernel.org

Add "Jiangsu HopeRun Software Co., Ltd." to the list of devicetree
vendor prefixes as "hoperun".

Website: http://www.hoperun.com/en

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index e9034a6..dc492f0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -177,6 +177,7 @@ hit	Hitachi Ltd.
 hitex	Hitex Development Tools
 holt	Holt Integrated Circuits, Inc.
 honeywell	Honeywell
+hoperun	Jiangsu HopeRun Software Co., Ltd.
 hp	Hewlett Packard
 holtek	Holtek Semiconductor, Inc.
 hwacom	HwaCom Systems Inc.
-- 
2.7.4
