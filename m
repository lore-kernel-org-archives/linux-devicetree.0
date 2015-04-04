From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: USB device nodes in device tree
Date: Sat, 04 Apr 2015 12:08:36 -0700
Message-ID: <552036B4.9050405@gmail.com>
References: <Pine.LNX.4.44L0.1503301534050.1407-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1503301534050.1407-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 30/03/2015 12:35, Alan Stern a =C3=A9crit :
> On Mon, 30 Mar 2015, Valentin Longchamp wrote:
>=20
>> Hello,
>>
>> We are currently developing a board with an USB MFD device (I2C and =
GPIOs are to
>> be supported). The device is soldered on the board and is the only o=
ne on the
>> bus, so the bus is not really "dynamic".
>>
>> Since it's an USB device, it should be dynamically detected by the k=
ernel and it
>> would not require a node in the board's DTS. However, I need to have=
 the devices
>> which are "behind" the MFD USB device to be in the DTS (I2C bus topo=
logy, and
>> some of the GPIOs are to be used directly by some other DTS nodes as=
 well).
>>
>> Is there a way to add a node for USB device in a DTS ? Is there an a=
vailable
>> example for this ?
>=20
> No, there is no way to do it as far as I know.  The main problem is=20
> that Device Tree is static whereas USB devices are dynamic.

The PCI(e) bus has the same problem, yet you can specify a PCI device
child node, and have a compatible string which will match the vendor
id/device id tuple, device class etc... such that you can use Device
Tree to add additional information not necessarily available in other
ways such as MAC addresses and similar.

Once the PCI bus is scanned, pci_device present in Device Tree get a
device_node pointer assigned.

I don't think there is anything doing this yet for USB devices, but
maybe that's something that should be there?
--
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
