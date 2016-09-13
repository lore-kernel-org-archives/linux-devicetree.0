From: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Subject: Re: [PATCH 6/8 v2] arm: orion5x: Add DT-based support for Netgear
 WNR854T
Date: Tue, 13 Sep 2016 10:10:41 +0100
Message-ID: <88e40f0c6cafec244dc16af5a03cfb44@jamie.lentin.co.uk>
References: <1472203264-21089-7-git-send-email-jm@lentin.co.uk>
 <1473109646-23366-1-git-send-email-jm@lentin.co.uk>
 <20160912170625.GA7420@rob-hp-laptop> <2920481.EgEQnLmOkM@wuerfel>
 <20160912220344.GM11400@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160912220344.GM11400-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-09-12 23:03, Andrew Lunn wrote:
>> Maybe we can instead leave out the PCI support from the new
>> file for now and not delete the legacy board file?

This seems a reasonable compromise. The PCI card the router comes with 
isn't supported by mwl8k mainline anyway (There's STA-only firmware that 
can be extracted from a windows driver and PCI IDs added, but stats 
reporting uses a different format), so it's not a huge loss, although 
many did replace the card with something Atheros-based.

Unfortunately the power regulator on my spare router has stopped 
regulating, which will make more development tricky. But will have a 
look at the PCI conversion if I can get hold of another.

> Jamie, which interrupt do you see the WiFi card using?  If it is
> IRQ_ORION5X_PCIE0_INT, (1 + 11), that is probably easier to deal with
> than if it uses GPIO 4.

Definitely uses GPIO 4.

# cat /proc/interrupts
            CPU0
  17:     165966  bridge-interrupt-ctrl   2 Edge      orion_event
  22:       5119  interrupt-controller   3 Edge      serial
  24:          0  bridge-interrupt-ctrl   3 Edge      orion_wdt
  25:      89504  interrupt-controller  22 Edge      f1072004.mdio-bus
  28:          1  f1010100.gpio   1 Edge      Reset Button
  31:        598  f1010100.gpio   4 Level     mwl8k
  59:        985  interrupt-controller  21 Edge      eth0
Err:          0
# iw dev wlan0 scan > /dev/null ; cat /proc/interrupts
            CPU0
  17:     166424  bridge-interrupt-ctrl   2 Edge      orion_event
  22:       5250  interrupt-controller   3 Edge      serial
  24:          0  bridge-interrupt-ctrl   3 Edge      orion_wdt
  25:      89748  interrupt-controller  22 Edge      f1072004.mdio-bus
  28:          1  f1010100.gpio   1 Edge      Reset Button
  31:        708  f1010100.gpio   4 Level     mwl8k
  59:        985  interrupt-controller  21 Edge      eth0
Err:          0
# sleep 10 ; cat /proc/interrupts
            CPU0
  17:     167985  bridge-interrupt-ctrl   2 Edge      orion_event
  22:       5349  interrupt-controller   3 Edge      serial
  24:          0  bridge-interrupt-ctrl   3 Edge      orion_wdt
  25:      90603  interrupt-controller  22 Edge      f1072004.mdio-bus
  28:          1  f1010100.gpio   1 Edge      Reset Button
  31:        708  f1010100.gpio   4 Level     mwl8k
  59:        995  interrupt-controller  21 Edge      eth0
Err:          0
# iw dev wlan0 scan > /dev/null ; cat /proc/interrupts
            CPU0
  17:     168270  bridge-interrupt-ctrl   2 Edge      orion_event
  22:       5480  interrupt-controller   3 Edge      serial
  24:          0  bridge-interrupt-ctrl   3 Edge      orion_wdt
  25:      90727  interrupt-controller  22 Edge      f1072004.mdio-bus
  28:          1  f1010100.gpio   1 Edge      Reset Button
  31:        818  f1010100.gpio   4 Level     mwl8k
  59:        996  interrupt-controller  21 Edge      eth0
Err:          0

> 
> Thanks
>      Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
