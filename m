From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 0/2] media: adv7604: fix default-input property inconsistencies
Date: Thu, 22 Sep 2016 15:18:58 +0200
Message-ID: <1474550340-31455-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: hans.verkuil@cisco.com
Cc: niklas.soderlund@ragnatech.se, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com, ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, william.towle@codethink.co.uk, devicetree@vger.kernel.org, radhey.shyam.pandey@xilinx.com
List-Id: devicetree@vger.kernel.org

Hi!

This is a fix for the inconsistency in the adv7604 bindings regarding the
default-input property, clarifying that it should be a property of the
device, not the endpoint, and a patch to implement it.

This revision implements Laurent's suggestions:

- The default input should not be set if the default-input property is missing.
- The old code for parsing the property in the endpoint node can be removed.
- The rationale for the change should go in the commit message.

CU
Uli


Ulrich Hecht (2):
  media: adv7604: fix bindings inconsistency for default-input
  media: adv7604: automatic "default-input" selection

 Documentation/devicetree/bindings/media/i2c/adv7604.txt | 3 +--
 drivers/media/i2c/adv7604.c                             | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

-- 
2.7.4
