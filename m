From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 2/2] uio: Documentation: Add information on using uio_pdrv_genirq with DT
Date: Thu, 15 Aug 2019 23:28:07 +0200
Message-ID: <20190815212807.25058-2-daniel@zonque.org>
References: <20190815212807.25058-1-daniel@zonque.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190815212807.25058-1-daniel@zonque.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-Id: devicetree@vger.kernel.org

Add a paragraph to describe the use of the "of_id" module parameter,
along with the new DT property.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 Documentation/driver-api/uio-howto.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/driver-api/uio-howto.rst b/Documentation/driver-api/uio-howto.rst
index 25f50eace28b..b9f28641ddf0 100644
--- a/Documentation/driver-api/uio-howto.rst
+++ b/Documentation/driver-api/uio-howto.rst
@@ -408,6 +408,13 @@ handler code. You also do not need to know anything about the chip's
 internal registers to create the kernel part of the driver. All you need
 to know is the irq number of the pin the chip is connected to.
 
+When used in a device-tree enabled system, the driver needs to be
+probed with the ``"of_id"`` module parameter set to the ``"compatible"``
+string of the node the driver is supposed to handle. By default, the
+node's name (without the unit address) is exposed as name for the
+UIO device in userspace. To set a custom name, a property named
+``"linux,uio-name"`` may be specified in the DT node.
+
 Using uio_dmem_genirq for platform devices
 ------------------------------------------
 
-- 
2.21.0
