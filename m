From: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/9] bus: brcmstb_gisb: correct support for 64-bit address output
Date: Fri, 24 Mar 2017 22:36:16 -0700
Message-ID: <CADtm3G6vjy=8gJrs7tYKJ6E073J=OBCXvs4J8bFb-X0AFVAGYw@mail.gmail.com>
References: <20170324144632.5896-1-opendmb@gmail.com> <20170324144632.5896-7-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170324144632.5896-7-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, vladimir.murzin-5wv7dgnIgG8@public.gmane.org, panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, andre.przywara-5wv7dgnIgG8@public.gmane.org, cmetcalf-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sandeepa.s.prabhu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shijie.huang-5wv7dgnIgG8@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, suzuki.poulose-5wv7dgnIgG8@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 7:46 AM, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The GISB bus can support addresses beyond 32-bits.  So this commit
> corrects support for reading a captured 64-bit address into a 64-bit
> variable by obtaining the high bits from the ARB_ERR_CAP_HI_ADDR
> register (when present) and then outputting the full 64-bit value.
>
> It also removes unused definitions.
>
> Fixes: 44127b771d9c ("bus: add Broadcom GISB bus arbiter timeout/error handler")
> Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/bus/brcmstb_gisb.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/bus/brcmstb_gisb.c b/drivers/bus/brcmstb_gisb.c
> [snip]
> @@ -119,6 +116,16 @@ static u32 gisb_read(struct brcmstb_gisb_arb_device *gdev, int reg)
>                 return ioread32(gdev->base + offset);
>  }
>
> +static u64 gisb_read_address(struct brcmstb_gisb_arb_device *gdev)
> +{
> +       u64 value;
> +
> +       value = (u64)gisb_read(gdev, ARB_ERR_CAP_ADDR);

Unlike the one on the next line, this cast can be omitted.

> +       value |= (u64)gisb_read(gdev, ARB_ERR_CAP_HI_ADDR) << 32;
> +
> +       return value;
> +}
> [snip]

Acked-by: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
