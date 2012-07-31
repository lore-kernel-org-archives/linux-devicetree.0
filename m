From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/1] ARM: dove: DT support for sdhci-dove
Date: Tue, 31 Jul 2012 08:46:51 +0200
Message-ID: <20120731064651.GA13624@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mmc-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-mmc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@googlemail.com>
Cc: linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Manuel Lauss <manuel.lauss@googlemail.com>, Anton Vorontsov <cbouatmailru@gmail.com>, David Brown <davidb@codeaurora.org>, Chris Ball <cjb@laptop.org>
List-Id: devicetree@vger.kernel.org

+++ b/Documentation/devicetree/bindings/mmc/sdhci-dove.txt
@@ -0,0 +1,12 @@
+* Marvell sdhci-dove controller
+
+Required properties:
+- compatible: Should be "marvell,dove-sdhci".
+
+Example:
+
+sdio0: sdio@92000 {
+       compatible = "marvell,dove-sdhci";
+       reg = <0x92000 0x100>;
+       interrupts = <35>, <37>;


Hi Sebastian

Since there are two interrupts here, maybe it would be good to
document what each one is?

	 Thanks
		Andrew
