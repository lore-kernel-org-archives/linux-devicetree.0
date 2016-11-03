From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v5 4/8] firmware: arm_scpi: allow firmware with
 get_capabilities not implemented
Date: Wed,  2 Nov 2016 22:52:07 -0600
Message-ID: <1478148731-11712-5-git-send-email-sudeep.holla@arm.com>
References: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Neil Armstrong <narmstrong@baylibre.com>

On Amlogic SCPI legacy implementation, the GET_CAPABILITIES command is
not supported, failover by using 0.0.0 version.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
[sudeep.holla@arm.com: changed the subject]
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index 2982bc7b8c33..902233642bd3 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -783,6 +783,10 @@ static int scpi_init_versions(struct scpi_drvinfo *info)
 		info->protocol_version = le32_to_cpu(caps.protocol_version);
 		info->firmware_version = le32_to_cpu(caps.platform_version);
 	}
+	/* Ignore error if not implemented */
+	if (scpi_info->is_legacy && ret == -EOPNOTSUPP)
+		return 0;
+
 	return ret;
 }
 
-- 
1.9.1
