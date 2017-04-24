From: frowand.list@gmail.com
Subject: [PATCH 0/3] of: fix overlay modification of const variable
Date: Sun, 23 Apr 2017 22:20:01 -0700
Message-ID: <1493011204-27635-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, stephen.boyd@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

When adjusting overlay phandles to apply to the live device tree, can
not modify the property value because it is type const.
    
This is to resolve the issue found by Stephen Boyd [1] when he changed
the type of struct property.value from void * to const void *.  As
a result of the type change, the overlay code had compile errors
where the resolver updates phandle values.
    
  [1] http://lkml.iu.edu/hypermail/linux/kernel/1702.1/04160.html

Patch 1 fixes the const variable problem.

Patches 2 and 3 are minor fixups for issues that became visible
while implementing patch 1.

Frank Rowand (3):
  of: overlay_adjust_phandles() - do not modify const field
  of: make __of_attach_node() static
  of: detect invalid phandle in overlay

 drivers/of/base.c       |  4 ++--
 drivers/of/dynamic.c    | 30 ++++++++++++++++++++++-------
 drivers/of/of_private.h |  4 +++-
 drivers/of/overlay.c    |  4 ++++
 drivers/of/resolver.c   | 51 ++++++++++++++++++++++++++++++-------------------
 5 files changed, 63 insertions(+), 30 deletions(-)

-- 
Frank Rowand <frank.rowand@sony.com>
