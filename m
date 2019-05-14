From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2 1/3] dt-bindings: Remove Linuxisms from common-properties binding
Date: Tue, 14 May 2019 13:40:51 -0700
Message-ID: <20190514204053.124122-2-swboyd@chromium.org>
References: <20190514204053.124122-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514204053.124122-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>
List-Id: devicetree@vger.kernel.org

We shouldn't reference Linux kernel functions or Linux itself in proper
bindings. It's OK to reference functions in the kernel when explaining
examples, but otherwise we shouldn't reference functions to describe
what the binding means.

Cc: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../devicetree/bindings/common-properties.txt   | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/common-properties.txt b/Documentation/devicetree/bindings/common-properties.txt
index a3448bfa1c82..98a28130e100 100644
--- a/Documentation/devicetree/bindings/common-properties.txt
+++ b/Documentation/devicetree/bindings/common-properties.txt
@@ -5,30 +5,29 @@ Endianness
 ----------
 
 The Devicetree Specification does not define any properties related to hardware
-byteswapping, but endianness issues show up frequently in porting Linux to
+byte swapping, but endianness issues show up frequently in porting drivers to
 different machine types.  This document attempts to provide a consistent
-way of handling byteswapping across drivers.
+way of handling byte swapping across drivers.
 
 Optional properties:
  - big-endian: Boolean; force big endian register accesses
    unconditionally (e.g. ioread32be/iowrite32be).  Use this if you
-   know the peripheral always needs to be accessed in BE mode.
+   know the peripheral always needs to be accessed in big endian (BE) mode.
  - little-endian: Boolean; force little endian register accesses
    unconditionally (e.g. readl/writel).  Use this if you know the
-   peripheral always needs to be accessed in LE mode.
+   peripheral always needs to be accessed in little endian (LE) mode.
  - native-endian: Boolean; always use register accesses matched to the
    endianness of the kernel binary (e.g. LE vmlinux -> readl/writel,
-   BE vmlinux -> ioread32be/iowrite32be).  In this case no byteswaps
+   BE vmlinux -> ioread32be/iowrite32be).  In this case no byte swaps
    will ever be performed.  Use this if the hardware "self-adjusts"
    register endianness based on the CPU's configured endianness.
 
 If a binding supports these properties, then the binding should also
 specify the default behavior if none of these properties are present.
 In such cases, little-endian is the preferred default, but it is not
-a requirement.  The of_device_is_big_endian() and of_fdt_is_big_endian()
-helper functions do assume that little-endian is the default, because
-most existing (PCI-based) drivers implicitly default to LE by using
-readl/writel for MMIO accesses.
+a requirement.  Some implementations assume that little-endian is
+the default, because most existing (PCI-based) drivers implicitly
+default to LE for their MMIO accesses.
 
 Examples:
 Scenario 1 : CPU in LE mode & device in LE mode.
-- 
Sent by a computer through tubes
