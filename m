From: Michael Haas <haas@computerlinguist.org>
Subject: [PATCH v2 0/6] Add axp20x-ac power driver
Date: Sun,  1 May 2016 10:57:21 +0200
Message-ID: <1462093047-7885-1-git-send-email-haas@computerlinguist.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, maxime.ripard@free-electrons.com, wens@csie.org, lee.jones@linaro.org, sre@kernel.org, dbaryshkov@gmail.com, dwmw2@infradead.org
Cc: degoede@redhat.com, bonbons@linux-vserver.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux@arm.linux.org.uk, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

This version of the axp20x-ac driver hopefully cleans up all issues
found in version 1.

Major changes:

* Remove check for shortcut between AC and USB
* Remove logging in interrupt handler


