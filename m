From: Michael Haas <haas@computerlinguist.org>
Subject: [PATCH v3 0/6] Add axp20x-ac power driver
Date: Thu,  5 May 2016 12:35:03 +0200
Message-ID: <1462444508-9363-1-git-send-email-haas@computerlinguist.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, maxime.ripard@free-electrons.com, wens@csie.org, lee.jones@linaro.org, sre@kernel.org, dbaryshkov@gmail.com, dwmw2@infradead.org
Cc: hdegoede@redhat.com, bonbons@linux-vserver.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux@arm.linux.org.uk, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

This version of the axp20x-ac driver hopefully cleans up all issues
found in version 1.

I have enabled the AC and USB power supply drivers in axp209.dtsi as
suggested by Maxime Ripard and Chen-Yu Tsai

Changes in v3:

* Move register definitions back from MFD header to driver itself
* Globally enable AC power supply driver in axp209.dtsi
* Additionally enable USB power supply driver in axp209.dtsi
* Fix formatting and ordering issues noted by Chen-Yu Tsai
* Drop Rob Herring's ACKED-BY on the binding documentation patch as I have
  simplified the example

Changes in v2:

* Remove check for shortcut between AC and USB
* Remove logging in interrupt handler


