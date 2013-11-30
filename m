From: Sebastian Reichel <sre@debian.org>
Subject: [PATCHv4 0/2] twl4030-keypad DT binding
Date: Sat, 30 Nov 2013 17:53:34 +0100
Message-ID: <1385830416-12900-1-git-send-email-sre@debian.org>
References: <1383948866-32672-1-git-send-email-sre@debian.org>
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1383948866-32672-1-git-send-email-sre@debian.org>
Sender: linux-input-owner@vger.kernel.org
To: Sebastian Reichel <sre@ring0.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Dmitry Torokhov <dtor@mail.ru>, linux-input@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sre@debian.org>
List-Id: devicetree@vger.kernel.org

Hi,

Add device tree support for the twl4030 keypad, which is
for example used in the Nokia N900.

Changes since v3 [0]:
 * Removed support for disabling autorepeat via DT. There
   is still discussion going on, how the standard binding
   should look like. On the other hand everyone agrees,
   that autorepeat should be default for keypads.
 * Remove useless twl4030_keypad_dt_match

[0] https://lkml.org/lkml/2013/11/8/463

-- Sebastian

Sebastian Reichel (2):
  Input: twl4030-keypad - add device tree support
  dt: binding documentation for twl4030-keypad

 .../devicetree/bindings/input/twl4030-keypad.txt   | 27 +++++++++
 drivers/input/keyboard/twl4030_keypad.c            | 65 ++++++++++++++++------
 2 files changed, 75 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/twl4030-keypad.txt

-- 
1.8.4.3

