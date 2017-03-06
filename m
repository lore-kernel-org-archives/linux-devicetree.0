From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 00/17] Move firmware specific code to firmware specific locations
Date: Mon,  6 Mar 2017 17:42:46 +0200
Message-ID: <1488814983-25695-1-git-send-email-sakari.ailus@linux.intel.com>
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

The set depends on the ACPI graph support v4 patches I posted a moment
ago.

The patches may be found with dependencies here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=acpi-graph-cleaned>

since v1:

- Move the three bugfixes in front of the set into a separate patchset.
  There are no dependencies to those from the rest of the patches.

- Rebase on current ACPI graph support patches (themselves on PM tree
  4.11-rc1 merge).

-- 
Kind regards,
Sakari

In-Reply-To: 

