From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] devicetree: Remove remaining references/tests for "chosen@0"
Date: Tue, 5 Sep 2017 09:41:45 -0500
Message-ID: <CAL_JsqKKePqec7OER=MMSTDXTGiYiuM5jE0QWg_nUvmvQoEw4g@mail.gmail.com>
References: <alpine.LFD.2.21.1709020416130.13598@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.21.1709020416130.13598-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Linux PPC Mailing List <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 2, 2017 at 3:43 AM, Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org> wrote:
>
> Since, according to a recent devicetree ML posting by Rob Herring,
> the node "/chosen@0" is most likely for real Open Firmware and does
> not apply to DTSpec, remove all remaining tests and references for
> that node, of which there are very few left:
>
>  arch/microblaze/kernel/prom.c | 3 +--
>  arch/mips/generic/yamon-dt.c  | 4 ----
>  arch/powerpc/boot/oflib.c     | 7 ++-----
>  drivers/of/base.c             | 2 --
>  drivers/of/fdt.c              | 5 +----
>  5 files changed, 4 insertions(+), 17 deletions(-)
>
> This should be innocuous as, in all of the three arch/ files above,
> there is a test for "chosen" immediately before the test for
> "chosen@0", so nothing should change.
>
> Signed-off-by: Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
>
> ---
>
>   if this patch is premature, then just ignore it, thanks.
>
> diff --git a/arch/microblaze/kernel/prom.c b/arch/microblaze/kernel/prom.c
> index 68f0999..c81bfd7 100644
> --- a/arch/microblaze/kernel/prom.c
> +++ b/arch/microblaze/kernel/prom.c
> @@ -53,8 +53,7 @@ static int __init early_init_dt_scan_chosen_serial(unsigned long node,
>
>         pr_debug("%s: depth: %d, uname: %s\n", __func__, depth, uname);
>
> -       if (depth == 1 && (strcmp(uname, "chosen") == 0 ||
> -                               strcmp(uname, "chosen@0") == 0)) {
> +       if (depth == 1 && (strcmp(uname, "chosen") == 0)) {

I'd really hoped to remove early_init_dt_scan_chosen_serial()
altogether. It may now be just a matter of adding the compatible
strings to the uartlite earlycon.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
