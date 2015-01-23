From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Associating nodes with phandles for pci devices
Date: Fri, 23 Jan 2015 19:02:33 +0000
Message-ID: <9bcf67ede60f4567a396c05578cfceb7@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-NZ
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org" <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I'm working on a new board that has a marvell,dsa switch. Similar to the kirkwood-mv88f6281gtw-ge board. However the major difference is that instead of being connected to an integrated Ethernet port it is connected via a PCI-e Ethernet port (basically a NIC hardwired onto the board).

Generally you don't need to define PCI devices in the .dts because the bus is scanned at run time and the method for identifying devices is well defined. But to satisfy the marvell,dsa binding[1] I need to tell it the Ethernet port it is connected to. The answer might be in the PCI bindings but the urls in the documentation[2] don't appear to be valid anymore.

Is it possible to enumerate PCI devices in the .dts? Or is there a way of satisfying the dsa requirements without knowing the Ethernet device?

Thanks,
Chris
--
[1] - http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/dsa/dsa.txt
[2] - http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/pci.txt--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
