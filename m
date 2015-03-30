From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: USB device nodes in device tree
Date: Mon, 30 Mar 2015 15:35:14 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1503301534050.1407-100000@iolanthe.rowland.org>
References: <55196B2D.7000204@keymile.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55196B2D.7000204-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 30 Mar 2015, Valentin Longchamp wrote:

> Hello,
> 
> We are currently developing a board with an USB MFD device (I2C and GPIOs are to
> be supported). The device is soldered on the board and is the only one on the
> bus, so the bus is not really "dynamic".
> 
> Since it's an USB device, it should be dynamically detected by the kernel and it
> would not require a node in the board's DTS. However, I need to have the devices
> which are "behind" the MFD USB device to be in the DTS (I2C bus topology, and
> some of the GPIOs are to be used directly by some other DTS nodes as well).
> 
> Is there a way to add a node for USB device in a DTS ? Is there an available
> example for this ?

No, there is no way to do it as far as I know.  The main problem is 
that Device Tree is static whereas USB devices are dynamic.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
