Return-Path: <SRS0=UGtl=TD=pengutronix.de=mtr@kernel.org>
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v5 3/5] media: dt-bindings: media: Add vendor prefix for allegro
Date: Fri,  3 May 2019 14:20:08 +0200
Message-Id: <20190503122010.16663-4-m.tretter@pengutronix.de>
In-Reply-To: <20190503122010.16663-1-m.tretter@pengutronix.de>
References: <20190503122010.16663-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl, Michael Tretter <m.tretter@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Add vendor prefix for Allegro DVT, a provider of H.264/AVC, H.265/HEVC,
AVS2, VP9 and AV1 compliance test suites and H.264/AVC, H.265/HEVC, and
VP9 encoder, codec and decoder hardware (RTL) IPs.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v5:
- new patch
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8162b0eb4b50..78a849b25f64 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -16,6 +16,7 @@ adi	Analog Devices, Inc.
 advantech	Advantech Corporation
 aeroflexgaisler	Aeroflex Gaisler AB
 al	Annapurna Labs
+allegro	Allegro DVT
 allo	Allo.com
 allwinner	Allwinner Technology Co., Ltd.
 alphascale	AlphaScale Integrated Circuits Systems, Inc.
-- 
2.20.1
