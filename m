From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 00/20] Move firmware specific code to firmware specific locations
Date: Thu, 23 Feb 2017 19:00:56 +0200
Message-ID: <1487869276-25244-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
Cc: sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, mika.westerberg@linux.intel.com, rafael@kernel.org, mark.rutland@arm.com, broonie@kernel.org, robh@kernel.org, ahs3@redhat.com
List-Id: devicetree@vger.kernel.org

Hi,

This set moves firmware specific implementations of the device / fwnode
property API to locations that are specific to firmware implementation,
still leaving property set (which isn't really firmware) implementation in
drivers/base/property.c.

The set begins with a few bugfixes (patches 1--3), followed by adding
fwnode_operations struct and then gradually moving firmware dependent code
to drivers/acpi/property.c and drivers/of/base.c.

The set depends on the ACPI graph support here:

<URL:http://marc.info/?l=linux-acpi&m=148786716920942&w=2>

Comments are welcome.

-- 
Kind regards,
Sakari

