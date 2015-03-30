From: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Subject: USB device nodes in device tree
Date: Mon, 30 Mar 2015 17:26:37 +0200
Message-ID: <55196B2D.7000204@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

We are currently developing a board with an USB MFD device (I2C and GPIOs are to
be supported). The device is soldered on the board and is the only one on the
bus, so the bus is not really "dynamic".

Since it's an USB device, it should be dynamically detected by the kernel and it
would not require a node in the board's DTS. However, I need to have the devices
which are "behind" the MFD USB device to be in the DTS (I2C bus topology, and
some of the GPIOs are to be used directly by some other DTS nodes as well).

Is there a way to add a node for USB device in a DTS ? Is there an available
example for this ?

Thank you

Valentin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
