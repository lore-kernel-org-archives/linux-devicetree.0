From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Adding selftest testdata dynamically into live tree
Date: Mon, 30 Jun 2014 23:49:10 -0500
Message-ID: <CAL_Jsq+AJKE2krv1EfLi5fFzZEVd1HVEiHf6F8zLLPU97jUUwQ@mail.gmail.com>
References: <1404085743-6974-1-git-send-email-gaurav.minocha.os@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404085743-6974-1-git-send-email-gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gaurav.minocha-cmaem7PIVQRC8prJL3GQQw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 29, 2014 at 6:49 PM, Gaurav Minocha
<gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patch attaches selftest's device tree data (required by /drivers/of/selftest.c)
> dynamically into live device tree. First, it links selftest device tree data into the
> kernel image and then iterates over all the nodes and attaches them into the live tree.
>
> This patch will remove the manual process of addition and removal of selftest device
> tree data into the machine's dts file.
>
> Tested successfully with current selftest's testcases.

Perhaps a follow-up patch would be to remove the added nodes. I don't
think that would be dependent on the overlay support. One comment
below, otherwise:

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


>
> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/versatile-pb.dts                 |    2 -
>  drivers/of/Kconfig                                 |    3 +-
>  drivers/of/Makefile                                |    3 +-
>  drivers/of/selftest.c                              |  102 ++++++++++++++++++++
>  .../{testcases.dtsi => testcases.dts}              |    1 +
>  5 files changed, 107 insertions(+), 4 deletions(-)
>  rename drivers/of/testcase-data/{testcases.dtsi => testcases.dts} (92%)

[...]

> +/**
> + *     selftest_data_init - Reads, copies data from
> + *     linked tree and attaches it to the live tree
> + */
> +static int selftest_data_init(void)

This can be __init.

> +{
> +       int size;
> +       extern uint8_t __dtb_testcases_begin[];
> +       extern uint8_t __dtb_testcases_end[];
> +
> +       selftest_data = (void *)__dtb_testcases_begin;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
