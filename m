From: Romain Izard <romain.izard.pro@gmail.com>
Subject: Device probing proceeds even when the default pinctrl state is invalid
Date: Thu, 18 Feb 2016 11:37:08 +0100
Message-ID: <CAGkQfmOHgOoFrVyKtB+vpmwqs5s2DnLay9zjaksFj5Rbn+4h0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linux GPIO List <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Linus,

The current code for device probing tries to map the default pinctrl
state (in pinctrl_bind_pins), but is returning 0 or -EDEFER. If there
is an other error, it is not reported. This means that devices that do
not have any specified pinctrl state can be probed, which is a correct
behaviour that should be conserved, but it can also be an issue, as it
will fail to report any other issue with the specified pinctrl state.

Did I miss something that would explain why all other errors are ignored ?

This also leads to a larger problem, as currently the device tree for
existing boards may specify invalid pinctrl configurations, but the
boards look like they work correctly, as long as nothing else tries to
use the same pins. Correcting the issue may require a new
'strict-mapping' property in the pinctrl node in the device tree,
otherwise this correction would be an ABI regression.

Is this pattern really a good one ? We're moving away from describing
hardware in here.

For an existing example, in the device tree for Atmel's
SAMA5D2_Xplained board, the mapping for the Ethernet transceiver's IRQ
line was missing it bias configuration, and thus the pins were not
reserved for the Ethernet use. I've just send a patch to correct it,
but breaking Ethernet on kernel upgrade for the boards using the
previous revisions would be an issue.

I encountered this problem because I wanted to model in device tree a
system where the main SoC running Linux is connected to a secondary
chip, using two different protocols on the same pins. Using the
SAMA5D2's pin muxing, the secondary chip can be accessed either by a
serial port in normal use, or by bitbanging on the multiplexed GPIOs
when programming it. I created two devices with conflicting pinctrl
configurations, expecting only one of them to be successfully probed,
and to use the "bind" and "unbind" sysfs files to select the correct
driver. Choosing which device to probe first on startup is an other
issue in this case, that remains to be addressed.

In the current state of things, both devices are probed successfully
as conflicting pin sets are not recognized as an issue, which means
that my use case does not work.

Is the direction I'm taking something correct ?

Best regards,
-- 
Romain Izard
