From: Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v3 04/10] platform/chrome: cros_ec: add common
	commands for EC codec
Date: Mon, 14 Oct 2019 18:20:16 +0800
Message-ID: <20191014180059.04.Idc3c6e1cd94b70bf010249928d4a93c6c90495b7@changeid>
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
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, cychiang@google.com, drinkcat@google.com, tzungbi@google.com, robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com, dgreid@google.com
List-Id: devicetree@vger.kernel.org

Add the following common commands:
- GET_CAPABILITIES
- GET_SHM_ADDR
- SET_SHM_ADDR

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/platform/chrome/cros_ec_trace.c       |  1 +
 .../linux/platform_data/cros_ec_commands.h    | 64 ++++++++++++++++++-
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_trace.c b/drivers/platform/chrome/cros_ec_trace.c
index e73bb6a8b00e..2ea0d4e0d54d 100644
--- a/drivers/platform/chrome/cros_ec_trace.c
+++ b/drivers/platform/chrome/cros_ec_trace.c
@@ -98,6 +98,7 @@
 	TRACE_SYMBOL(EC_CMD_SB_READ_BLOCK), \
 	TRACE_SYMBOL(EC_CMD_SB_WRITE_BLOCK), \
 	TRACE_SYMBOL(EC_CMD_BATTERY_VENDOR_PARAM), \
+	TRACE_SYMBOL(EC_CMD_EC_CODEC), \
 	TRACE_SYMBOL(EC_CMD_EC_CODEC_DMIC), \
 	TRACE_SYMBOL(EC_CMD_EC_CODEC_I2S_RX), \
 	TRACE_SYMBOL(EC_CMD_REBOOT_EC), \
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 58e460c015ef..3ca0fa9e92a7 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4466,8 +4466,68 @@ enum mkbp_cec_event {
 
 /*****************************************************************************/
 
+/* Commands for audio codec. */
+#define EC_CMD_EC_CODEC 0x00BC
+
+enum ec_codec_subcmd {
+	EC_CODEC_GET_CAPABILITIES = 0x0,
+	EC_CODEC_GET_SHM_ADDR = 0x1,
+	EC_CODEC_SET_SHM_ADDR = 0x2,
+	EC_CODEC_SUBCMD_COUNT,
+};
+
+enum ec_codec_cap {
+	EC_CODEC_CAP_LAST = 32,
+};
+
+enum ec_codec_shm_id {
+	EC_CODEC_SHM_ID_LAST,
+};
+
+enum ec_codec_shm_type {
+	EC_CODEC_SHM_TYPE_EC_RAM = 0x0,
+	EC_CODEC_SHM_TYPE_SYSTEM_RAM = 0x1,
+};
+
+struct __ec_align1 ec_param_ec_codec_get_shm_addr {
+	uint8_t shm_id;
+	uint8_t reserved[3];
+};
+
+struct __ec_align4 ec_param_ec_codec_set_shm_addr {
+	uint64_t phys_addr;
+	uint32_t len;
+	uint8_t shm_id;
+	uint8_t reserved[3];
+};
+
+struct __ec_align4 ec_param_ec_codec {
+	uint8_t cmd; /* enum ec_codec_subcmd */
+	uint8_t reserved[3];
+
+	union {
+		struct ec_param_ec_codec_get_shm_addr
+				get_shm_addr_param;
+		struct ec_param_ec_codec_set_shm_addr
+				set_shm_addr_param;
+	};
+};
+
+struct __ec_align4 ec_response_ec_codec_get_capabilities {
+	uint32_t capabilities;
+};
+
+struct __ec_align4 ec_response_ec_codec_get_shm_addr {
+	uint64_t phys_addr;
+	uint32_t len;
+	uint8_t type;
+	uint8_t reserved[3];
+};
+
+/*****************************************************************************/
+
 /* Commands for DMIC on audio codec. */
-#define EC_CMD_EC_CODEC_DMIC 0x00BC
+#define EC_CMD_EC_CODEC_DMIC 0x00BD
 
 enum ec_codec_dmic_subcmd {
 	EC_CODEC_DMIC_SET_GAIN = 0x0,
@@ -4500,7 +4560,7 @@ struct __ec_align1 ec_response_ec_codec_dmic_get_gain {
 
 /* Commands for I2S RX on audio codec. */
 
-#define EC_CMD_EC_CODEC_I2S_RX 0x00BD
+#define EC_CMD_EC_CODEC_I2S_RX 0x00BE
 
 enum ec_codec_i2s_rx_subcmd {
 	EC_CODEC_I2S_RX_ENABLE = 0x0,
-- 
2.23.0.700.g56cf767bdb-goog
