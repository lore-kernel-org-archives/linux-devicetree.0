From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: simplefb device tree bindings enumeration and handover
Date: Wed, 12 Nov 2014 16:49:08 +0100
Message-ID: <54638174.50306@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux Fbdev development list <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

Today I've had a long discussion with Grant Likely on irc, in the
#devicetree channel, on the devicetree bindings for simplefb.

The 2 topics discussed were enumeration of simplefb nodes, and the
handover to a hw specific driver later in the boot process.

We've come to the following conclusions:

1) Since simplefb nodes represent runtime information they must be sub-nodes
of the chosen node. The primary display node must be named framebuffer0,
additional nodes must be called framebuffer1, etc.

2) If a simplefb node represents the preferred console for user
interaction, then the chosen node's stdout-path property must point to it.

3) Older devicetree files may have a compatible = "simple-framebuffer"
node in a different place, operating systems must first enumerate any
framebuffer# nodes found under chosen and then check for other compatible
nodes.

4) If the devicetree contains nodes for the display hardware used by a simplefb,
then one of the hw nodes must have a property called "framebuffer" pointing to
the framebuffer# node in chosen, so that the operating system knows which
simplefb to disable when handing over control to a driver for the real
hardware. The bindings for the hw nodes must specify which node contains the
framebuffer property.

5) It is advised that devicetree files contain pre-filled, disabled framebuffer#
nodes, so that the firmware only needs to update the mode information and
enable them. This way if e.g. later on support for more display clocks get
added, the simplefb nodes will already contain this info and the firmware
does not need to be updated.

I'll post a patch updating Documentation/devicetree/bindings/video/simple-framebuffer.txt
to reflect this soon.

Regards,

Hans

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
