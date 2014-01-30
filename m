From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: recommended action for bootloaders regarding modifying device-tree nodes
Date: Thu, 30 Jan 2014 01:11:18 -0800
Message-ID: <CAJ+vNU366GiY4k_rnh1Jf0kra+PU99w4tDdM2sNioUAJCiZqOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Greetings,

I develop the boot-loader and kernel for a family of boards that have
an on-board EEPROM which contains information as to what options are
physically loaded on the board such as memory size/config, and
peripheral IC's.  We allow customers to create special builds of our
standard products with sub-loaded components and while each
combination of options ends up with a unique model number, it seems
silly to create a different static device-trees for each possible
option (not to mention we don't create the unique model number until
an order is placed).

My approach has been to define a per-baseboard device-tree in Linux
for a 'fully loaded' board, then remove nodes which the EEPROM claims
are not present in the bootloader before it passes the DTB to the
kernel.  I do this by defining aliases in the device-tree for the
peripherals that are 'optional' so that the bootloader itself does not
need to know the details about how the device is connected.

Is it more appropriate for the bootloader to 'remove' nodes for
devices that are not physically present or should I be setting their
status property to 'disabled' instead?  I'm not clear if either option
really has any pros or cons.

Thanks for any suggestions or comments,

Tim

Tim Harvey - Principal Software Engineer
Gateworks Corporation
3026 S. Higuera St. San Luis Obispo CA 93401
805-781-2000
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
