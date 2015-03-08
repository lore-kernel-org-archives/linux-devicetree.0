From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Associating nodes with phandles for pci devices
Date: Sun, 08 Mar 2015 23:42:50 +0100
Message-ID: <4974230.GyVpHqdJU9@wuerfel>
References: <9bcf67ede60f4567a396c05578cfceb7@svr-chch-ex1.atlnz.lc> <54C2CDE6.8090400@openwrt.org> <54FCC6AC.4030202@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54FCC6AC.4030202-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday 08 March 2015 22:01:17 Chris Packham wrote:
> 
> >
> > BTW, one thing that is high in my TODO list regarding DSA is to stop
> > using this platform device/driver architecture and use the actual device
> > driver model. Your switch driver entry point would be a pci_drive
> > probe's function where you end-up registering a switch the DSA. This
> > should solve portions of your problem although this is a long shot as we
> > need to convert existing drivers as well.
> >
> 
> My current problem is that of_find_device_by_node() (called by 
> dsa_of_probe) can't find the device. After a bit of debugging I can see 
> that the populated platform bus only goes as far as 
> /soc/pcie-controller, anything beyond that seems to be missing. I can't 
> see anything obvious in of_platform_bus_create() that would actually 
> stop it from continuing down the pcie-controller branch provided the dts 
> actually enumerates the children.
> 
> Any suggestions?

The PCI devices are not populated by of_platform_bus_create. Instead,
pci_scan_device() calls pci_set_of_node() to set the of_node
pointer for each PCI device.

This would fail for instance if the root bus does not have a correct
of_node pointer.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
