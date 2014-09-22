From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Mon, 22 Sep 2014 12:25:00 +0200
Message-ID: <CAMuHMdXabza0zYkaHqfF7jykHJFDf8kGTc9oYDi-3hK+6xXvLw@mail.gmail.com>
References: <20140620141807.45761bd0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20140620141807.45761bd0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Magnus Damm <damm+renesas@opensource.se>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 20, 2014 at 6:18 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the staging tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> drivers/staging/board/board.c: In function 'find_by_address':
> drivers/staging/board/board.c:14:3: error: implicit declaration of function 'of_can_translate_address' [-Werror=implicit-function-declaration]
>    if (of_can_translate_address(dn)
>    ^
>
> Caused by commit 382063d91e15 ("staging: board: Initial board staging
> support").

Or by commit d9c6866be8a145e32da616d8dcbae806032d75b5
Author: Rob Herring <robh@kernel.org>
Date:   Wed May 7 15:23:56 2014 -0500

    of: kill off of_can_translate_address

;-)

> I have disabled that driver for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 20 Jun 2014 14:14:17 +1000
> Subject: [PATCH] staging: board: disable
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/staging/board/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/board/Kconfig b/drivers/staging/board/Kconfig
> index 09d94b48c9c9..7eda0b8b7aab 100644
> --- a/drivers/staging/board/Kconfig
> +++ b/drivers/staging/board/Kconfig
> @@ -1,6 +1,7 @@
>  config STAGING_BOARD
>         boolean "Staging Board Support"
>         depends on OF_ADDRESS
> +       depends on BROKEN
>         help
>           Select to enable per-board staging support code.
>
> --
> 2.0.0

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
