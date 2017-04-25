From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/4] of: remove *phandle properties from expanded
 device tree
Date: Tue, 25 Apr 2017 01:51:47 -0700
Message-ID: <58FF0E23.1090806@gmail.com>
References: <1493110049-30165-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493110049-30165-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/25/17 01:47, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> 
> Remove "phandle" and "linux,phandle" properties from the internal
> device tree.  The phandle will still be in the struct device_node
> phandle field.
> 
> This is to resolve the issue found by Stephen Boyd [1] when he changed
> the type of struct property.value from void * to const void *.  As
> a result of the type change, the overlay code had compile errors
> where the resolver updates phandle values.
> 
>   [1] http://lkml.iu.edu/hypermail/linux/kernel/1702.1/04160.html
> 
> Patch 1 is the phandle related changes.
> 
> Patches 2 - 4 are minor fixups for issues that became visible
> while implementing patch 1.
> 
> Changes from v1:

          ^^^^^^^^
  Changes from v2


>    - patch 1: Remove check in __of_add_phandle_sysfs() that would not
>      add a sysfs entry if IS_ENABLED(CONFIG_PPC_PSERIES)
> 
> Changes from v1:
>    - Remove phandle properties in of_attach_node(), before attaching
>      the node to the live tree.
>    - Add the phandle sysfs entry for the node in of_attach_node().
>    - When creating an overlay changeset, duplicate the node phandle in
>      __of_node_dup().
> 
> Frank Rowand (4):
>   of: remove *phandle properties from expanded device tree
>   of: make __of_attach_node() static
>   of: be consistent in form of file mode
>   of: detect invalid phandle in overlay
> 
>  drivers/of/base.c       | 50 +++++++++++++++++++++++++++++++++++++++----
>  drivers/of/dynamic.c    | 56 ++++++++++++++++++++++++++++++++++++-------------
>  drivers/of/fdt.c        | 40 +++++++++++++++++++++--------------
>  drivers/of/of_private.h |  2 +-
>  drivers/of/overlay.c    |  8 ++++---
>  drivers/of/resolver.c   | 23 +-------------------
>  include/linux/of.h      |  1 +
>  7 files changed, 120 insertions(+), 60 deletions(-)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
