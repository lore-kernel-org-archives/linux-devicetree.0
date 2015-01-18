From: Sylvain Rochet <sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>
Subject: [PATCHv2 0/2] dts: AT91 Watchdog, remove property idle halt by default
Date: Sun, 18 Jan 2015 14:26:49 +0100
Message-ID: <1421587611-32708-1-git-send-email-sylvain.rochet@finsecur.com>
References: <20150118090820.07856398@bbrezillon>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150118090820.07856398@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sylvain Rochet <sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Change since v1:
  * Apply this change for all impacted SoCs
  * Improved DTS documentation about this property

Sylvain Rochet (2):
  dts: Documentation: AT91 Watchdog, explain what atmel,idle-halt
    property really do
  dts: AT91 Watchdog, remove property idle halt by default

 Documentation/devicetree/bindings/watchdog/atmel-wdt.txt | 5 +++++
 arch/arm/boot/dts/at91sam9260.dtsi                       | 1 -
 arch/arm/boot/dts/at91sam9263.dtsi                       | 1 -
 arch/arm/boot/dts/at91sam9g45.dtsi                       | 1 -
 arch/arm/boot/dts/at91sam9n12.dtsi                       | 1 -
 arch/arm/boot/dts/at91sam9x5.dtsi                        | 1 -
 arch/arm/boot/dts/sama5d3.dtsi                           | 1 -
 7 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
