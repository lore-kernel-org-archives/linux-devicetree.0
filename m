From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH v2 0/2] of: Dynamic DT updates
Date: Wed, 16 Sep 2015 19:11:04 +0300
Message-ID: <1442419866-4982-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

The two patches add a new API for using changeset which
makes things considerably easier.

This patchset applies against Linus's tree as of today and
is dependent on the previous patchset I've send out earlier.
"of: overlay: kobject & sysfs'ation"

Changes since v1:
* Dropped the indirect and target root patches until we
figure out what to do with the DT connector.

Pantelis Antoniou (2):
  of: dynamic: Add __of_node_dupv()
  of: changesets: Introduce changeset helper methods

 drivers/of/dynamic.c | 280 +++++++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/of.h   |  74 ++++++++++++++
 2 files changed, 348 insertions(+), 6 deletions(-)

-- 
1.7.12
