From: Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v3 05/10] ASoC: cros_ec_codec: read max DMIC
	gain from EC codec
Date: Mon, 14 Oct 2019 18:20:17 +0800
Message-ID: <20191014180059.05.Id4657c864d544634f2b5c1c9b34fa8232ecba44d@changeid>
References: <20191014102022.236013-1-tzungbi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191014102022.236013-1-tzungbi@google.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, cychiang@google.com, drinkcat@google.com, tzungbi@google.com, robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com, dgreid@google.com, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Read max DMIC gain from EC codec instead of DTS.  Also removes the
dt-binding of max-dmic-gain.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/google,cros-ec-codec.txt   |  4 +-
 .../linux/platform_data/cros_ec_commands.h    | 43 +++++++++++----
 sound/soc/codecs/cros_ec_codec.c              | 53 ++++++++++++++-----
 3 files changed, 73 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
index 1084f7f22eea..0ce9fafc78e2 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
@@ -1,4 +1,4 @@
-* Audio codec controlled by ChromeOS EC
+Audio codec controlled by ChromeOS EC
 
 Google's ChromeOS EC codec is a digital mic codec provided by the
 Embedded Controller (EC) and is controlled via a host-command interface.
@@ -9,7 +9,6 @@ Documentation/devicetree/bindings/mfd/cros-ec.txt).
 Required properties:
 - compatible: Must contain "google,cros-ec-codec"
 - #sound-dai-cells: Should be 1. The cell specifies number of DAIs.
-- max-dmic-gain: A number for maximum gain in dB on digital microphone.
 
 Example:
 
@@ -21,6 +20,5 @@ cros-ec@0 {
 	cros_ec_codec: ec-codec {
 		compatible = "google,cros-ec-codec";
 		#sound-dai-cells = <1>;
-		max-dmic-gain = <43>;
 	};
 };
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 3ca0fa9e92a7..21db0d4d4025 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4530,30 +4530,53 @@ struct __ec_align4 ec_response_ec_codec_get_shm_addr {
 #define EC_CMD_EC_CODEC_DMIC 0x00BD
 
 enum ec_codec_dmic_subcmd {
-	EC_CODEC_DMIC_SET_GAIN = 0x0,
-	EC_CODEC_DMIC_GET_GAIN = 0x1,
+	EC_CODEC_DMIC_GET_MAX_GAIN = 0x0,
+	EC_CODEC_DMIC_SET_GAIN_IDX = 0x1,
+	EC_CODEC_DMIC_GET_GAIN_IDX = 0x2,
 	EC_CODEC_DMIC_SUBCMD_COUNT,
 };
 
-struct __ec_align1 ec_param_ec_codec_dmic_set_gain {
-	uint8_t left;
-	uint8_t right;
+enum ec_codec_dmic_channel {
+	EC_CODEC_DMIC_CHANNEL_0 = 0x0,
+	EC_CODEC_DMIC_CHANNEL_1 = 0x1,
+	EC_CODEC_DMIC_CHANNEL_2 = 0x2,
+	EC_CODEC_DMIC_CHANNEL_3 = 0x3,
+	EC_CODEC_DMIC_CHANNEL_4 = 0x4,
+	EC_CODEC_DMIC_CHANNEL_5 = 0x5,
+	EC_CODEC_DMIC_CHANNEL_6 = 0x6,
+	EC_CODEC_DMIC_CHANNEL_7 = 0x7,
+	EC_CODEC_DMIC_CHANNEL_COUNT,
+};
+
+struct __ec_align1 ec_param_ec_codec_dmic_set_gain_idx {
+	uint8_t channel; /* enum ec_codec_dmic_channel */
+	uint8_t gain;
 	uint8_t reserved[2];
 };
 
+struct __ec_align1 ec_param_ec_codec_dmic_get_gain_idx {
+	uint8_t channel; /* enum ec_codec_dmic_channel */
+	uint8_t reserved[3];
+};
+
 struct __ec_align4 ec_param_ec_codec_dmic {
 	uint8_t cmd; /* enum ec_codec_dmic_subcmd */
 	uint8_t reserved[3];
 
 	union {
-		struct ec_param_ec_codec_dmic_set_gain
-				set_gain_param;
+		struct ec_param_ec_codec_dmic_set_gain_idx
+				set_gain_idx_param;
+		struct ec_param_ec_codec_dmic_get_gain_idx
+				get_gain_idx_param;
 	};
 };
 
-struct __ec_align1 ec_response_ec_codec_dmic_get_gain {
-	uint8_t left;
-	uint8_t right;
+struct __ec_align1 ec_response_ec_codec_dmic_get_max_gain {
+	uint8_t max_gain;
+};
+
+struct __ec_align1 ec_response_ec_codec_dmic_get_gain_idx {
+	uint8_t gain;
 };
 
 /*****************************************************************************/
diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index c19c7fe42e2e..3d4f9e82d6e9 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -65,18 +65,26 @@ static int dmic_get_gain(struct snd_kcontrol *kcontrol,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 	struct ec_param_ec_codec_dmic p;
-	struct ec_response_ec_codec_dmic_get_gain r;
+	struct ec_response_ec_codec_dmic_get_gain_idx r;
 	int ret;
 
-	p.cmd = EC_CODEC_DMIC_GET_GAIN;
+	p.cmd = EC_CODEC_DMIC_GET_GAIN_IDX;
+	p.get_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_0;
 	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
 				   (uint8_t *)&p, sizeof(p),
 				   (uint8_t *)&r, sizeof(r));
 	if (ret < 0)
 		return ret;
+	ucontrol->value.integer.value[0] = r.gain;
 
-	ucontrol->value.integer.value[0] = r.left;
-	ucontrol->value.integer.value[1] = r.right;
+	p.cmd = EC_CODEC_DMIC_GET_GAIN_IDX;
+	p.get_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_1;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+				   (uint8_t *)&p, sizeof(p),
+				   (uint8_t *)&r, sizeof(r));
+	if (ret < 0)
+		return ret;
+	ucontrol->value.integer.value[1] = r.gain;
 
 	return 0;
 }
@@ -94,15 +102,24 @@ static int dmic_put_gain(struct snd_kcontrol *kcontrol,
 	int left = ucontrol->value.integer.value[0];
 	int right = ucontrol->value.integer.value[1];
 	struct ec_param_ec_codec_dmic p;
+	int ret;
 
 	if (left > max_dmic_gain || right > max_dmic_gain)
 		return -EINVAL;
 
 	dev_dbg(component->dev, "set mic gain to %u, %u\n", left, right);
 
-	p.cmd = EC_CODEC_DMIC_SET_GAIN;
-	p.set_gain_param.left = left;
-	p.set_gain_param.right = right;
+	p.cmd = EC_CODEC_DMIC_SET_GAIN_IDX;
+	p.set_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_0;
+	p.set_gain_idx_param.gain = left;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+				   (uint8_t *)&p, sizeof(p), NULL, 0);
+	if (ret < 0)
+		return ret;
+
+	p.cmd = EC_CODEC_DMIC_SET_GAIN_IDX;
+	p.set_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_1;
+	p.set_gain_idx_param.gain = right;
 	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
 				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
@@ -125,19 +142,27 @@ static int dmic_probe(struct snd_soc_component *component)
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 	struct device *dev = priv->dev;
-	int ret, val;
 	struct soc_mixer_control *control;
+	struct ec_param_ec_codec_dmic p;
+	struct ec_response_ec_codec_dmic_get_max_gain r;
+	int ret;
 
-	ret = device_property_read_u32(dev, "max-dmic-gain", &val);
-	if (ret) {
-		dev_err(dev, "Failed to read 'max-dmic-gain'\n");
-		return ret;
+	p.cmd = EC_CODEC_DMIC_GET_MAX_GAIN;
+
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+				   (uint8_t *)&p, sizeof(p),
+				   (uint8_t *)&r, sizeof(r));
+	if (ret < 0) {
+		dev_warn(dev, "get_max_gain() unsupported\n");
+		return 0;
 	}
 
+	dev_dbg(dev, "max gain = %d\n", r.max_gain);
+
 	control = (struct soc_mixer_control *)
 		dmic_controls[DMIC_CTL_GAIN].private_value;
-	control->max = val;
-	control->platform_max = val;
+	control->max = r.max_gain;
+	control->platform_max = r.max_gain;
 
 	return snd_soc_add_component_controls(component,
 			&dmic_controls[DMIC_CTL_GAIN], 1);
-- 
2.23.0.700.g56cf767bdb-goog
