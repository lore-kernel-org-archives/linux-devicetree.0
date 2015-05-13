From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v4 0/4] Fix null pointer deference when calling of_platform_depopulate
Date: Wed, 13 May 2015 14:31:12 +0200
Message-ID: <CAPybu_1M3o6R7N_hxQ8tZL9k0ukUY0gTKHi-G5pBjgafdwrgVA@mail.gmail.com>
References: <1429797494-29242-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429797494-29242-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jakub Sitnicki <jsitnicki@gmail.com>, Vivek Goyal <vgoyal@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Jiang Liu <jiang.liu@linux.intel.com>, Mike Travis <travis@sgi.com>, Thierry Reding <treding@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

Ping?

On Thu, Apr 23, 2015 at 3:58 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> of_platform_depopulate can lead to a kernel error when calling release_resource()
>
> The reason is that it is trying to release a resource that was not allocated
> via insert_resource()
>
> of_platform_depopulate()
>       of_platform_device_destroy()
>         platform_device_unregister(platform_device *pdev)
>           platform_device_del(platform_device *pdev)
>             for (i = 0; i < pdev->num_resources; i++)
>                       release_resource()
>
> of_platform_populate()
>       ...
>         of_device_alloc()
>           pdev = platform_device_alloc()
>           # set pdev->resource, similar to platform_device_add_resources()
>           of_device_add(platform_device *pdev)
>             # similar to platform_device_add(), but note there's no
>             # insert_resource() in this path
>             device_add(&pdev->dev)
>
> On this patchset:
>
> base/platform has been fixed for an hypothetical condition where parent is
> set but the platform is neither MEM or IO.
>
> Then platform_device_alloc has been modified so it supports of and amba
> devices.
>
> Finally of_device_add has been modified to use platform_device_add().
>
> v1: https://lkml.org/lkml/2015/4/20/435
>
> v2: From: Bjorn Helgaas <bhelgaas@google.com>
>      -Fix caller, not callee
>
>     https://lkml.org/lkml/2015/4/21/99
>     https://lkml.org/lkml/2015/4/21/100
>
> v3: From: Rob Herring <robherring2@gmail.com>
>       - Modify plaform_device_alloc to support of and ambda devices
>
>     https://lkml.org/lkml/2015/4/22/369
>     https://lkml.org/lkml/2015/4/22/370
>     https://lkml.org/lkml/2015/4/22/371
>     https://lkml.org/lkml/2015/4/22/374
>     https://lkml.org/lkml/2015/4/22/373
>
> v4: From: Bjorn Helgaas <bhelgaas@google.com>
>      -Remove WARN() patch
>      -Show conflicting resources
>      -Code Style
>      -Fix descriptions
>
>     From: Rob Herring <robherring2@gmail.com>
>        -Fix descriptions
>
> Ricardo Ribalda Delgado (4):
>   base/platform: Only insert MEM and IO resources
>   base/platform: Continue on insert_resource() error
>   of/platform: Use platform_device interface
>   base/platform: Remove code duplication
>
>  drivers/base/platform.c | 84 ++++++++++++++++++++++++-------------------------
>  drivers/of/platform.c   |  3 +-
>  2 files changed, 43 insertions(+), 44 deletions(-)
>
> --
> 2.1.4
>



-- 
Ricardo Ribalda
