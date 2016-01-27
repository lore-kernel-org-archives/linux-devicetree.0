From: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/2] regulator: act8945a: add regulator driver for the sub-device of ACT8945A MFD
Date: Wed, 27 Jan 2016 10:57:41 +0800
Message-ID: <1453863463-30515-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Korsgaard <jacmet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ACT8945A is a Multi Function Device with the following subdevices:
 - Regulator
 - Charger

This patch set is to add regulator driver for ACT8945A.
It is based on the patch set:
	http://lists.infradead.org/pipermail/linux-arm-kernel/2016-January/402199.html

Changes in v4:
 - change the name "act8945a-pmic" to "act8945a-regulator"
   to align mfd subdevice's name.

Changes in v3:
 - use the core regulators_node and of_match implementation,
   remove the redundant code.
 - use the core dev_get_regmap(dev->parent) code, remove
   the redundant code.
 - change the regulator name to easily implement macro.
 - use a space after #define, not tabs.
 - add OF match table.

Changes in v2:
 - add more help information in Kconfig.
 - update the file header with short version license and author line.
 - remove unused structure, struct act8945a_pmic.
 - substitute of_property_read_bool() for of_get_property().
 - due to removing the member of stuct act8945a_dev, dev.
 - remove the unnecessary print out.
 - use module_platform_driver(), instead of subsys_initcall().
 - substitute MODULE_LICENSE("GPL") for MODULE_LICENSE("GPL v2").
 - add Acked-by Rob Herring.

Wenyou Yang (2):
  regulator: act8945a: add regulator driver for ACT8945A
  regulator: add documentation for ACT8945A's regulator DT bindings

 .../bindings/regulator/act8945a-regulator.txt      |   78 +++++++++
 drivers/regulator/Kconfig                          |    9 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/act8945a-regulator.c             |  172 ++++++++++++++++++++
 4 files changed, 260 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/act8945a-regulator.txt
 create mode 100644 drivers/regulator/act8945a-regulator.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
