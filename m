From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: Re: [PATCH 00/10] of: Core devicetree changeset support
Date: Fri, 25 Jul 2014 13:10:15 -0500
Message-ID: <53D29D87.4060708@austin.ibm.com>
References: <1406159064-21366-1-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406159064-21366-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tyrel Datwyler <turtle.in.the.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/23/2014 06:44 PM, Grant Likely wrote:
> Hi all,
> 
> This is a rollup of all the patches that I queued up today for
> linux-next for the devicetree changeset and overlay work. I'm reposting
> these patches because some have been significantly changed since their
> first posting. None of the code is actually live yet, but the test cases
> are there.
> 
> There is one significant functional change which may affect pseries. The
> OF_DYNAMIC code has been changed to emit notifiers after applying a
> change to the tree instead of before. I think I've got all they users
> taken care of correctly, but I'd like to see some testing. I don't have
> access to pseries (and I can't get the QEMU pseries model to boot reliably)
> 
> Nathan/Tyrel, can you give it a spin? The changes can be found in my git tree:

Grant,

I was able to do some sniff testing by adding/removing memory, cpus, and pci
devices and it appears that all device tree nodes and properties were updated
properly.

I would still like to try doing live partition migration where we can update
many pieces of the device tree. I'll be out next week, will try to get
on that when I return.

-Nathan

> 
>   git://git.secretlab.ca/git/linux devicetree/next
> 
> Grant Likely (8):
>       of/platform: Fix of_platform_device_destroy iteration of devices
>       of: Move CONFIG_OF_DYNAMIC code into a separate file
>       of: Make devicetree sysfs update functions consistent.
>       of: Make sure attached nodes don't carry along extra children
>       of: Move dynamic node fixups out of powerpc and into common code
>       of: Reorder device tree changes and notifiers
>       of: Add todo tasklist for Devicetree
>       Merge branch 'devicetree/next-overlay' into devicetree/next
> 
> Pantelis Antoniou (4):
>       of: rename of_aliases_mutex to just of_mutex
>       OF: Utility helper functions for dynamic nodes
>       of: Create unlocked versions of node and property add/remove functions
>       of: Transactional DT support.
> 
>  Documentation/devicetree/changesets.txt         |  40 ++
>  Documentation/devicetree/todo.txt               |  11 +
>  arch/powerpc/kernel/prom.c                      |  70 ---
>  arch/powerpc/platforms/pseries/hotplug-memory.c |   2 +-
>  drivers/crypto/nx/nx-842.c                      |  30 +-
>  drivers/of/Makefile                             |   1 +
>  drivers/of/base.c                               | 423 ++++-----------
>  drivers/of/device.c                             |   4 +-
>  drivers/of/dynamic.c                            | 660 ++++++++++++++++++++++++
>  drivers/of/of_private.h                         |  59 ++-
>  drivers/of/platform.c                           |  32 +-
>  drivers/of/selftest.c                           |  79 +++
>  drivers/of/testcase-data/testcases.dtsi         |  10 +
>  include/linux/of.h                              |  80 ++-
>  include/linux/of_platform.h                     |   7 +-
>  15 files changed, 1065 insertions(+), 443 deletions(-)
>  create mode 100644 Documentation/devicetree/changesets.txt
>  create mode 100644 Documentation/devicetree/todo.txt
>  create mode 100644 drivers/of/dynamic.c
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
