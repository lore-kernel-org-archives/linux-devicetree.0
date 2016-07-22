From: Steve Twiss <stwiss.opensource@diasemi.com>
Subject: [RFC] regulator: da9052/53: da9052-i2c.txt binding document changes
Date: Fri, 22 Jul 2016 10:35:55 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB70173DAC199@SW-EX-MBX02.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>
Cc: DEVICTREE <devicetree@vger.kernel.org>, LINUXKERNEL <linux-kernel@vger.kernel.org>, "Ying-Chun Liu (PaulLiu" <paul.liu@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Shawn Guo <shawn.guo@linaro.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

Hi,

The binding file for DA9052/53 exists in the kernel and was originally
submitted by Ying-Chun Liu from Linaro way back in 2012.

Documentation/devicetree/bindings/mfd/da9052-i2c.txt 
> git show 58d114b

The patch adds support for the Dialog MFD and it lists the compatible strings
"dlg,da9052", "dlg,da9053-aa", etc. in the driver code. But, it also lists
some regulator binding names for the two chips DA9052 and DA9053. These
regulator names are added to the binding document but not used in the driver,
also they are named incorrectly compared to the datasheets and Linux driver,
and are misleading and confusing.

+Sub-nodes:
+- regulators : Contain the regulator nodes. The DA9052/53 regulators are
+  bound using their names as listed below:
+
+    buck0     : regulator BUCK0
+    buck1     : regulator BUCK1
+    buck2     : regulator BUCK2
+    buck3     : regulator BUCK3
+    ldo4      : regulator LDO4
+    ldo5      : regulator LDO5
+    ldo6      : regulator LDO6
+    ldo7      : regulator LDO7
+    ldo8      : regulator LDO8
+    ldo9      : regulator LDO9
+    ldo10     : regulator LDO10
+    ldo11     : regulator LDO11
+    ldo12     : regulator LDO12
+    ldo13     : regulator LDO13


For example: 
 - ldo10 in this binding list is LDO7 in the driver and in our datasheet
 - ldo7  in this binding list is LDO4 in the driver and in our datasheet

The main problem, and my request for comment is this:

I understand these are supposed to be the definitive definitions, but they
are at best, confusing. They are also not used. I would like to support the
proper names for the regulators.

The easiest solution for me would be to delete the binding file and create a
new one with the correct bindings. But I am guessing this is probably
unacceptable? Is it?

diff --git a/Documentation/devicetree/bindings/mfd/da9052-i2c.txt b/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
deleted file mode 100644
index 1857f4a..0000000
--- a/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
+++ /dev/null
@@ -1,60 +0,0 @@
[... etc]

If not acceptable to anybody but me, then, a second option might be to support
two binding names at once, 'forget' the incorrect ones in the binding
documents, and implement two names in the driver code and make it backwards
compatible that way.

Because the names are interchangeable between datasheets/code and bindings,
ldo10 <-> ldo7 <-> ldo4, this is not quite possible, so I would need to rename
the new bindings to be something like "ldo_7" instead of "ldo7".

Are there any precedents for these sorts of change in the past?

I would really like to use the "ldo7" naming convention style instead of the
"ldo_7" (underscore style) because that matches up with our datasheets and the
Linux driver code, and all of our other regulator drivers currently in the
kernel, DA9062, D9063, etc. Therefore erasing the old regulator bindings would
be the best option for me.

Regards,
Steve
