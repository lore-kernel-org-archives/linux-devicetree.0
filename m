From: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/3] of: Migrate of_find_node_by_name() users to for_each_node_by_name()
Date: Thu, 5 Jun 2014 12:48:54 -0500
Message-ID: <CABGGisx=fhp1P68M+9aQUTzi6Bp+PnXK7Xq_TQ+=87AkGCZvwQ@mail.gmail.com>
References: <1401983021-13829-1-git-send-email-grant.likely@linaro.org> <1401983021-13829-2-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401983021-13829-2-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 5, 2014 at 10:43 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> There are a bunch of users open coding the for_each_node_by_name() by
> calling of_find_node_by_name() directly instead of using the macro. This
> is getting in the way of some cleanups, and the possibility of removing
> of_find_node_by_name() entirely. Clean it up so that all the users are
> consistent.
>
> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/powerpc/platforms/powermac/feature.c  | 20 +++++---------------
>  arch/powerpc/platforms/powermac/pci.c      |  2 +-
>  arch/powerpc/platforms/powermac/smp.c      |  2 +-
>  arch/powerpc/platforms/powermac/udbg_adb.c |  2 +-
>  arch/powerpc/platforms/pseries/setup.c     |  3 +--
>  drivers/cpufreq/pmac64-cpufreq.c           |  3 +--
>  drivers/edac/cell_edac.c                   |  3 +--
>  drivers/pci/hotplug/rpaphp_core.c          |  4 ++--
>  drivers/tty/serial/pmac_zilog.c            |  9 +++------
>  sound/ppc/pmac.c                           |  6 +++---
>  10 files changed, 19 insertions(+), 35 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
> index 63d82bbc05e9..39e1d163c427 100644
> --- a/arch/powerpc/platforms/powermac/feature.c
> +++ b/arch/powerpc/platforms/powermac/feature.c
> @@ -2805,25 +2805,20 @@ set_initial_features(void)
>                 /* Enable GMAC for now for PCI probing. It will be disabled
>                  * later on after PCI probe
>                  */
> -               np = of_find_node_by_name(NULL, "ethernet");
> -               while(np) {
> +               for_each_node_by_name(np, "ethernet")
>                         if (of_device_is_compatible(np, "K2-GMAC"))

Can't for_each_compatible_node be used here instead?

>                                 g5_gmac_enable(np, 0, 1);
> -                       np = of_find_node_by_name(np, "ethernet");
> -               }
>
>                 /* Enable FW before PCI probe. Will be disabled later on
>                  * Note: We should have a batter way to check that we are
>                  * dealing with uninorth internal cell and not a PCI cell
>                  * on the external PCI. The code below works though.
>                  */
> -               np = of_find_node_by_name(NULL, "firewire");
> -               while(np) {
> +               for_each_node_by_name(np, "firewire") {
>                         if (of_device_is_compatible(np, "pci106b,5811")) {

and here...

>                                 macio_chips[0].flags |= MACIO_FLAG_FW_SUPPORTED;
>                                 g5_fw_enable(np, 0, 1);
>                         }
> -                       np = of_find_node_by_name(np, "firewire");
>                 }
>         }
>  #else /* CONFIG_POWER4 */
> @@ -2834,13 +2829,11 @@ set_initial_features(void)
>                 /* Enable GMAC for now for PCI probing. It will be disabled
>                  * later on after PCI probe
>                  */
> -               np = of_find_node_by_name(NULL, "ethernet");
> -               while(np) {
> +               for_each_node_by_name(np, "ethernet") {
>                         if (np->parent
>                             && of_device_is_compatible(np->parent, "uni-north")
>                             && of_device_is_compatible(np, "gmac"))

This one is a bit more complicated, but should still work with
for_each_compatible_node.

There's a few more that could be converted. I guess it depends if you
think dropping looking at node names is okay.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
