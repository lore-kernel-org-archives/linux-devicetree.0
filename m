From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: [RFC PATCH V2 0/2] Add 'make dtbs_install'
Date: Mon, 18 Nov 2013 18:38:13 +0000
Message-ID: <cover.1384798508.git.jason@lakedaemon.net>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384201760-16785-1-git-send-email-jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Detailed changelog can be found in each patch.

The kernel community never created a 'dtbs_install' make target for properly
handling the build output of the kernel's devicetree files.  Currently, the dtb
files are simply their source file, s/dts/dtb/.  Users have recently begun
retrieving these files from inside the kernel tree.  Any change to the dts
filenames breaks the scripts of those users.

Before this gets too far along, we'd like to create a standardized method of
installing the dtb files for users to find and use.  In addition, some vendors
have done a diligent job naming their devicetree source files appropriately and
we don't want to break their setups.

This patch series solves both problems by creating a dtbs_install make target
which calls arch/arm/boot/installdtbs.sh.  If /sbin/installdtbs or
~/bin/installdtbs is present, they will be run instead of the default behavior.

The default action is to install a given dtb to

  /lib/modules/${kernel_version}/devicetree/${board_compatible}.dtb

Ideally, the devicetree file should be independent of the kernel version,
however, we aren't there yet.  So, while the devicetree files live in the
kernel source tree, we'll install them as above.  Once they are in their own
repository, this install target can be removed, and users can adjust their
workflow to getting the dtbs from a new location.

Jason Cooper (2):
  dtc: add 'compat' output option, prints board string
  kbuild: dtbs_install: new make target

 Makefile                     |  3 ++-
 arch/arm/Makefile            |  4 ++++
 arch/arm/boot/installdtbs.sh | 44 ++++++++++++++++++++++++++++++++++++++++++++
 scripts/dtc/dtc.c            |  3 +++
 scripts/dtc/dtc.h            |  1 +
 scripts/dtc/flattree.c       |  9 +++++++++
 6 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/installdtbs.sh

-- 
1.8.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
