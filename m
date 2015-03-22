From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: serial atag tag in devicetree ?
Date: Sun, 22 Mar 2015 12:26:16 +0100
Message-ID: <550EA6D8.3090702@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi All,

I'm sending this mail because Paul Kocialkowski (in the Cc)
has submitted a patch for upstream u-boot to set the serial
atag tag from u-boot for Allwinner SoCs, using the SoCs
SID, which is a 128 bit register containing a unique number
for each SoC.

In some cases a manufacturer may want to override this with
its own serial from say an eeprom, as such it is desirable
to communicate the serial from u-boot to the kernel rather
then reproducing the sid reading code in the kernel.

For old atag using kernels there is an atag for this, and
the contents of this tag will show up in /proc/cpuinfo,
currently there is no equivalent for this in devicetree.

I'm a bit reluctant to merge Paul's patch into u-boot
because of this as it will enable a feature on older
kernels while leaving the upstream kernel without it.

So I was wondering how to deal with this in devicetree,
at least one board in u-boot already sets a devicetree
property for this:

board/gateworks/gw_ventana/gw_ventana.c
1202: *   serial# env var
1207:   char *serial = getenv("serial#");
1432:           setenv("serial#", str);
1512:   fdt_setprop(blob, 0, "system-serial", getenv("serial#"),
1513:               strlen(getenv("serial#")) + 1);

Which sets a system-serial property in the root node,
so at the same level where we also have the model string
this seems to make sense to me.

So do we want to add a devicetree binding for system
serials, and if we do should we make it a string like
above, or should we make it an 64 bit integer like the atag?

If we make it a string we can store longer serials, but
how should we deal with those wrt /proc/cpuinfo? Only show
the first 64 bits ?

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
