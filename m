From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/6] extcon-gpio: Add devicetree support
Date: Thu, 29 Aug 2013 21:29:32 -0700
Message-ID: <1377836978-24082-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Grant Likely <grant.likely@linaro.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

The first three patches of this series are either cleanup or add functionality
unrelated to devicetree support and should hopefully be acceptable as-is or with
minor modifications.

Patch 1 of this series is a tiny cleanup patch.
Patch 2 adds support for hardware debounce. If the gpio chip supports debounce,
use it instead of software debounce.
Patch 3 adds support for low-active presence detect signals.

Patch 4 and 5 add devicetree support. Patch 4 is the actual code and patch 5
describes devicetree bindings. Both could possibly be merged into a single
patch.

Patch 6 adds possible properties for connectors supporting multiple cable
types to the devicetree bindings document. This is purely for discussion
and would be implemented in a separate patch. While I don't need this code
for our application, I would be happy to provide it if the community sees
value in it.
