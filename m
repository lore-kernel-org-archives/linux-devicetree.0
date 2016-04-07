From: Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH v5 1/2] of: add vendor prefix for Holtek Semiconductor
Date: Thu,  7 Apr 2016 10:54:00 +0200
Message-ID: <e820959acf12357feba48a480e1295b17e515f51.1460019147.git.robin@protonic.nl>
References: <cover.1460019147.git.robin@protonic.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1460019147.git.robin@protonic.nl>
In-Reply-To: <cover.1460019147.git.robin@protonic.nl>
References: <cover.1460019147.git.robin@protonic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, devicetree@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
---
Changes in v5:
 - Changed vendor prefix from 'ht' into 'holtek'

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 72e2c5a..5def89e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -108,6 +108,7 @@ hitex	Hitex Development Tools
 holt	Holt Integrated Circuits, Inc.
 honeywell	Honeywell
 hp	Hewlett Packard
+holtek	Holtek Semiconductor, Inc.
 i2se	I2SE GmbH
 ibm	International Business Machines (IBM)
 idt	Integrated Device Technologies, Inc.
-- 
2.5.0
