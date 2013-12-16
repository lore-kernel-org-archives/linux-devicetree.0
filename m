From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [RFC PATCH 06/10] irqchip: atmel-aic: move binding doc to interrupt-controller directory
Date: Mon, 16 Dec 2013 21:24:17 +0100
Message-ID: <1387225461-6201-7-git-send-email-b.brezillon@overkiz.com>
References: <1387225461-6201-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387225461-6201-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Landley <rob@landley.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Grant Likely <grant.likely@linaro.org>
Cc: Boris BREZILLON <b.brezillon@overkiz.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Move atmel aic driver doc to the interrupt-controller directory as the new
driver now lays in drivers/irqchip/atmel-aic.c.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 .../atmel,aic.txt}                                 |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{arm/atmel-aic.txt => interrupt-controller/atmel,aic.txt} (100%)

diff --git a/Documentation/devicetree/bindings/arm/atmel-aic.txt b/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/atmel-aic.txt
rename to Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
-- 
1.7.9.5
