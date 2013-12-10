From: Rajat Jain <rajatjain-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Subject: 3 Basic question about devicetrees
Date: Tue, 10 Dec 2013 07:40:36 +0000
Message-ID: <e5f7bc7e131b4e92a2d48597952a9eb5@DM2PR05MB671.namprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

I'm a newbie to devicetrees, and am trying to understand and create device tree for a new powerpc platform. My questions: 

1) For a PCI-PCI bridge that I'm representing like this:

pcie@2,3 {
	vendor-id = <0x10b5>;
      device-id = <0x8618>;
      class-code = <0x060400>;
      #size-cells = <2>;
      #address-cells = <3>;
      device_type = "pci";
      bus-range = <0x20 0x2f>;
      reg = <0x00021800 0x00000000 0x000000000        /* Cfg:2.3.0: */
             0x00000000 0x00000000>;
      ranges = <0x02000000 0x00000000 0xA0000000      /* Mem behind bridge: 0xA0000000 - 0xA03FFFFF */
                0x02000000 0x00000000 0xA0000000
                0x00000000 0x04000000>;
};

Is the above is only to _notify_ the kernel that this is how the firmware shall be setting the PCI bridge (Thus firmware has obligation of setting it like this before passing control to the kernel), and hence the kernel will merely take note of it? 

Or is the above telling the kernel that this is how the kernel should _setup_ the device (thus firmware does not set up the device, but rather the kernel use this info to setup the device)?

2) For an PCI endpoint that I am representing like this:


xyz@20,0 {
	vendor-id = ...
      device-id = ...
      class-code = <0x0880>;
      compatible = ...
	...
      reg = <0x00200000 0x00000000 0x00000000 /* Cfg:20.0.0: */
             0x00000000 0x00000000
             0x02200010 0x00000000 0xA0000000 /* Mem:20.0.0:(Bar0) 64MB@0xA0000000 */
             0x00000000 0x04000000>;
	...
};

Does the above tell the kernel to _program_ the BAR0 register using the above address? Or does it cause the kernel to assume that the BAR0 has been programmed with this address?

3) Lastly, what is the difference in behavior when I select PCI_PROBE_NORMAL over PCI_PROBE_DEVTREE? 

Thanks,

Rajat

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
