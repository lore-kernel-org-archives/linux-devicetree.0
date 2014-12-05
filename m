From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] OF: DT-Overlay configfs interface (v3)
Date: Fri, 05 Dec 2014 16:44:50 +0000
Message-ID: <20141205164450.A9294C40B61@trevor.secretlab.ca>
References: <1417605808-23327-1-git-send-email-pantelis.antoniou@konsulko.com>
	<20141204103104.7D8E0C40992@trevor.secretlab.ca>
	<8795CB40-87D6-4683-8396-987A49E94574@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8795CB40-87D6-4683-8396-987A49E94574-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 4 Dec 2014 13:30:05 +0200
, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
 wrote:
> Hi Grant,
> 
> > On Dec 4, 2014, at 12:31 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > 
> > Kees,
> > 
> > I'm copying you on this email. This is a new interface being proposed
> > for making live changes to the device tree at runtime, which gives
> > pretty close to direct control to userspace of the Linux device model.
> > Userspace can supply a blob that causes devices to get added or removed
> > from /sys/devices, and can change how a device is accessed. This is
> > definitely a security concern and I would love to get your opinion on
> > the interface.
> > 
> > Naturally, the interface has been made root-only, but I don't think that
> > is enough. I think we need a method which parts of the devicetree can be
> > modified by a devicetree overlay. I've been thinking in terms of adding
> > allow/deny properties that control whether or not changes can be made
> > below a particular node, with the default for the whole tree to be
> > 'deny'. That way the devicetree for the platform can restrict dynamic
> > change to only the node that need to be modifed.
> > 
> > What do you think?
> > 
> > Pantelis, I've made comments below on the patch...
> > 
> > On Wed,  3 Dec 2014 13:23:28 +0200
> > , Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > wrote:
> >> Add a runtime interface to using configfs for generic device tree overlay
> >> usage. With it its possible to use device tree overlays without having
> >> to use a per-platform overlay manager.
> >> 
> >> Please see Documentation/devicetree/configfs-overlays.txt for more info.
> >> 
> >> Changes since v2:
> >> - Removed ifdef CONFIG_OF_OVERLAY (since for now it's required)
> >> - Created a documentation entry
> >> - Slight rewording in Kconfig
> >> 
> >> Changes since v1:
> >> - of_resolve() -> of_resolve_phandles().
> >> 
> >> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >> ---
> >> Documentation/devicetree/configfs-overlays.txt |  31 +++
> >> drivers/of/Kconfig                             |   7 +
> >> drivers/of/Makefile                            |   1 +
> >> drivers/of/configfs.c                          | 332 +++++++++++++++++++++++++
> >> 4 files changed, 371 insertions(+)
> >> create mode 100644 Documentation/devicetree/configfs-overlays.txt
> >> create mode 100644 drivers/of/configfs.c
> >> 
> >> diff --git a/Documentation/devicetree/configfs-overlays.txt b/Documentation/devicetree/configfs-overlays.txt
> >> new file mode 100644
> >> index 0000000..5fa43e0
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/configfs-overlays.txt
> >> @@ -0,0 +1,31 @@
> >> +Howto use the configfs overlay interface.
> >> +
> >> +A device-tree configfs entry is created in /config/device-tree/overlays
> >> +and and it is manipulated using standard file system I/O.
> >> +Note that this is a debug level interface, for use by developers and
> >> +not necessarily something accessed by normal users due to the
> >> +security implications of having direct access to the kernel's device tree.
> >> +
> >> +* To create an overlay you mkdir the directory:
> >> +
> >> +	# mkdir /config/device-tree/overlays/foo
> >> +
> >> +* Either you echo the overlay firmware file to the path property file.
> >> +
> >> +	# echo foo.dtbo >/config/device-tree/overlays/foo/path
> >> +
> >> +* Or you cat the contents of the overlay to the dtbo file
> >> +
> >> +	# cat foo.dtbo >/config/device-tree/overlays/foo/dtbo
> >> +
> >> +The overlay file will be applied, and devices will be created/destroyed
> >> +as required.
> >> +
> >> +To remove it simply rmdir the directory.
> >> +
> >> +	# rmdir /config/device-tree/overlays/foo
> >> +
> >> +The rationalle of the dual interface (firmware & direct copy) is that each is
> > 
> > sp. rationale
> > 
> 
> OK,
> 
> >> +better suited to different use patterns. The firmware interface is what's
> >> +intended to be used by hardware managers in the kernel, while the copy interface
> >> +make sense for developers (since it avoids problems with namespaces).
> > 
> > The distinction between developer and production interfaces is
> > unfortunately meaningless in the real world. The developer interface
> > will get used in production if it is there, and having two interfaces
> > means we have to support two interfaces that do /exactly the same
> > thing/.
> > 
> > One interface only please.
> > 
> 
> I wish it was so simple :/
> 
> 
> > What are the problems with namespaces that you see with the firmware
> > interface?
> > 
> 
> When passing a path to a driver, which namespace are you going to use
> to perform the lookup?
> 
> For instance, if the user issued a load request for a path in a container
> which is the namespace under which the firmware file is located? Is it the
> non-container filesystem, or is it under the container filesystem that
> issued the request. The firmware layer does not have an API to discern.

Wait, what? Why on earth would you want to expose this interface in a container?

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
