From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 3/9] staging: bcm2835-audio: reorder variable declarations & remove trivial comments
Date: Tue, 16 Oct 2018 17:02:22 +0200
Message-ID: <20181016150228.16994-4-nsaenzjulienne@suse.de>
References: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: eric@anholt.net, stefan.wahren@i2se.com, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.de, nsaenzjulienne@suse.de
List-Id: devicetree@vger.kernel.org

When it comes to declaring variables it's preferred, when possible, to
use an inverted tree organization scheme.

Also, removes some comments that were useless.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 .../vc04_services/bcm2835-audio/bcm2835-pcm.c      | 10 ++--------
 .../vc04_services/bcm2835-audio/bcm2835-vchiq.c    |  4 ++--
 .../staging/vc04_services/bcm2835-audio/bcm2835.c  | 14 +++++++-------
 3 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
index e66da11af5cf..98b6977bdce7 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
@@ -164,14 +164,11 @@ static int snd_bcm2835_playback_spdif_open(struct snd_pcm_substream *substream)
 	return snd_bcm2835_playback_open_generic(substream, 1);
 }
 
-/* close callback */
 static int snd_bcm2835_playback_close(struct snd_pcm_substream *substream)
 {
-	/* the hardware-specific codes will be here */
-
-	struct bcm2835_chip *chip;
-	struct snd_pcm_runtime *runtime;
 	struct bcm2835_alsa_stream *alsa_stream;
+	struct snd_pcm_runtime *runtime;
+	struct bcm2835_chip *chip;
 
 	chip = snd_pcm_substream_chip(substream);
 	mutex_lock(&chip->audio_mutex);
@@ -195,20 +192,17 @@ static int snd_bcm2835_playback_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-/* hw_params callback */
 static int snd_bcm2835_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
 }
 
-/* hw_free callback */
 static int snd_bcm2835_pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	return snd_pcm_lib_free_pages(substream);
 }
 
-/* prepare callback */
 static int snd_bcm2835_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct bcm2835_chip *chip = snd_pcm_substream_chip(substream);
diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index aca7008e1921..932ef12ac5d2 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -94,9 +94,9 @@ static void audio_vchi_callback(void *param,
 				void *msg_handle)
 {
 	struct bcm2835_audio_instance *instance = param;
-	int status;
-	int msg_len;
 	struct vc_audio_msg m;
+	int msg_len;
+	int status;
 
 	if (reason != VCHI_CALLBACK_MSG_AVAILABLE)
 		return;
diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
index 0efae7068fef..6ee8334dfc81 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
@@ -161,8 +161,8 @@ static int snd_add_child_device(struct device *dev,
 				struct bcm2835_audio_driver *audio_driver,
 				u32 numchans)
 {
-	struct snd_card *card;
 	struct bcm2835_chip *chip;
+	struct snd_card *card;
 	int err;
 
 	err = snd_card_new(dev, -1, NULL, THIS_MODULE, sizeof(*chip), &card);
@@ -225,12 +225,12 @@ static int snd_add_child_device(struct device *dev,
 
 static int snd_add_child_devices(struct device *device, u32 numchans)
 {
-	int i;
-	int count_devices = 0;
-	int minchannels = 0;
-	int extrachannels = 0;
 	int extrachannels_per_driver = 0;
 	int extrachannels_remainder = 0;
+	int count_devices = 0;
+	int extrachannels = 0;
+	int minchannels = 0;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(children_devices); i++)
 		if (*children_devices[i].is_enabled)
@@ -258,9 +258,9 @@ static int snd_add_child_devices(struct device *device, u32 numchans)
 		extrachannels_remainder);
 
 	for (i = 0; i < ARRAY_SIZE(children_devices); i++) {
-		int err;
-		int numchannels_this_device;
 		struct bcm2835_audio_driver *audio_driver;
+		int numchannels_this_device;
+		int err;
 
 		if (!*children_devices[i].is_enabled)
 			continue;
-- 
2.19.1
