From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 0/4]  of: dynamic: Changesets helpers & fixes
Date: Mon,  9 May 2016 16:20:41 +0300
Message-ID: <1462800045-10943-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

This patchset introduces changeset helpers which makes working with
changeset much easier and less error prone.

The first patch fixes a bug when using an update property changeset operation
but the property does not exist.

The second exports an internal method which is used for the third patch
which contains the bulk of the changes.

Finally the last patch adds a unittest for the changeset helpers.

Pantelis Antoniou (4):
  of: dynamic: changeset prop-update revert fix
  of: dynamic: Add __of_node_dupv()
  of: changesets: Introduce changeset helper methods
  of: unittest: changeset helpers

 drivers/of/dynamic.c  | 535 +++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/of/unittest.c |  54 +++++
 include/linux/of.h    | 143 ++++++++++++++
 3 files changed, 726 insertions(+), 6 deletions(-)

-- 
1.7.12
