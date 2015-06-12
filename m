From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 0/8] of: Dynamic DT updates
Date: Fri, 12 Jun 2015 22:54:57 +0300
Message-ID: <1434138905-15886-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

This patchset introduces several concepts that make
working with dynamic DT and overlays considerably easier.

The first 6 patches introduce two new overlay target methods
addressing various user complaints and use cases. For both
documentation entries and unittests are provided.

The final two patches add a new API for using changeset which
makes things considerably easier.

This patchset applies against Linus's tree as of today and
is dependent on the previous patchset I've send out earlier.
"of: overlay: kobject & sysfs'ation"

Pantelis Antoniou (8):
  of: overlay: Implement indirect target support
  of: unittest: Add indirect overlay target test
  doc: dt: Document the indirect overlay method.
  of: overlay: Introduce target root capability.
  of: unittest: Unit-tests for target root overlays.
  doc: dt: Document the target root overlay method
  of: dynamic: Add __of_node_dupv()
  of: changesets: Introduce changeset helper methods

 Documentation/devicetree/overlay-notes.txt  |  21 +++
 drivers/of/dynamic.c                        | 280 +++++++++++++++++++++++++++-
 drivers/of/overlay.c                        | 219 +++++++++++++++++++---
 drivers/of/unittest-data/testcases.dts      |  14 ++
 drivers/of/unittest-data/tests-overlay.dtsi |  67 +++++++
 drivers/of/unittest.c                       | 272 +++++++++++++++++++++++++++
 include/linux/of.h                          |  89 +++++++++
 7 files changed, 929 insertions(+), 33 deletions(-)

-- 
1.7.12
