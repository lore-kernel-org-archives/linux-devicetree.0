From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 4/9] staging: bcm2835-audio: use anonymous union in struct vc_audio_msg
Date: Tue, 16 Oct 2018 17:02:23 +0200
Message-ID: <20181016150228.16994-5-nsaenzjulienne@suse.de>
References: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: eric@anholt.net, stefan.wahren@i2se.com, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.de, nsaenzjulienne@suse.de
List-Id: devicetree@vger.kernel.org

In this case explicitly naming the union doesn't help overall code
comprehension and clutters it.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 .../bcm2835-audio/bcm2835-vchiq.c             | 30 +++++++++----------
 .../bcm2835-audio/vc_vchi_audioserv_defs.h    |  2 +-
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index 932ef12ac5d2..0db412fd7c55 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -104,15 +104,15 @@ static void audio_vchi_callback(void *param,
 	status = vchi_msg_dequeue(instance->vchi_handle,
 				  &m, sizeof(m), &msg_len, VCHI_FLAGS_NONE);
 	if (m.type == VC_AUDIO_MSG_TYPE_RESULT) {
-		instance->result = m.u.result.success;
+		instance->result = m.result.success;
 		complete(&instance->msg_avail_comp);
 	} else if (m.type == VC_AUDIO_MSG_TYPE_COMPLETE) {
-		if (m.u.complete.cookie1 != VC_AUDIO_WRITE_COOKIE1 ||
-		    m.u.complete.cookie2 != VC_AUDIO_WRITE_COOKIE2)
+		if (m.complete.cookie1 != VC_AUDIO_WRITE_COOKIE1 ||
+		    m.complete.cookie2 != VC_AUDIO_WRITE_COOKIE2)
 			dev_err(instance->dev, "invalid cookie\n");
 		else
 			bcm2835_playback_fifo(instance->alsa_stream,
-					      m.u.complete.count);
+					      m.complete.count);
 	} else {
 		dev_err(instance->dev, "unexpected callback type=%d\n", m.type);
 	}
@@ -249,11 +249,11 @@ int bcm2835_audio_set_ctls(struct bcm2835_alsa_stream *alsa_stream)
 	struct vc_audio_msg m = {};
 
 	m.type = VC_AUDIO_MSG_TYPE_CONTROL;
-	m.u.control.dest = chip->dest;
+	m.control.dest = chip->dest;
 	if (!chip->mute)
-		m.u.control.volume = CHIP_MIN_VOLUME;
+		m.control.volume = CHIP_MIN_VOLUME;
 	else
-		m.u.control.volume = alsa2chip(chip->volume);
+		m.control.volume = alsa2chip(chip->volume);
 
 	return bcm2835_audio_send_msg(alsa_stream->instance, &m, true);
 }
@@ -264,9 +264,9 @@ int bcm2835_audio_set_params(struct bcm2835_alsa_stream *alsa_stream,
 {
 	struct vc_audio_msg m = {
 		 .type = VC_AUDIO_MSG_TYPE_CONFIG,
-		 .u.config.channels = channels,
-		 .u.config.samplerate = samplerate,
-		 .u.config.bps = bps,
+		 .config.channels = channels,
+		 .config.samplerate = samplerate,
+		 .config.bps = bps,
 	};
 	int err;
 
@@ -294,7 +294,7 @@ int bcm2835_audio_drain(struct bcm2835_alsa_stream *alsa_stream)
 {
 	struct vc_audio_msg m = {
 		.type = VC_AUDIO_MSG_TYPE_STOP,
-		.u.stop.draining = 1,
+		.stop.draining = 1,
 	};
 
 	return bcm2835_audio_send_msg(alsa_stream->instance, &m, false);
@@ -322,10 +322,10 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
 	struct bcm2835_audio_instance *instance = alsa_stream->instance;
 	struct vc_audio_msg m = {
 		.type = VC_AUDIO_MSG_TYPE_WRITE,
-		.u.write.count = size,
-		.u.write.max_packet = instance->max_packet,
-		.u.write.cookie1 = VC_AUDIO_WRITE_COOKIE1,
-		.u.write.cookie2 = VC_AUDIO_WRITE_COOKIE2,
+		.write.count = size,
+		.write.max_packet = instance->max_packet,
+		.write.cookie1 = VC_AUDIO_WRITE_COOKIE1,
+		.write.cookie2 = VC_AUDIO_WRITE_COOKIE2,
 	};
 	unsigned int count;
 	int err, status;
diff --git a/drivers/staging/vc04_services/bcm2835-audio/vc_vchi_audioserv_defs.h b/drivers/staging/vc04_services/bcm2835-audio/vc_vchi_audioserv_defs.h
index dc62875cfdca..d6401e914ac9 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/vc_vchi_audioserv_defs.h
+++ b/drivers/staging/vc04_services/bcm2835-audio/vc_vchi_audioserv_defs.h
@@ -93,7 +93,7 @@ struct vc_audio_msg {
 		struct vc_audio_write write;
 		struct vc_audio_result result;
 		struct vc_audio_complete complete;
-	} u;
+	};
 };
 
 #endif /* _VC_AUDIO_DEFS_H_ */
-- 
2.19.1
