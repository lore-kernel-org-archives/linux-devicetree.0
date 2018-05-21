From: "=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?=" <vokac.m@gmail.com>
Subject: [PATCH net-next 2/7] net: dsa: qca8k: Add support for QCA8334 switch
Date: Mon, 21 May 2018 15:28:08 +0200
Message-ID: <1526909293-56377-3-git-send-email-michal.vokac@ysoft.com>
References: <1526909293-56377-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526909293-56377-1-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, michal.vokac@ysoft.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
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
2.1.4
