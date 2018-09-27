Return-Path: <SRS0=zO/b=MJ=st.com=hugues.fruchet@kernel.org>
From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH 3/4] media: dt-bindings: media: Document pclk-max-frequency property
Date: Thu, 27 Sep 2018 16:46:06 +0200
Message-ID: <1538059567-8381-4-git-send-email-hugues.fruchet@st.com>
In-Reply-To: <1538059567-8381-1-git-send-email-hugues.fruchet@st.com>
References: <1538059567-8381-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Steve Longerbeam <slongerbeam@gmail.com>, Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil@xs4all.nl>, "Mauro Carvalho Chehab  <mchehab@kernel.org>, Rob Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Hugues Fruchet <hugues.fruchet@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Jacopo Mondi <jacopo@jmondi.org>
List-ID: <devicetree@vger.kernel.org>

This optional property aims to inform parallel video devices
of the maximum pixel clock frequency admissible by host video
interface. If bandwidth of data to be transferred requires a
pixel clock which is higher than this value, parallel video
device could then typically adapt framerate to reach
this constraint.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 Documentation/devicetree/bindings/media/video-interfaces.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index baf9d97..fa4c112 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -147,6 +147,8 @@ Optional endpoint properties
   as 0 (normal). This property is valid for serial busses only.
 - strobe: Whether the clock signal is used as clock (0) or strobe (1). Used
   with CCP2, for instance.
+- pclk-max-frequency: maximum pixel clock frequency admissible by video
+  host interface.
 
 Example
 -------
-- 
2.7.4
