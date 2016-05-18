From: Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH v6 1/3] of: add vendor prefix for Holtek Semiconductor
Date: Wed, 18 May 2016 14:23:17 +0200
Message-ID: <1463574199-21077-2-git-send-email-robin@protonic.nl>
References: <1463574199-21077-1-git-send-email-robin@protonic.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463574199-21077-1-git-send-email-robin@protonic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawnguo@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Matt Ranostay <mranostay@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@codeaurora.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Guenter Roeck <linux@roeck-us.net>, Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 86740d4..84fb85d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -112,6 +112,7 @@ hitex	Hitex Development Tools
 holt	Holt Integrated Circuits, Inc.
 honeywell	Honeywell
 hp	Hewlett Packard
+holtek	Holtek Semiconductor, Inc.
 i2se	I2SE GmbH
 ibm	International Business Machines (IBM)
 idt	Integrated Device Technologies, Inc.
-- 
2.7.4
