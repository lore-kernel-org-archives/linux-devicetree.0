Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 0/4] OF: Dynamic fixes after re-org
Date: Mon, 28 Jul 2014 23:06:45 +0300
Message-Id: <1406578009-30154-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

After the recent re-organization of OF dynamic a small number of fixes
are required for the DT overlays to work (and any advanced user of the
new infrastructure.

Pantelis Antoniou (4):
  of: Only call notifiers when node is attached
  of: Add old prop argument on OF_RECONFIG_UPDATE_PROPERTY
  of: of_reconfig_get_state_change() of notifier helper.
  of: dynamic: Handle special properties changes

 drivers/of/base.c     |  35 +++++++++++--
 drivers/of/dynamic.c  | 135 ++++++++++++++++++++++++++++++++++++++++++--------
 drivers/of/selftest.c |   2 +-
 include/linux/of.h    |  21 +++++---
 4 files changed, 162 insertions(+), 31 deletions(-)

-- 
1.7.12
