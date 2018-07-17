Return-Path: <SRS0=P2HZ=KB=xs4all.nl=hverkuil@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 3/5] uapi/linux/cec.h: add 5V events
Date: Tue, 17 Jul 2018 15:29:07 +0200
Message-Id: <20180717132909.92158-4-hverkuil@xs4all.nl>
In-Reply-To: <20180717132909.92158-1-hverkuil@xs4all.nl>
References: <20180717132909.92158-1-hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
List-ID: <devicetree@vger.kernel.org>

From: Hans Verkuil <hans.verkuil@cisco.com>

Add two new events to signal when the 5V line goes high or low.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 include/uapi/linux/cec.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 20fe091b7e96..097fcd812471 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -384,6 +384,8 @@ struct cec_log_addrs {
 #define CEC_EVENT_PIN_CEC_HIGH		4
 #define CEC_EVENT_PIN_HPD_LOW		5
 #define CEC_EVENT_PIN_HPD_HIGH		6
+#define CEC_EVENT_PIN_5V_LOW		7
+#define CEC_EVENT_PIN_5V_HIGH		8
 
 #define CEC_EVENT_FL_INITIAL_STATE	(1 << 0)
 #define CEC_EVENT_FL_DROPPED_EVENTS	(1 << 1)
-- 
2.18.0
