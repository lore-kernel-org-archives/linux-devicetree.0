From: Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] of: fix declaration of of_io_request_and_map
Date: Sat, 19 Dec 2015 12:09:14 +0530
Message-ID: <20151219063914.GB14071@sudip-pc>
References: <1449564475-10724-1-git-send-email-sudipm.mukherjee@gmail.com>
 <CAL_Jsq+f-LLfN4Q4bLFGhXj9KRb4aj7TRExuAUZbxrEtSbAW5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+f-LLfN4Q4bLFGhXj9KRb4aj7TRExuAUZbxrEtSbAW5Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 17, 2015 at 11:55:28AM -0600, Rob Herring wrote:
> On Tue, Dec 8, 2015 at 2:47 AM, Sudip Mukherjee
> <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > We are having build failure with linux-next for sparc allmodconfig with
> > the error messages:
> >
> > drivers/built-in.o: In function `meson6_timer_init':
> > meson6_timer.c:(.init.text+0x5fe8): undefined reference to `of_io_request_and_map'
> > drivers/built-in.o: In function `mtk_timer_init':
> > mtk_timer.c:(.init.text+0x6af0): undefined reference to `of_io_request_and_map'
> > drivers/built-in.o: In function `asm9260_timer_init':
> > asm9260_timer.c:(.init.text+0x6c48): undefined reference to `of_io_request_and_map'
> >
> > CONFIG_OF is defined for sparc so it is expected that we have a
> > definition of of_io_request_and_map() but of/address.c is only compiled
> > if it is !SPARC. In other words, CONFIG_OF_ADDRESS is not defined for
> > sparc so we get the build failure.
> >
> > Fixes: e572f844ca66 ("clocksource/drivers/meson6: Add the COMPILE_TEST option")
> > Fixes: bec8c4617611 ("clocksource/drivers/mediatek: Add the COMPILE_TEST option")
> > Fixes: 4a373b45f94a ("clocksource/drivers/asm9260: Add the COMPILE_TEST option")
> > Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Sudip Mukherjee <sudip-ofJRbWXBVFamYgehrs7/Lw@public.gmane.org>
> 
> Moved the include out of the ifdefs and applied, thanks.

Thanks, I was wondering if the include should be within the ifdefs or
outside. But since the original code had it inside ifdefs, i thought its
better to have it inside.

regards
sudip
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
