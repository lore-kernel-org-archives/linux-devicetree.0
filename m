From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 1/1] of/lib: Allow scripts/dtc/libfdt to be used from
 kernel code
Date: Wed, 06 Jun 2012 22:40:42 -0500
Message-ID: <4FD022BA.8090109@gmail.com>
References: <1339022972-20036-1-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1339022972-20036-1-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/06/2012 05:49 PM, David Daney wrote:
> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> 
> libfdt is part of the device tree support in scripts/dtc/libfdt.  For
> some platforms that use the Device Tree, we want to be able to edit
> the flattened device tree form.
> 
> We don't want to burden kernel builds that do not require it, so we
> gate compilation of libfdt files with CONFIG_LIBFDT.  So if it is
> needed, you need to do this in your Kconfig:
> 
> 	select LIBFDT
> 
> And in the Makefile of the code using libfdt something like:
> 
> ccflags-y := -I$(src)/../../../scripts/dtc/libfdt
> 
> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

Looks like you've addressed all of Grant's prior comments and looks okay
to me. I'd merge it with the rest of patches thru the MIPS tree.

Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>


> ---
> This patch has been seen several times before as part of a larger
> patch set for my OCTEON Device Tree work.  After further refinement to
> my patches that depend on core Device Tree functionality, this is the
> only remaining patch to the common 'core' code.
> 
> Here is the history:
> 
> v8: Rebased lib/Makefile to avoid merge conflict.
> 
> v7: No changes other that to split from other, now unneeded, patches.
> 
> v6: No changes other than to split these out of the MIPS/OCTEON patch
>     set to allow them to be merged separately if desired.
> 
> v5: Build libfdt in the lib directory instead of devices/of, and
>     include all libfdt files.
> 
>     Changes to of_find_node_by_path() requested by Grant Likely.
> 
> v4: No changes to these two patches.
> 
> v3: libfdt building moved to devices/of/libfdt.  Cleanup and style
>     improvements as suggested by Grant Likely.
> 
> v2: No changes to these two patches.
> 
> There are a couple of possibility for merging this.
> 
> 1) Via the Device Tree maintainers, thus blocking the follow-ons until
>    it is merged.
> 
> 2) Via Ralf's Linux/MIPS tree with the rest of the patches after
>    Device Tree maintainer sign-off.
> 
>  include/linux/libfdt.h     |    8 ++++++++
>  include/linux/libfdt_env.h |   13 +++++++++++++
>  lib/Kconfig                |    6 ++++++
>  lib/Makefile               |    5 +++++
>  lib/fdt.c                  |    2 ++
>  lib/fdt_ro.c               |    2 ++
>  lib/fdt_rw.c               |    2 ++
>  lib/fdt_strerror.c         |    2 ++
>  lib/fdt_sw.c               |    2 ++
>  lib/fdt_wip.c              |    2 ++
>  10 files changed, 44 insertions(+), 0 deletions(-)
>  create mode 100644 include/linux/libfdt.h
>  create mode 100644 include/linux/libfdt_env.h
>  create mode 100644 lib/fdt.c
>  create mode 100644 lib/fdt_ro.c
>  create mode 100644 lib/fdt_rw.c
>  create mode 100644 lib/fdt_strerror.c
>  create mode 100644 lib/fdt_sw.c
>  create mode 100644 lib/fdt_wip.c
> 
> diff --git a/include/linux/libfdt.h b/include/linux/libfdt.h
> new file mode 100644
> index 0000000..4c0306c
> --- /dev/null
> +++ b/include/linux/libfdt.h
> @@ -0,0 +1,8 @@
> +#ifndef _INCLUDE_LIBFDT_H_
> +#define _INCLUDE_LIBFDT_H_
> +
> +#include <linux/libfdt_env.h>
> +#include "../../scripts/dtc/libfdt/fdt.h"
> +#include "../../scripts/dtc/libfdt/libfdt.h"
> +
> +#endif /* _INCLUDE_LIBFDT_H_ */
> diff --git a/include/linux/libfdt_env.h b/include/linux/libfdt_env.h
> new file mode 100644
> index 0000000..01508c7
> --- /dev/null
> +++ b/include/linux/libfdt_env.h
> @@ -0,0 +1,13 @@
> +#ifndef _LIBFDT_ENV_H
> +#define _LIBFDT_ENV_H
> +
> +#include <linux/string.h>
> +
> +#include <asm/byteorder.h>
> +
> +#define fdt32_to_cpu(x) be32_to_cpu(x)
> +#define cpu_to_fdt32(x) cpu_to_be32(x)
> +#define fdt64_to_cpu(x) be64_to_cpu(x)
> +#define cpu_to_fdt64(x) cpu_to_be64(x)
> +
> +#endif /* _LIBFDT_ENV_H */
> diff --git a/lib/Kconfig b/lib/Kconfig
> index a9e1540..e091300 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -395,4 +395,10 @@ config SIGNATURE
>  	  Digital signature verification. Currently only RSA is supported.
>  	  Implementation is done using GnuPG MPI library
>  
> +#
> +# libfdt files, only selected if needed.
> +#
> +config LIBFDT
> +	bool
> +
>  endmenu
> diff --git a/lib/Makefile b/lib/Makefile
> index 8c31a0c..2f2be5a 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -130,6 +130,11 @@ obj-$(CONFIG_GENERIC_STRNLEN_USER) += strnlen_user.o
>  
>  obj-$(CONFIG_STMP_DEVICE) += stmp_device.o
>  
> +libfdt_files = fdt.o fdt_ro.o fdt_wip.o fdt_rw.o fdt_sw.o fdt_strerror.o
> +$(foreach file, $(libfdt_files), \
> +	$(eval CFLAGS_$(file) = -I$(src)/../scripts/dtc/libfdt))
> +lib-$(CONFIG_LIBFDT) += $(libfdt_files)
> +
>  hostprogs-y	:= gen_crc32table
>  clean-files	:= crc32table.h
>  
> diff --git a/lib/fdt.c b/lib/fdt.c
> new file mode 100644
> index 0000000..97f2006
> --- /dev/null
> +++ b/lib/fdt.c
> @@ -0,0 +1,2 @@
> +#include <linux/libfdt_env.h>
> +#include "../scripts/dtc/libfdt/fdt.c"
> diff --git a/lib/fdt_ro.c b/lib/fdt_ro.c
> new file mode 100644
> index 0000000..f73c04e
> --- /dev/null
> +++ b/lib/fdt_ro.c
> @@ -0,0 +1,2 @@
> +#include <linux/libfdt_env.h>
> +#include "../scripts/dtc/libfdt/fdt_ro.c"
> diff --git a/lib/fdt_rw.c b/lib/fdt_rw.c
> new file mode 100644
> index 0000000..0c1f0f4
> --- /dev/null
> +++ b/lib/fdt_rw.c
> @@ -0,0 +1,2 @@
> +#include <linux/libfdt_env.h>
> +#include "../scripts/dtc/libfdt/fdt_rw.c"
> diff --git a/lib/fdt_strerror.c b/lib/fdt_strerror.c
> new file mode 100644
> index 0000000..8713e3f
> --- /dev/null
> +++ b/lib/fdt_strerror.c
> @@ -0,0 +1,2 @@
> +#include <linux/libfdt_env.h>
> +#include "../scripts/dtc/libfdt/fdt_strerror.c"
> diff --git a/lib/fdt_sw.c b/lib/fdt_sw.c
> new file mode 100644
> index 0000000..9ac7e50
> --- /dev/null
> +++ b/lib/fdt_sw.c
> @@ -0,0 +1,2 @@
> +#include <linux/libfdt_env.h>
> +#include "../scripts/dtc/libfdt/fdt_sw.c"
> diff --git a/lib/fdt_wip.c b/lib/fdt_wip.c
> new file mode 100644
> index 0000000..45b3fc3
> --- /dev/null
> +++ b/lib/fdt_wip.c
> @@ -0,0 +1,2 @@
> +#include <linux/libfdt_env.h>
> +#include "../scripts/dtc/libfdt/fdt_wip.c"
