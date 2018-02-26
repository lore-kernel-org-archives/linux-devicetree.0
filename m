From: frowand.list@gmail.com
Subject: [PATCH v2 0/2] of: remove kbasename() from core
Date: Mon, 26 Feb 2018 14:01:21 -0800
Message-ID: <1519682483-19828-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

(One line description of patch 0/2 is now misleading, but leaving
intact to make it easier to find v1.  One line description of other
patches updated as they will be part of the git commit record.)

Struct device_node full_name no longer includes the full path
name.

Fix some broken overlay code that was not updated to reflect this.

Clean up the unittest changeset test that calls into this
overlay code.

Version 1 of this patch removed kbasename() for other parts of
core devicetree code.  But Geert kindly pointed out that a
devicetree created from Open Firmware (instead from an FDT)
could still contain a full path in the struct device_node
full_path field.  This version (v2) of the patch leaves
kbasename() in place where needed.

Changes since v1:
  - update patch 2/2 one-line description and full description
  - no longer remove kbasename from resolver.c
  - add_changeset_node(): add back kbasename() when comparing nodes
    in the livetree against nodes in the overlay
  - add_changeset_node(): add header comments to document assumptions
    and behavior, and to explain why kbasename() is used
  
Frank Rowand (2):
  of: unittest: clean up changeset test
  of: overlay: do not include path in full_name of added nodes

 drivers/of/dynamic.c    | 21 ++++++++++-----------
 drivers/of/of_private.h |  3 ++-
 drivers/of/overlay.c    | 18 +++++++++++++++---
 drivers/of/unittest.c   | 48 +++++++++++++++++++++++++++++++++++++++---------
 4 files changed, 66 insertions(+), 24 deletions(-)

-- 
Frank Rowand <frank.rowand@sony.com>
