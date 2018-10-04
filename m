Return-Path: <SRS0=HwKz=MQ=ragnatech.se=niklas.soderlund@kernel.org>
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH v2 1/5] dt-bindings: adv748x: make data-lanes property mandatory for CSI-2 endpoints
Date: Thu,  4 Oct 2018 22:41:34 +0200
Message-Id: <20181004204138.2784-2-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181004204138.2784-1-niklas.soderlund@ragnatech.se>
References: <20181004204138.2784-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The CSI-2 transmitters can use a different number of lanes to transmit
data. Make the data-lanes mandatory for the endpoints describe the
transmitters as no good default can be set to fallback on.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/i2c/adv748x.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
index 5dddc95f9cc46084..f9dac01ab795fc28 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
+++ b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
@@ -50,6 +50,9 @@ are numbered as follows.
 
 The digital output port nodes must contain at least one endpoint.
 
+The endpoints described in TXA and TXB ports must if present contain
+the data-lanes property as described in video-interfaces.txt.
+
 Ports are optional if they are not connected to anything at the hardware level.
 
 Example:
-- 
2.19.0
