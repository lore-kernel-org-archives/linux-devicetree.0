Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28621 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751878Ab3HUQxu (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 12:53:50 -0400
From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 0/2] max77693: added device tree support
Date: Wed, 21 Aug 2013 18:53:32 +0200
Message-id: <1377104014-21910-1-git-send-email-a.hajda@samsung.com>
Sender: devicetree-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

The first patch cleans up the driver from unneccesary
wakeup handling.
The second patch adds device tree support to the driver.

Regards
Andrzej

Andrzej Hajda (2):
  max77693: remove device wakeup from driver
  max77693: added device tree support

 drivers/mfd/max77693.c               | 18 ++++++++----------
 include/linux/mfd/max77693-private.h |  1 -
 include/linux/mfd/max77693.h         |  2 --
 3 files changed, 8 insertions(+), 13 deletions(-)

-- 
1.8.1.2

