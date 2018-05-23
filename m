From: "=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?=" <vokac.m@gmail.com>
Subject: [PATCH net-next v3 2/7] net: dsa: qca8k: Add support for QCA8334 switch
Date: Wed, 23 May 2018 08:20:19 +0200
Message-ID: <1527056424-14528-3-git-send-email-michal.vokac@ysoft.com>
References: <1527056424-14528-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527056424-14528-1-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net, michal.vokac@ysoft.com
List-Id: devicetree@vger.kernel.org

Add support for the four-port variant of the Qualcomm QCA833x switch.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Changes in v3:
 - Add "Reviewed-by" tag from Andrew

Changes in v2:
 - Add commit message

 drivers/net/dsa/qca8k.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/qca8k.c b/drivers/net/dsa/qca8k.c
index 3684e56..6a3ffb2 100644
--- a/drivers/net/dsa/qca8k.c
+++ b/drivers/net/dsa/qca8k.c
@@ -1010,6 +1010,7 @@ static SIMPLE_DEV_PM_OPS(qca8k_pm_ops,
 			 qca8k_suspend, qca8k_resume);
 
 static const struct of_device_id qca8k_of_match[] = {
+	{ .compatible = "qca,qca8334" },
 	{ .compatible = "qca,qca8337" },
 	{ /* sentinel */ },
 };
-- 
2.7.4
