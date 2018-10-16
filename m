From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 1/9] staging: bcm2835-audio: unify FOURCC command definitions
Date: Tue, 16 Oct 2018 17:02:20 +0200
Message-ID: <20181016150228.16994-2-nsaenzjulienne@suse.de>
References: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: eric@anholt.net, stefan.wahren@i2se.com, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.de, nsaenzjulienne@suse.de
List-Id: devicetree@vger.kernel.org

The device communicates with the audio core using FOURCC codes. The
driver was generating them using different macros/expressions. We now
use the same macro to create them and centralize all the definitions.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 .../vc04_services/bcm2835-audio/bcm2835-vchiq.c     | 13 ++++---------
 .../bcm2835-audio/vc_vchi_audioserv_defs.h          |  4 +++-
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index 781754f36da7..aca7008e1921 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -89,11 +89,6 @@ static int bcm2835_audio_send_simple(struct bcm2835_audio_instance *instance,
 	return bcm2835_audio_send_msg(instance, &m, wait);
 }
 
-static const u32 BCM2835_AUDIO_WRITE_COOKIE1 = ('B' << 24 | 'C' << 16 |
-						'M' << 8  | 'A');
-static const u32 BCM2835_AUDIO_WRITE_COOKIE2 = ('D' << 24 | 'A' << 16 |
-						'T' << 8  | 'A');
-
 static void audio_vchi_callback(void *param,
 				const VCHI_CALLBACK_REASON_T reason,
 				void *msg_handle)
@@ -112,8 +107,8 @@ static void audio_vchi_callback(void *param,
 		instance->result = m.u.result.success;
 		complete(&instance->msg_avail_comp);
 	} else if (m.type == VC_AUDIO_MSG_TYPE_COMPLETE) {
-		if (m.u.complete.cookie1 != BCM2835_AUDIO_WRITE_COOKIE1 ||
-		    m.u.complete.cookie2 != BCM2835_AUDIO_WRITE_COOKIE2)
+		if (m.u.complete.cookie1 != VC_AUDIO_WRITE_COOKIE1 ||
+		    m.u.complete.cookie2 != VC_AUDIO_WRITE_COOKIE2)
 			dev_err(instance->dev, "invalid cookie\n");
 		else
 			bcm2835_playback_fifo(instance->alsa_stream,
@@ -329,8 +324,8 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
 		.type = VC_AUDIO_MSG_TYPE_WRITE,
 		.u.write.count = size,
 		.u.write.max_packet = instance->max_packet,
-		.u.write.cookie1 = BCM2835_AUDIO_WRITE_COOKIE1,
-		.u.write.cookie2 = BCM2835_AUDIO_WRITE_COOKIE2,
+		.u.write.cookie1 = VC_AUDIO_WRITE_COOKIE1,
+		.u.write.cookie2 = VC_AUDIO_WRITE_COOKIE2,
 	};
 	unsigned int count;
 	int err, status;
diff --git a/drivers/staging/vc04_services/bcm2835-audio/vc_vchi_audioserv_defs.h b/drivers/staging/vc04_services/bcm2835-audio/vc_vchi_audioserv_defs.h
index 1a7f0884ac9c..dc62875cfdca 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/vc_vchi_audioserv_defs.h
+++ b/drivers/staging/vc04_services/bcm2835-audio/vc_vchi_audioserv_defs.h
@@ -7,8 +7,10 @@
 #define VC_AUDIOSERV_MIN_VER 1
 #define VC_AUDIOSERV_VER 2
 
-/* FourCC code used for VCHI connection */
+/* FourCC codes used for VCHI communication */
 #define VC_AUDIO_SERVER_NAME  MAKE_FOURCC("AUDS")
+#define VC_AUDIO_WRITE_COOKIE1 MAKE_FOURCC("BCMA")
+#define VC_AUDIO_WRITE_COOKIE2 MAKE_FOURCC("DATA")
 
 /*
  *  List of screens that are currently supported
-- 
2.19.1
