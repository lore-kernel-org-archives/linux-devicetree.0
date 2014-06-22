Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 0/6] OF: Fixes preparing transactions/overlays
Date: Sun, 22 Jun 2014 12:40:33 +0300
Message-Id: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

This patchset series fixes general issues that have to do
with preparing for the introduction of transactions and overlays.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>

Pantelis Antoniou (6):
  of: Do not free memory at of_node_release
  OF: Add [__]of_find_node_by_full_name
  of: platform: Fix and export of_platform_device_destroy
  OF: Export a number of __of_* methods
  OF: Utility helper functions for dynamic nodes
  of: Introduce tree change __foo_post methods.

 drivers/of/Makefile         |   2 +-
 drivers/of/base.c           | 363 +++++++++++++++++++++++++++++---------------
 drivers/of/platform.c       |  11 +-
 drivers/of/util.c           | 141 +++++++++++++++++
 include/linux/of.h          |  87 +++++++++++
 include/linux/of_platform.h |   2 +
 6 files changed, 485 insertions(+), 121 deletions(-)
 create mode 100644 drivers/of/util.c

-- 
1.7.12
