From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH v2 0/6]  of: overlays: New target methods
Date: Mon, 16 May 2016 23:18:06 +0300
Message-ID: <1463429892-3369-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

This patchset implements two new target methods.

A target index method which allows selecting different
targets according to an argument using an extended API and
a target root method that fences the target only
to a specific given root.

Documentation and unit-tests are included.

Changes since v1:
* Addressed reviewer comments.
* Converted target_indirect to target_index

Pantelis Antoniou (6):
  of: overlay: Implement target index support
  of: unittest: Add indirect overlay target test
  doc: dt: Document the indirect overlay method.
  of: overlay: Introduce target root capability.
  of: unittest: Unit-tests for target root overlays.
  doc: dt: Document the target root overlay method

 Documentation/devicetree/overlay-notes.txt  |  22 ++-
 drivers/of/overlay.c                        | 158 +++++++++++++---
 drivers/of/unittest-data/testcases.dts      |  10 +
 drivers/of/unittest-data/tests-overlay.dtsi |  63 +++++++
 drivers/of/unittest.c                       | 273 ++++++++++++++++++++++++++++
 include/linux/of.h                          |  16 ++
 6 files changed, 517 insertions(+), 25 deletions(-)

-- 
1.7.12
