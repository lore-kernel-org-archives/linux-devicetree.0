From: Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 07/23] MAINTAINERS: Add file patterns for fpga device
 tree bindings
Date: Mon, 13 Mar 2017 09:55:16 -0500
Message-ID: <CANk1AXSPyOwdVJfhb8VP2as3+z+F3O1c44CJ8z6WksRqVAcGDQ@mail.gmail.com>
References: <1489324627-19126-1-git-send-email-geert@linux-m68k.org> <1489324627-19126-8-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489324627-19126-8-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 12, 2017 at 8:16 AM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
>
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> Acked-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Cc: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> Please apply this patch directly if you want to be involved in device
> tree binding documentation for your subsystem.
>
> v2:
>   - Add Acked-by.
>
> Impact on next-20170310:
>
> -Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:7/4=100%)
> +Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> (maintainer:FPGA MANAGER FRAMEWORK)
> +Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org> (reviewer:FPGA MANAGER FRAMEWORK)
> +Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>  Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> -Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> (commit_signer:4/4=100%,authored:4/4=100%)
> -Matthew Gerlach <mgerlach-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> (commit_signer:2/4=50%)
> -Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org> (commit_signer:1/4=25%)
> -Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> (commit_signer:1/4=25%)
> +linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:FPGA MANAGER FRAMEWORK)
>  devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>  linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c0822d4fa5c3ade5..fc0d3d709db0687f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5150,6 +5150,7 @@ R:        Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
>  L:     linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  S:     Maintained
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/atull/linux-fpga.git
> +F:     Documentation/devicetree/bindings/fpga/

Also needs:

F: Documentation/fpga/

Acked-by: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Please send to Greg KH; he is taking our patches.

Thanks,
Alan


>  F:     drivers/fpga/
>  F:     include/linux/fpga/fpga-mgr.h
>  W:     http://www.rocketboards.org
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
