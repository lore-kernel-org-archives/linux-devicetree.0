From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: AXP803 I2C support / AXP devicetree-bindings
Date: Mon, 6 Nov 2017 23:39:06 +0100
Message-ID: <CAFBinCAm8pA-dh3+T4Ui+DvLv5C17Zup-FN8pvi0cUa5PgwJJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

recently I discovered that there are some X-Powers AXP chips that
support both, Allwinner's own "RSB" as well as the I2C ("TWSI" in the
datasheet) busses.

one chip that supports both interfaces is the AXP803
the datasheet is linked in the public PINE64 wiki: [1] (direct link: [0])

currently the "x-powers,axp803" binding is "RSB" bus specific as it's
currently only listed in drivers/mfd/axp20x-rsb.c

was there a discussion about supporting both, the "RSB" and I2C bus
for one chip (for example the AXP803) in the past (I couldn't find
anything online)?
what about the device-tree bindings in this case?


Regards
Martin


[0] http://files.pine64.org/doc/datasheet/pine64/AXP803_Datasheet_V1.0.pdf
[1] http://wiki.pine64.org/index.php/PINE_A64_Main_Page#Datasheets_for_Components_and_Peripherals
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
