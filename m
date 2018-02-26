From: frowand.list@gmail.com
Subject: [PATCH 0/6] of: remove kbasename() from core
Date: Sun, 25 Feb 2018 18:22:24 -0800
Message-ID: <1519611750-22355-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Struct device_node full_name no longer includes the full path
name.

Fix some broken overlay code that was not updated to reflect this.

Clean up the unittest changeset test that calls into this
overlay code.

kbasename(->full_name) is no longer needed, so remove kbasename()
from core devicetree code.

Removal of kbasename() is separated out into one patch per file
as much as possible to make bisection easier if a problem occurs.

Frank Rowand (6):
  of: unittest: clean up changeset test
  of: remove kbasename(of->full_name) from overlay related code
  of: remove kbasename(of->full_name) from base.c
  of: remove kbasename(of->full_name) from kobj.c
  of: remove kbasename(of->full_name) from of_reserved_mem.c
  of: remove kbasename(of->full_name) from platform.c

 drivers/of/base.c            |  4 ++--
 drivers/of/dynamic.c         | 21 +++++++++----------
 drivers/of/kobj.c            |  2 +-
 drivers/of/of_private.h      |  3 ++-
 drivers/of/of_reserved_mem.c |  4 +---
 drivers/of/overlay.c         |  8 ++------
 drivers/of/platform.c        |  2 +-
 drivers/of/resolver.c        |  5 +----
 drivers/of/unittest.c        | 48 +++++++++++++++++++++++++++++++++++---------
 9 files changed, 59 insertions(+), 38 deletions(-)

-- 
Frank Rowand <frank.rowand@sony.com>
