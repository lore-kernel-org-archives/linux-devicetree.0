From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio: Add GPIO driver for Spreadtrum SC9860 platform
Date: Thu, 1 Feb 2018 17:12:50 +0200
Message-ID: <CAHp75VdrSC6dePsebN36v4iigDa9o3996cm3Wu27CrAZBeSLgg@mail.gmail.com>
References: <2834309f69a1ec37b84a33f153a3d0b90336bcc6.1517313987.git.baolin.wang@linaro.org>
 <cccc1addb9c0cc541b676dbad005ec341d12d165.1517313987.git.baolin.wang@linaro.org>
 <CAHp75Vcig869pUQ5yK1b=GpXinhYkpw1q29OVKSs_7EqP4Hknw@mail.gmail.com>
 <CAMz4kuL9r+97_rDihgKD_TyNaDQ3aCk7go6e4mB24QOpovFYJg@mail.gmail.com>
 <CAHp75VcYQMYNmW9-MkOKA5TWV2JgNfqnUB22s1qB4Z0ZZbTG2g@mail.gmail.com>
 <CAMz4kuLO=zRqg72=7dC2fLHyVcEOcsU0PqiZM8XEYC3TGT1fYA@mail.gmail.com> <20180201122230.GC690@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180201122230.GC690-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 1, 2018 at 2:22 PM, Marcus Folkesson
<marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Feb 01, 2018 at 11:08:46AM +0800, Baolin Wang wrote:

> Then you could replace

> +subsys_initcall(sprd_gpio_init);

> module_platform_driver(sprd_gpio_driver);

It's not an equivalent when built-in


-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
