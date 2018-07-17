Return-Path: <SRS0=P2HZ=KB=xs4all.nl=hverkuil@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 2/5] cec-ioc-dqevent.rst: document the new 5V events
Date: Tue, 17 Jul 2018 15:29:06 +0200
Message-Id: <20180717132909.92158-3-hverkuil@xs4all.nl>
In-Reply-To: <20180717132909.92158-1-hverkuil@xs4all.nl>
References: <20180717132909.92158-1-hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
List-ID: <devicetree@vger.kernel.org>

From: Hans Verkuil <hans.verkuil@cisco.com>

Document the two new 5V events.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 .../media/uapi/cec/cec-ioc-dqevent.rst         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/media/uapi/cec/cec-ioc-dqevent.rst b/Documentation/media/uapi/cec/cec-ioc-dqevent.rst
index b6fd86424fbb..8d5633e6ae04 100644
--- a/Documentation/media/uapi/cec/cec-ioc-dqevent.rst
+++ b/Documentation/media/uapi/cec/cec-ioc-dqevent.rst
@@ -179,6 +179,24 @@ it is guaranteed that the state did change in between the two events.
 	capability set. When open() is called, the HPD pin can be read and
 	if the HPD is high, then an initial event will be generated for that
 	filehandle.
+    * .. _`CEC-EVENT-PIN-5V-LOW`:
+
+      - ``CEC_EVENT_PIN_5V_LOW``
+      - 6
+      - Generated if the 5V pin goes from a high voltage to a low voltage.
+	Only applies to adapters that have the ``CEC_CAP_MONITOR_PIN``
+	capability set. When open() is called, the 5V pin can be read and
+	if the 5V is low, then an initial event will be generated for that
+	filehandle.
+    * .. _`CEC-EVENT-PIN-5V-HIGH`:
+
+      - ``CEC_EVENT_PIN_5V_HIGH``
+      - 7
+      - Generated if the 5V pin goes from a low voltage to a high voltage.
+	Only applies to adapters that have the ``CEC_CAP_MONITOR_PIN``
+	capability set. When open() is called, the 5V pin can be read and
+	if the 5V is high, then an initial event will be generated for that
+	filehandle.
 
 
 .. tabularcolumns:: |p{6.0cm}|p{0.6cm}|p{10.9cm}|
-- 
2.18.0
