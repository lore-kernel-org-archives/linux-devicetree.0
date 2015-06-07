From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform devices
Date: Sun, 7 Jun 2015 20:13:15 +0200
Message-ID: <CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org> <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hello Grant

I would ask you to go through all the discussion related to this bug.
Here is a summary (please anyone involved correct me if I am wrong)

1) I send a patch to fix the oops if release resource is executed with
a resource without parent
2) Bjorn says that we should fix the issue of the problem, which he
pointed out being that we use platform_device_del() after using
of_device_add()
3) I resend a patchset to use platform_devide_add()
4) 3 series of cleanouts after the help from Rob and Bjorn
5) Greg adds the series (v5) to his device core tree
6) You complaint that that series can break miss behaved platforms
7) I send a couple of patches that fix your problem and leaves the
window open to blacklist the platforms that miss behave.

now you send a patch that takes us to back to step 1), and adds some
code that is already merged into gregk's
https://git.kernel.org/cgit/linux/kernel/git/gregkh/driver-core.git/tree/drivers/base/platform.c?h=driver-core-testing#n314


Wouldn't you agree that it will be a better solution to give your
feedback regarding https://lkml.org/lkml/2015/6/5/246 and fix this
issue together?

that solution has been reviewed by a bunch of people, removes code
duplication and afaik, is tested, does not break any platform, and I
believe that is closer to an scenario when we can remove
of_device_add() and all the devices behave similarly.


Best Regards



On Sun, Jun 7, 2015 at 4:20 PM, Grant Likely <grant.likely@linaro.org> wrote:
> The unregister path of platform_device is broken. On registration, it
> will register all resources with either a parent already set, or
> type==IORESOURCE_{IO,MEM}. However, on unregister it will release
> everything with type==IORESOURCE_{IO,MEM}, but ignore the others. There
> are also cases where resources don't get registered in the first place,
> like with devices created by of_platform_populate()*.
>
> Fix the unregister path to be symmetrical with the register path by
> checking the parent pointer instead of the type field to decide which
> resources to unregister. This is safe because the upshot of the
> registration path algorithm is that registered resources have a parent
> pointer, and non-registered resources do not.
>
> * It can be argued that of_platform_populate() should be registering
>   it's resources, and they argument has some merit. However, there are
>   quite a few platforms that end up broken if we try to do that due to
>   overlapping resources in the device tree. Until that is fixed, we need
>   to solve the immediate problem.
>
> Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Signed-off-by: Grant Likely <grant.likely@linaro.org>
> ---
>  drivers/base/platform.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index ebf034b97278..7403de94832c 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -375,9 +375,7 @@ int platform_device_add(struct platform_device *pdev)
>
>         while (--i >= 0) {
>                 struct resource *r = &pdev->resource[i];
> -               unsigned long type = resource_type(r);
> -
> -               if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
> +               if (r->parent)
>                         release_resource(r);
>         }
>
> @@ -408,9 +406,7 @@ void platform_device_del(struct platform_device *pdev)
>
>                 for (i = 0; i < pdev->num_resources; i++) {
>                         struct resource *r = &pdev->resource[i];
> -                       unsigned long type = resource_type(r);
> -
> -                       if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
> +                       if (r->parent)
>                                 release_resource(r);
>                 }
>         }
> --
> 2.1.4
>



-- 
Ricardo Ribalda
