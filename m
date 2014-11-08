From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 06/10] of: v4l: Document link-frequency property in video-interfaces.txt
Date: Sun,  9 Nov 2014 01:09:27 +0200
Message-ID: <1415488171-27636-7-git-send-email-sakari.ailus@iki.fi>
References: <1415488171-27636-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1415488171-27636-1-git-send-email-sakari.ailus@iki.fi>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

link-frequency is a 64-bit unsigned integer array of allowed link
frequencies.

Signed-off-by: Sakari Ailus <sakari.ailus@iki.fi>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/media/video-interfaces.txt |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index ce719f8..7d8f07f 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -103,6 +103,9 @@ Optional endpoint properties
   array contains only one entry.
 - clock-noncontinuous: a boolean property to allow MIPI CSI-2 non-continuous
   clock mode.
+- link-frequency: Allowed data bus frequencies. For MIPI CSI-2, for
+  instance, this is the actual frequency of the bus, not bits per clock per
+  lane value. An array of 64-bit unsigned integers.
 
 
 Example
-- 
1.7.10.4
