From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/4] of: Convert to using %pOFn for node name printf
Date: Tue, 28 Aug 2018 10:52:50 -0500
Message-ID: <20180828155254.10709-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is the DT portion of converting node name printf's to use the 
%pOFn format specifier rather than device_node.name. Patches for other 
subsystems are independent and have been sent separately.

Rob

Rob Herring (4):
  of/unittest: remove use of node name pointer in overlay high level
    test
  of/unittest: add printf tests for node name
  of: Convert to using %pOFn instead of device_node.name
  vsprintf: print OF node name using full_name

 drivers/of/device.c   |  4 ++--
 drivers/of/of_mdio.c  | 12 ++++++------
 drivers/of/of_numa.c  |  4 ++--
 drivers/of/overlay.c  |  4 ++--
 drivers/of/platform.c |  8 ++++----
 drivers/of/unittest.c | 26 ++++++++++++++++----------
 lib/vsprintf.c        |  9 +++++++--
 7 files changed, 39 insertions(+), 28 deletions(-)

-- 
2.17.1
