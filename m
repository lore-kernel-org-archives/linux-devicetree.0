From: Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH 1/2] of: add vendor prefix for Holtek Semiconductor
Date: Wed, 16 Mar 2016 16:52:08 +0100
Message-ID: <81209392e3cdf566aa03b208b5e31a19c93e7b40.1458140954.git.robin@protonic.nl>
References: <cover.1458140954.git.robin@protonic.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1458140954.git.robin@protonic.nl>
In-Reply-To: <cover.1458140954.git.robin@protonic.nl>
References: <cover.1458140954.git.robin@protonic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee.jones@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Stefan Wahren <stefan.wahren@i2se.com>, Philipp Zabel <philipp.zabel@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>
List-Id: devicetree@vger.kernel.org

This patch introduces a vendor prefix for Holtek Semiconductor Inc.

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index dd72e05..fa70359d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -108,6 +108,7 @@ hitex	Hitex Development Tools
 holt	Holt Integrated Circuits, Inc.
 honeywell	Honeywell
 hp	Hewlett Packard
+ht	Holtek Semiconductor Inc.
 i2se	I2SE GmbH
 ibm	International Business Machines (IBM)
 idt	Integrated Device Technologies, Inc.
-- 
2.5.0
