From: Olivier Moysan <olivier.moysan@st.com>
Subject: [PATCH 2/3] dt-bindings: display: sii902x: Change audio mclk binding
Date: Tue, 2 Jul 2019 17:47:05 +0200
Message-ID: <1562082426-14876-3-git-send-email-olivier.moysan@st.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: a.hajda@samsung.com, narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, benjamin.gaignard@st.com, alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, olivier.moysan@st.com, jsarha@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

As stated in SiL9022/24 datasheet, master clock is not required for I2S.
Make mclk property optional in DT bindings.

Fixes: 3f18021f43a3 ("dt-bindings: display: sii902x: Add HDMI audio bindings")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 Documentation/devicetree/bindings/display/bridge/sii902x.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/sii902x.txt b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
index 2df44b7d3821..6e14e087c0d0 100644
--- a/Documentation/devicetree/bindings/display/bridge/sii902x.txt
+++ b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
@@ -26,9 +26,8 @@ Optional properties:
 	- clocks: phandle and clock specifier for each clock listed in
            the clock-names property
 	- clock-names: "mclk"
-	   Describes SII902x MCLK input. MCLK is used to produce
-	   HDMI audio CTS values. This property is required if
-	   "#sound-dai-cells"-property is present. This property follows
+	   Describes SII902x MCLK input. MCLK can be used to produce
+	   HDMI audio CTS values. This property follows
 	   Documentation/devicetree/bindings/clock/clock-bindings.txt
 	   consumer binding.
 
-- 
2.7.4
