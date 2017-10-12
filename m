From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 2/3] phy: brcm-sata: Prepare for doing more tuning
Date: Wed, 11 Oct 2017 17:53:11 -0700
Message-ID: <20171012005312.17363-3-f.fainelli@gmail.com>
References: <20171012005312.17363-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171012005312.17363-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Ray Jui <ray.jui@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Viresh Kumar <viresh.kumar@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Dan Carpenter <dan.carpenter@oracle.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Split the functional code in brcm_stb_sata_init() to a separate function
that actually does configure spread spectrum: brcm_stb_sata_ssc_init()
and make that function return void, since that function cannot fail.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/phy/broadcom/phy-brcm-sata.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index 9d7f74fe3d7c..0152d0b32dae 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -190,7 +190,7 @@ static u32 brcm_sata_phy_rd(void __iomem *pcb_base, u32 bank, u32 ofs)
 #define STB_FMAX_VAL_DEFAULT	0x3df
 #define STB_FMAX_VAL_SSC	0x83
 
-static int brcm_stb_sata_init(struct brcm_sata_port *port)
+static void brcm_stb_sata_ssc_init(struct brcm_sata_port *port)
 {
 	void __iomem *base = brcm_sata_pcb_base(port);
 	struct brcm_sata_phy *priv = port->phy_priv;
@@ -215,6 +215,11 @@ static int brcm_stb_sata_init(struct brcm_sata_port *port)
 
 	brcm_sata_phy_wr(base, TXPMD_REG_BANK, TXPMD_TX_FREQ_CTRL_CONTROL3,
 			  ~TXPMD_TX_FREQ_CTRL_CONTROL3_FMAX_MASK, tmp);
+}
+
+static int brcm_stb_sata_init(struct brcm_sata_port *port)
+{
+	brcm_stb_sata_ssc_init(port);
 
 	return 0;
 }
-- 
2.9.3
