From: Eric Nelson <eric@nelint.com>
Subject: [PATCH V2 1/2] rc-core: define a default timeout for drivers
Date: Sat,  3 Oct 2015 08:18:50 -0700
Message-ID: <1443885530-4980-1-git-send-email-eric@nelint.com>
References: <20151003112510.54fe2a25@recife.lan>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20151003112510.54fe2a25@recife.lan>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, sean@mess.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mchehab@osg.samsung.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, patrice.chotard@st.com, fabf@skynet.be, wsa@the-dreams.de, heiko@sntech.de, devicetree@vger.kernel.org, otavio@ossystems.com.br, Eric Nelson <eric@nelint.com>
List-Id: devicetree@vger.kernel.org

A default timeout value of 125 ms should work for all decoders.

Declare a constant to help standardize its' use.

Signed-off-by: Eric Nelson <eric@nelint.com>
---
V2 increases the default timeout to 125ms as requested by Mauro

 include/media/rc-core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index ec921f6..f649470 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -239,6 +239,7 @@ static inline void init_ir_raw_event(struct ir_raw_event *ev)
 	memset(ev, 0, sizeof(*ev));
 }
 
+#define IR_DEFAULT_TIMEOUT	MS_TO_NS(125)
 #define IR_MAX_DURATION         500000000	/* 500 ms */
 #define US_TO_NS(usec)		((usec) * 1000)
 #define MS_TO_US(msec)		((msec) * 1000)
-- 
2.6.0
