From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: why configfs for devicetree overlay loading?
Date: Mon, 11 May 2015 11:22:41 +0200
Message-ID: <CAOMqctTPH0aVDz3Xv+uDSZC7cTYuWK_HONbXFUb75u_QaNLLbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

since I did not find the patches for loading device tree overlays I
used the already merged infrastructure and implemented loading device
tree overlays in sysfs.

I see that the preexisting patches use configfs for loading overlays.

However, there is no clear distinction for using configfs vs sysfs.

Technically the capabilities of both filesystems are the same - at
least according  to the docs I read.

Implementation complexity is also about the same disregarding the
extra patches to fix configfs deficiencies.

Using configfs requires extra option in the kernel which is often not
present in preexisting configuration.

Using configfs requires the user to assign some unique identifier to
the overlay that will be used as directory name beforehand whereas
using sysfs I interface directly to the create() function which takes
an unflattened overlay blob.

Given that information about the overlays is exported in sysfs anyway
and the extra directory name for the overlay in configfs is redundant
and it may be hard to figure out a collision-free scheme for it in
some cases I prefer the sysfs interface.

It has also the extra advantage that the interface that exports
information about the device tree and the interface for managing it is
in one place.

Please CC me

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
