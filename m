From: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
Subject: Device tree vs hardware configurations
Date: Tue, 23 Sep 2014 21:58:08 +0400
Message-ID: <5421B4B0.1020306@dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gennady Kuznetsov <kuznetsovg-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>, Aleksey Makarov <amakarov-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi

I'm currently forward-porting a BSP for imx6-based custom board from 
pre-devicetree kernel to modern kernel.

In old BSP there was a board setup file, that registered all board's 
devices. For new BSP, I need to replace that with device tree based 
solution.

However, old BSP used conditional code to register devices differently 
based on GPIO inputs and on kernel command line. This approach was used to

- handle board's jumper that switches SPI CS lines: current jumper 
setting is available over gpio, depending on that old BSP registered 
chips differently,

- handle different i2c connections on different board revisions: board 
has 5 i2c busses with quite a few devices connected, these busses are 
routed to different hardware busses on different board revisions, board 
revision could be read over gpios.

- handle different possible display connections (lvds vs lcd, 6bit vs 
8bit hw interface) based on kernel command line options

- handle different possible camera connections by registered camera 
differently based on kernel command line option

... and more,


Device tree describes hardware unconditionally. I already have to 
provide 2 dts files for imx6q and imx6dl based setups (both just include 
a common dtsi) ...  But providing separate dts file for every possible 
hardware configuration will result into 2^n device trees, which is 
inconvenient visible regression against old BSP that "just worked" on 
all hardware configurations.


Is there a sane way to handle hardware configurations like above in 
device tree based kernel?


Nikita Yushchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
