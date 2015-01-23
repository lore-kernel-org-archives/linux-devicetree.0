From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2] Removes OF_UNITTEST dependency on OF_DYNAMIC config symbol
Date: Fri, 23 Jan 2015 14:03:58 +0100
Message-ID: <CAMuHMdUzO5E-+BrxQPnbd4w-MAU_hGctAg+1_dOM-hV7dM+SDw@mail.gmail.com>
References: <1420960791-26761-1-git-send-email-gaurav.minocha.os@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420960791-26761-1-git-send-email-gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 11, 2015 at 8:19 AM, Gaurav Minocha
<gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patch intends to remove the unittests dependency on
> the functions defined in dynamic.c. So, rather than calling
> of_attach_node defined in dynamic.c, minimal functionality
> required to attach a new node is re-defined in unittest.c.
> Also, now after executing the tests the test data is not
> removed from the device tree so there is no need to call
> of_detach_node.

Could there be unwanted side effects of not removing the test data?

> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c

> @@ -1475,9 +1432,6 @@ static int __init of_selftest(void)
>         of_selftest_platform_populate();
>         of_selftest_overlay();
>
> -       /* removing selftest data from live tree */
> -       selftest_data_remove();
> -
>         /* Double check linkage after removing testcase data */

You forgot to remove the comment above.

>         of_selftest_check_tree_linkage();

Is this test still relevant now the testcase data has been removed?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
