Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 0/3] Generic OF infrastructure fixes
Date: Fri,  4 Jul 2014 19:58:01 +0300
Message-Id: <1404493084-8832-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

This patchset includes a number of OF infrastructure fixes &
improvements. It paves the way for DT transaction & overlays.

Note that earlier version of the patch have been posted, but
this patchset is tested.

Grant Likely (2):
  of: platform: Fix and export of_platform_device_destroy
  of: Move CONFIG_OF_DYNAMIC code into a separate file

Pantelis Antoniou (1):
  of: rename of_aliases_mutex to just of_mutex

 drivers/of/Makefile         |   1 +
 drivers/of/base.c           | 251 ++------------------------------------------
 drivers/of/device.c         |   4 +-
 drivers/of/dynamic.c        | 221 ++++++++++++++++++++++++++++++++++++++
 drivers/of/of_private.h     |  28 ++++-
 drivers/of/platform.c       |  32 ++----
 include/linux/of.h          |  28 ++++-
 include/linux/of_platform.h |   7 +-
 8 files changed, 300 insertions(+), 272 deletions(-)
 create mode 100644 drivers/of/dynamic.c

-- 
1.7.12
