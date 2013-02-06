From: Grant Likely <grant.likely@secretlab.ca>
Subject: Heads up on a device tree change
Date: Wed, 6 Feb 2013 13:11:56 +0000
Message-ID: <CACxGe6sCBCGfLDAGVRgP3cnmE+oyXBDdPeVXVCqrsvCh13yPiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Sender: linux-next-owner@vger.kernel.org
To: linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

I've just pushed out a change which cleans up platform device
registration to use the same path whether or not the device tree is
used. It should be safe, but there is a risk of breakage on powerpc
platforms.

The patch has two effects of note:
- DT generated platform devices move from /sys/devices to under
/sys/devices/platform. Userspace *should* be okay with this, but if
there are any problems then I can post a workaround patch that keeps
DT generiated platform_devices in the current location.
- Resources on platform_devices get registered so they appear in
/proc/iomem and /proc/ioports and so that device drivers get the added
protection of request_region. This will cause breakage on device trees
nodes with partially overlapping memory regions. (ie. 0x100..0x1ff and
0x180..0x27f). I also have a workaround for this, but I doubt that it
will be necessary.

I'm not worried about it, but it is a sufficiently visible change that
I want you to be aware that it is there.

g.

--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
