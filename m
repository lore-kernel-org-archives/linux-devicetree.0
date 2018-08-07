From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: [PATCH 2/3] net: dsa: b53: Add support for Broadcom Omega SoC internal switch
Date: Tue,  7 Aug 2018 10:02:43 -0700
Message-ID: <1533661364-15381-3-git-send-email-arun.parameswaran@broadcom.com>
References: <1533661364-15381-1-git-send-email-arun.parameswaran@broadcom.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1533661364-15381-1-git-send-email-arun.parameswaran@broadcom.com>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Arun Parameswaran <arun.parameswaran@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add support for the Broadcom Omega SoC internal ethernet switch
to the b53 srab driver in the DSA framework.

Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>
---
 drivers/net/dsa/b53/b53_srab.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index 8247481..91de2ba 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -374,6 +374,7 @@ static int b53_srab_write64(struct b53_device *dev, u8 page, u8 reg,
 	{ .compatible = "brcm,bcm88312-srab", .data = (void *)BCM58XX_DEVICE_ID },
 	{ .compatible = "brcm,cygnus-srab", .data = (void *)BCM583XX_DEVICE_ID },
 	{ .compatible = "brcm,nsp-srab", .data = (void *)BCM58XX_DEVICE_ID },
+	{ .compatible = "brcm,omega-srab", .data = (void *)BCM583XX_DEVICE_ID },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, b53_srab_of_match);
-- 
1.9.1
