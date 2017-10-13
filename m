From: Thomas Meyer <thomas@m3y3r.de>
Subject: of: unittest fails on UML
Date: Sat, 14 Oct 2017 00:38:29 +0200
Message-ID: <20171013223829.x2h55jl2l3mttepr@olymp>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

drivers/of/unittest.c fails on UML with a kernel crash.
The crash is due to of_find_device_by_node() returning NULL:

841│         /* Test that a missing irq domain returns -EPROBE_DEFER */
842│         np = of_find_node_by_path("/testcase-data/testcase-device1");
843├>        pdev = of_find_device_by_node(np);
844│         unittest(pdev, "device 1 creation failed\n");
845│
846│         irq = platform_get_irq(pdev, 0);
847│         unittest(irq == -EPROBE_DEFER, "device deferred probe failed - %d\n", irq);

in line 846 platform_get_irq is called with NULL.

This helps to get through unittest.c:

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index d1bd99271066..a3b3d0ec8818 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -86,6 +86,9 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
  */
 int platform_get_irq(struct platform_device *dev, unsigned int num)
 {
+	if (!dev)
+		return -ENXIO;
+
 #ifdef CONFIG_SPARC
 	/* sparc does not have irqs represented as IORESOURCE_IRQ resources */
 	if (!dev || num >= dev->archdata.num_irqs)

log extract:

[   24.850000] kobject: 'fragment@0' (000000006c818aa8): kobject_add_internal: parent: 'overlay4', set: 'devicetree'
[   24.850000] ### dt-test ### start of unittest - you will see error messages
[   24.850000] OF: /testcase-data/phandle-tests/consumer-a: could not get #phandle-cells-missing for /testcase-data/phandle-tests/provider1
[   24.860000] OF: /testcase-data/phandle-tests/consumer-a: could not get #phandle-cells-missing for /testcase-data/phandle-tests/provider1
[   24.860000] OF: /testcase-data/phandle-tests/consumer-a: could not find phandle
[   24.860000] OF: /testcase-data/phandle-tests/consumer-a: could not find phandle
[   24.860000] OF: /testcase-data/phandle-tests/consumer-a: arguments longer than property
[   24.860000] OF: /testcase-data/phandle-tests/consumer-a: arguments longer than property
[   24.860000] kobject: 'n1' (000000006cefca50): kobject_add_internal: parent: 'changeset', set: 'devicetree'
[   24.860000] kobject: 'n2' (000000006cefde30): kobject_add_internal: parent: 'changeset', set: 'devicetree'
[   24.860000] kobject: 'n21' (000000006cefcda0): kobject_add_internal: parent: 'n2', set: 'devicetree'
[   24.860000] kobject: 'node-remove' (000000006c800880): kobject_add_internal: parent: 'changeset', set: 'devicetree'
[   24.860000] kobject: 'n21' (000000006cefcda0): kobject_release, parent           (null) (delayed 400)
[   24.860000] kobject: 'n2' (000000006cefde30): kobject_release, parent           (null) (delayed 100)
[   24.860000] kobject: 'n1' (000000006cefca50): kobject_release, parent           (null) (delayed 300)
[   24.860000] ### dt-test ### FAIL of_unittest_platform_populate():844 device 1 creation failed
[   24.860000] ### dt-test ### FAIL of_unittest_platform_populate():847 device deferred probe failed - -6
[   24.860000] ### dt-test ### FAIL of_unittest_platform_populate():852 device 2 creation failed
[   24.860000] Registering platform device 'unittest-bus.0'. Parent at platform
[   24.860000] device: 'unittest-bus.0': device_add
[   24.860000] kobject: 'unittest-bus.0' (000000006cf11568): kobject_add_internal: parent: 'platform', set: 'devices'
[   24.860000] bus: 'platform': add device unittest-bus.0
[   24.860000] kobject: 'unittest-bus.0' (000000006cf11568): kobject_uevent_env
[   24.860000] kobject: 'unittest-bus.0' (000000006cf11568): fill_kobj_path: path = '/devices/platform/unittest-bus.0'
[   24.860000] ### dt-test ### FAIL of_unittest_platform_populate():882 Could not create device for node 'dev'
[   24.860000] ### dt-test ### FAIL of_unittest_platform_populate():882 Could not create device for node 'dev'
[   24.860000] bus: 'platform': remove device unittest-bus.0
[   24.860000] kobject: 'unittest-bus.0' (000000006cf11568): kobject_uevent_env
[   24.860000] kobject: 'unittest-bus.0' (000000006cf11568): fill_kobj_path: path = '/devices/platform/unittest-bus.0'
[   24.860000] kobject: 'unittest-bus.0' (000000006cf11568): kobject_release, parent           (null) (delayed 100)
[   24.860000] bus: 'platform': add driver unittest
[   24.860000] kobject: 'unittest' (000000006c86bba8): kobject_add_internal: parent: 'drivers', set: 'drivers'
[   24.870000] kobject: 'unittest' (000000006c86bba8): kobject_uevent_env
[   24.870000] kobject: 'unittest' (000000006c86bba8): fill_kobj_path: path = '/bus/platform/drivers/unittest'
[   24.870000] ### dt-test ### FAIL of_unittest_overlay():1944 could not populate bus @ "/testcase-data/overlay-node/test-bus"
[   24.870000] ### dt-test ### FAIL of_unittest_overlay_high_level():2201 overlay_base_root not initialized
[   24.870000] ### dt-test ### end of unittest - 163 passed, 7 failed

so any idea what is going on here?
any help is appreciated.

with kind regards
thomas
