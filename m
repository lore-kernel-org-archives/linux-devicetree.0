From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Associating nodes with phandles for pci devices
Date: Mon, 26 Jan 2015 11:57:59 +0100
Message-ID: <1519004.ps1fNkyql1@wuerfel>
References: <9bcf67ede60f4567a396c05578cfceb7@svr-chch-ex1.atlnz.lc> <2275507.PY4WZcxUrf@wuerfel> <alpine.DEB.2.10.1501240828280.14228@chrisp-dl.ws.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1501240828280.14228-VJzQ50X1/JKjhWACt5bsBotlCAj8ZROq@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chrisp-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org" <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 24 January 2015 08:38:12 Chris Packham wrote:
> 
> Can you think of a good example. I found a few ppc boards that have an 
> PCI-ISA bridge that get's enumerated in the .dts. I think I can make sense
> of them but because they are bridges there's a lot of extra stuff for the 
> down stream devices.

I found a copy of the standard document at:

http://www.o3one.org/hwdocs/openfirmware/pci_supplement_2_1.pdf

I believe the only property we require in order to connect a Linux PCI
device to a device node is 'reg', which is in a very special format
for PCI devices, as there are three cells that encode all sorts of
information. In this case, you only need the 'device' and 'function'
bits to match. The bus numbers can be reassigned on probing the
buses, and the structure is implied by the device/function numbers of
the parents all the way up to the host bridge (if you have multiple
bridges at all).

Something like

	pci@1230000 {
		device_type = "pci";
		ranges = ...
		#address-cells = <3>;
		#size-cells = <2>;

		dsa@01,0 { /* device 1, function 0 */
			reg = <0x00000800 0 0  0 0>;
		};
		dsa@01,1 { /* device 1, function 1 */
			reg = <0x00000900 0 0  0 0>;
		};
	};

The above follows the "DD,F" naming for unit strings in PCI devices
as in section 2.2.1.2 of that document. If you only have one function,
this can be shortened to just the device number, which is in bits
11-15 of the first word of the reg property.

Note that the binding is meant to encode all the probing information,
so it documents how to represent everything from the config space
in properties, but we don't actually use that for probing in Linux
and instead rely on a very reduced interpretation of the binding.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
