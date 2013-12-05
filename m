From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH v3 5/9] mtd: nand: davinci: move bindings under mtd
Date: Thu, 5 Dec 2013 19:25:53 +0200
Message-ID: <1386264358-9738-6-git-send-email-ivan.khoronzhuk@ti.com>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@kernel.crashing.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, grygorii.strashko@ti.com, dwmw2@infradead.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
List-Id: devicetree@vger.kernel.org

Move bindings under mtd. Do this in order to make davinci-nand
driver usable by keystone architecture.

Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
Reviewed-by: Taras Kondratiuk <taras@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 .../{arm/davinci/nand.txt => mtd/davinci-nand.txt} |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{arm/davinci/nand.txt => mtd/davinci-nand.txt} (100%)

diff --git a/Documentation/devicetree/bindings/arm/davinci/nand.txt b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/davinci/nand.txt
rename to Documentation/devicetree/bindings/mtd/davinci-nand.txt
-- 
1.7.9.5
