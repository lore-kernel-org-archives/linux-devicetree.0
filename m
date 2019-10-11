From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v1 3/3] docs: driver-model: Add documentation for sync_state
Date: Fri, 11 Oct 2019 12:15:21 -0700
Message-ID: <20191011191521.179614-4-saravanak@google.com>
References: <20191011191521.179614-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011191521.179614-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, kernel-team@android.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The sync_state() driver callback was added recently, but the
documentation was missing.  Adding it now.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 .../driver-api/driver-model/driver.rst        | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/driver-api/driver-model/driver.rst b/Documentation/driver-api/driver-model/driver.rst
index 11d281506a04..baa6a85c8287 100644
--- a/Documentation/driver-api/driver-model/driver.rst
+++ b/Documentation/driver-api/driver-model/driver.rst
@@ -169,6 +169,49 @@ A driver's probe() may return a negative errno value to indicate that
 the driver did not bind to this device, in which case it should have
 released all resources it allocated::
 
+	void (*sync_state)(struct device *dev);
+
+sync_state is called only once for a device. It's called when all the consumer
+devices of the device have successfully probed. The list of consumers of the
+device is obtained by looking at the device links connecting that device to its
+consumer devices.
+
+The first attempt to call sync_state() is made during late_initcall_sync() to
+give firmware and drivers time to link devices to each other. During the first
+attempt at calling sync_state(), if all the consumers of the device at that
+point in time have already probed successfully, sync_state() is called right
+away. If there are no consumers of the device during the first attempt, that
+too is considered as "all consumers of the device have probed" and sync_state()
+is called right away.
+
+If during the first attempt at calling sync_state() for a device, there are
+still consumers that haven't probed successfully, the sync_state() call is
+postponed and reattempted in the future only when one or more consumers of the
+device probe successfully. If during the reattempt, the driver core finds that
+there are one or more consumers of the device that haven't probed yet, then
+sync_state() call is postponed again.
+
+A typical use case for sync_state() is to have the kernel cleanly take over
+management of devices from the bootloader. For example, if a device is left on
+and at a particular hardware configuration by the bootloader, the device's
+driver might need to keep the device in the boot configuration until all the
+consumers of the device have probed. Once all the consumers of the device have
+probed, the device's driver can synchronize the hardware state of the device to
+match the aggregated software state requested by all the consumers. Hence the
+name sync_state().
+
+While obvious examples of resources that can benefit from sync_state() include
+resources such as regulator, sync_state() can also be useful for complex
+resources like IOMMUs. For example, IOMMUs with multiple consumers (devices
+whose addresses are remapped by the IOMMU) might need to keep their mappings
+fixed at (or additive to) the boot configuration until all its consumers have
+probed.
+
+While the typical use case for sync_state() is to have the kernel cleanly take
+over management of devices from the bootloader, the usage of sync_state() is
+not restricted to that. Use it whenever it makes sense to take an action after
+all the consumers of a device have probed.
+
 	int 	(*remove)	(struct device *dev);
 
 remove is called to unbind a driver from a device. This may be
-- 
2.23.0.700.g56cf767bdb-goog
