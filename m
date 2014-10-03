From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: Re: [PATCH v3] dt-bindings: Add a clocks property
 to the simple-framebuffer binding
Date: Fri, 3 Oct 2014 23:26:33 +0200
Message-ID: <CAMuHMdVSyqJA6uTPiemco0guhG1MKgkCBV7Tik-Ndd_fs28=NQ@mail.gmail.com>
References: <1412345120-24588-1-git-send-email-hdegoede@redhat.com>
	<CAL_JsqKU2n8p=YfJua3k-mR40bG_4SiZY8_-SL-MXtuWN5NeHg@mail.gmail.com>
	<542EDE11.3010802@redhat.com>
	<CAL_Jsq+3c7ToCGaR4Nz7dDXvebBKzzMv85swzy2mzOou+gM5iw@mail.gmail.com>
	<CAKON4OxrcgWvJM_BCKwLDRBodaFC1h8Csu_srzjJSM=L+gpuaA@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQJP74GSUDRBCVJXSQQKGQEQE32UTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAKON4OxrcgWvJM_BCKwLDRBodaFC1h8Csu_srzjJSM=L+gpuaA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 3, 2014 at 10:55 PM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Oct 2, 2014 at 9:46 AM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> On Thu, Oct 2, 2014 at 3:34 PM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Does the clock and regulator cleanup happen before drivers can load
>>> off from initrd? I didn't think it did but I might be wrong.
>>
>> Yes
>>
>> drivers/base/power/domain.c:late_initcall(genpd_poweroff_unused);
>> drivers/clk/clk.c:late_initcall_sync(clk_disable_unused);
>> drivers/regulator/core.c:late_initcall_sync(regulator_init_complete);
>
> What do you think about putting these calls onto an ioctl somewhere
> and then eliminating the late_initcall(..)? A tiny user space app
> could then hit that ioctl after all of the loadable device drivers are
> loaded. Add the command to make this ioctl call to busybox or udev.
> After all, it is not fatal if these calls aren't made, all they do is
> save power. Add a link in rc.d or somewhere similar to run this app at
> the appropriate time.
>
> Switching these over to an ioctl allows a window to be opened for
> device specific driver loading before the clock/regulator clean up
> happens.
>
> Now all of this mess of protecting clocks and regulator disappears.
> Instead get the device specific drivers written and loaded, then run
> the cleanup app which hits the ioctl(). All of the correct
> clock/regulators will be claimed and then this clean code will do the
> right thing.
>
> From my perspective it appears that this cleanup is being done too
> early which then triggers a need to protect things from cleanup.

Not doing the cleanup doesn't help.

If someone else calls clk_disable() on a clock which shares a parent
with the clock you're silently using, that clock will still be disabled.
This can happen at any time.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
