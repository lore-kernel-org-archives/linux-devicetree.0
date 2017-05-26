From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/5 v2] clk: qcom: Update DT bindings for the
 MSM8660/APQ8060 RPMCC
Date: Fri, 26 May 2017 14:57:06 +0300
Message-ID: <20170526115706.GY30730@tbergstrom-lnx.Nvidia.com>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
 <CACRpkdbXEFeVkD8rETyrnuoAxUvnFt2BL07UsXuXfSnq3Qdyfw@mail.gmail.com>
 <CACRpkdYvwwJcxKPtKUyZBLWsmjXji7pHDKNz9NRTETqj2P3drQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYvwwJcxKPtKUyZBLWsmjXji7pHDKNz9NRTETqj2P3drQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 24, 2017 at 11:16:22AM +0200, Linus Walleij wrote:
> On Wed, May 17, 2017 at 9:23 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, Apr 19, 2017 at 11:13 AM, Linus Walleij
> > <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >
> >> These compatible strings need to be added to extend support
> >> for the RPM CC to cover MSM8660/APQ8060. We also need to add
> >> enumberators to the include file for a few clocks that were
> >> missing.
> >>
> >> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> ---
> >> ChangeLog v1->v2:
> >> - Collect Rob's ACK
> >
> > Ping on this patch set. It's been sitting for a month and was
> > not changed from v1 either, if you want me to change something
> > it'd be good to know.
> 
> Ping on this again.
> 
> I am sorry if you guys are swamped, I just don't know what to do,
> clock drivers are starting to become the bottleneck for everything
> I do. I bet the ARM SoC maintainers must be noticing it too.
> 
> Unfortunately I am already managing two subsystems and cannot
> volunteer to help out with a third, I would blow a fuse.
> 
> But it seems the CLK subsystem could use some co-maintainers?
> 
> Peter de Schrijver is a big authority in all things clocking (I clearly
> remember him discussing the subject a lot at conferences with lots
> of good points) so I would ask him to help, but I don't know how busy
> Peter may be with nVidia business etc these days...
> 

I'm usually rather busy yes, but I could try to find some time for this if
asked for.

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
