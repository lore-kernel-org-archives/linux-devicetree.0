From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 10/10] clk: versatile: add versatile OSC support
Date: Fri, 23 May 2014 12:13:59 -0700
Message-ID: <20140523191359.23136.57893@quantum>
References: <1400620176-7239-1-git-send-email-robherring2@gmail.com>
 <1400620176-7239-11-git-send-email-robherring2@gmail.com>
 <CACRpkdbjAa6Y-EVwK=D9eiA6JoW+pgxtnHCsrZSTZOY5uozMpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbjAa6Y-EVwK=D9eiA6JoW+pgxtnHCsrZSTZOY5uozMpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Linus Walleij (2014-05-23 06:31:26)
> On Tue, May 20, 2014 at 11:09 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> > From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Versatile platforms share the same OSC programming model as Integrator
> > platforms. Add the necessary parameters and init functions for Versatile.
> >
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/clk/versatile/Makefile         |  3 +--
> >  drivers/clk/versatile/clk-integrator.c | 35 ++++++++++++++++++++++++++++++++--
> 
> So then this is a good opportunity to rename that file from clk-integrator.c
> to something else, right? Usually we use "versatile" to refer to the
> whole family of boards but other names are possible I guess.
> 
> Apart from that it looks good :-)

Looks good to me too. Rob will you incorporate the file name change?

Regards,
Mike

> 
> Yours,
> Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
