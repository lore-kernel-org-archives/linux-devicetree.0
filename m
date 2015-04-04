From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: USB device nodes in device tree
Date: Sun, 05 Apr 2015 01:48:13 +0200
Message-ID: <2088925.D3DrPCc17B@wuerfel>
References: <Pine.LNX.4.44L0.1503301534050.1407-100000@iolanthe.rowland.org> <552036B4.9050405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <552036B4.9050405-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 04 April 2015 12:08:36 Florian Fainelli wrote:
> Le 30/03/2015 12:35, Alan Stern a =E9crit :
> > On Mon, 30 Mar 2015, Valentin Longchamp wrote:
> >=20
> >> Hello,
> >>
> >> We are currently developing a board with an USB MFD device (I2C an=
d GPIOs are to
> >> be supported). The device is soldered on the board and is the only=
 one on the
> >> bus, so the bus is not really "dynamic".
> >>
> >> Since it's an USB device, it should be dynamically detected by the=
 kernel and it
> >> would not require a node in the board's DTS. However, I need to ha=
ve the devices
> >> which are "behind" the MFD USB device to be in the DTS (I2C bus to=
pology, and
> >> some of the GPIOs are to be used directly by some other DTS nodes =
as well).
> >>
> >> Is there a way to add a node for USB device in a DTS ? Is there an=
 available
> >> example for this ?
> >=20
> > No, there is no way to do it as far as I know.  The main problem is=
=20
> > that Device Tree is static whereas USB devices are dynamic.
>=20
> The PCI(e) bus has the same problem, yet you can specify a PCI device
> child node, and have a compatible string which will match the vendor
> id/device id tuple, device class etc... such that you can use Device
> Tree to add additional information not necessarily available in other
> ways such as MAC addresses and similar.
>=20
> Once the PCI bus is scanned, pci_device present in Device Tree get a
> device_node pointer assigned.
>=20
> I don't think there is anything doing this yet for USB devices, but
> maybe that's something that should be there?
>=20

It's come up a number of times. Basically we should support this, and I
believe it's relatively straightforward to do, someone just has to=20
implement it, but setting the of_node pointer for a USB device that
gets added and if that has a matching node.

There is a binding for USB that we never implemented in Linux. It
used to be at http://playground.sun.com/1275/bindings/usb/usb-1_0.ps
and I can send a copy to anyone that needs one. Most of the contents
are irrelevant unless you want to implement a full Open Firmware
rather than a flattened device tree.=20

The important parts are:

#address-cells: needs to be 1
#size-cells: needs to be 0

reg: 'The "reg" property for a device node shall consist of the number =
of the USB hub port or the USB host
controller port to which this USB device is attached. As specified in [=
2] section 11.11.2.1, port numbers range
from 1 to 255.'

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
