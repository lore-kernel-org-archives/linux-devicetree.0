Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 0/5] Transaction DT support (v2)
Date: Fri,  4 Jul 2014 19:58:44 +0300
Message-Id: <1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

The following patchset introduces DT transactions as a core
dynamic DT feature.

A number of supporting patches preceed it, which introduce
the required infrastructure.

Changes since V1:
* Added an option for the non-freeing on of_node_release().
* Reworked the non-used methods for __of_* methods
* Reworked transactions as gcl asked - no more states,
and the live tree is not affected until the apply() call.
* Renamed commit() -> apply.
* Got rid of device_state_change.

Pantelis Antoniou (5):
  of: Do not free memory at of_node_release option
  OF: Export a number of __of_* methods
  OF: Utility helper functions for dynamic nodes
  of: Introduce tree change __foo_post methods.
  of: Transactional DT support.

 Documentation/devicetree/transactions.txt |  41 ++
 drivers/of/Makefile                       |   2 +-
 drivers/of/base.c                         | 171 +++++---
 drivers/of/dynamic.c                      | 281 +++++++++---
 drivers/of/of_private.h                   |  49 +++
 drivers/of/transaction.c                  | 699 ++++++++++++++++++++++++++++++
 include/linux/of.h                        |  91 ++++
 7 files changed, 1224 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/transactions.txt
 create mode 100644 drivers/of/transaction.c

-- 
1.7.12
