From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/1] of: to support binding numa node to root subnode(non-bus)
Date: Mon, 24 Aug 2015 08:25:31 -0500
Message-ID: <CAL_Jsq+Ab-=Dwi4LFR8NjB8mL1DJTY_a1a4Zm88wjcWHM4eS0g@mail.gmail.com>
References: <1440419410-10520-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440419410-10520-1-git-send-email-thunder.leizhen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhen Lei <thunder.leizhen@huawei.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>
List-Id: devicetree@vger.kernel.org

+benh

On Mon, Aug 24, 2015 at 7:30 AM, Zhen Lei <thunder.leizhen@huawei.com> wrote:
> If use of_platform_populate to scan dt-nodes and add devices, the
> subnode of root(such as /smmu), when being scanned and invoke

You should have a bus as the sub-node of root rather than devices
directly off of root. You still have a problem though...

> of_device_add, the ofdev->dev.parent is always equal &platform_bus. So
> that, function set_dev_node will not be called. And in device_add,
> dev_to_node(parent) always return NUMA_NO_NODE.
>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/base/core.c | 2 +-
>  drivers/of/device.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index dafae6d..5df4f46b 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1017,7 +1017,7 @@ int device_add(struct device *dev)
>                 dev->kobj.parent = kobj;
>
>         /* use parent numa_node */
> -       if (parent)
> +       if (parent && (parent != &platform_bus))

This is only fixing one specific case, but I think things are broken
for any case where the NUMA associativity if not set at the top level
bus node. I think this should be something like:

if (parent && (dev_to_node(dev) != NO_NUMA_NODE))

Then the OF code can set the node however it wants.

>                 set_dev_node(dev, dev_to_node(parent));
>
>         /* first, register with generic layer. */
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 8b91ea2..96ebece 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -63,7 +63,7 @@ int of_device_add(struct platform_device *ofdev)
>         /* device_add will assume that this device is on the same node as
>          * the parent. If there is no parent defined, set the node
>          * explicitly */
> -       if (!ofdev->dev.parent)
> +       if (!ofdev->dev.parent || (ofdev->dev.parent == &platform_bus))

And then remove the if here.

>                 set_dev_node(&ofdev->dev, of_node_to_nid(ofdev->dev.of_node));
>
>         return device_add(&ofdev->dev);
> --
> 2.5.0
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
