From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Duplicated device tree and Dynamic symbols
Date: Tue, 28 Apr 2015 10:16:01 +0200
Message-ID: <CAPybu_3CQ0vD=uj_gKwdcsQ_W7u-SRKzKDWOYaXvU83V8iYOqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello

I have an X86 platform with device tree support. It has multiple pci
slots with a custom board that is described with a device tree.

When the pci device is probed, the driver fetches a device tree from
the firmware infrastructure, patches the range property based on the
bar address and adds the device to the main device tree.

This works perfectly fine with only one card, but when the second card
is connected: Here be dragons :)

The main issue is that of_find_node_by_phandle always resolves to the
first connected card. I fixed this by creating a new function.
of_find_node_by_phandle_family() that chooses the closest phandle on
the tree, not just the first one.

By reading the "Dynamic Symbols support and fixup support"
here:
http://events.linuxfoundation.org/sites/events/files/slides/dynamic-dt-elce14.pdf
and here
https://lwn.net/Articles/616859/

It seemed that the patch would fix my issue and it would be already
merged, but I cannot find the patch here
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
or here
https://git.kernel.org/cgit/linux/kernel/git/jdl/dtc.git

So I am wondering some stuff:

Would a patch adding my of_find_node_by_phandle_family() would be accepted.?

Will Dynamic symbols fix my issue?

What is the status of Dynamic symbol support?

Thanks!


-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
